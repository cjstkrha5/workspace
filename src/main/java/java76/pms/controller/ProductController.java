package java76.pms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java76.pms.dao.MemberDao;
import java76.pms.dao.ProductDao;
import java76.pms.dao.ReplyDao;
import java76.pms.domain.Member;
import java76.pms.domain.Product;
import java76.pms.domain.Reply;
import java76.pms.util.MultipartHelper;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/product/*")
public class ProductController {  
  
  private static final Logger logger = Logger.getLogger(ProductController.class); 
  
  public static final String SAVE_DIR = "/photo"; 
  @Autowired ProductDao productDao;
  @Autowired MemberDao memberDao;
  @Autowired ReplyDao replyDao;

  @Autowired ServletContext servletContext;
  
  public static void makeThumbImg(String saveDir, String newFileName) throws IOException {
    Thumbnails.
    of(saveDir + "/" + newFileName).
    size(60, 60).
    toFile(saveDir + "/s-" + newFileName);
  }
  
  @RequestMapping("list")
  public String list(
      @RequestParam(defaultValue="1")int pageNo,
      @RequestParam(defaultValue="10")int pageSize,
      @RequestParam(defaultValue="no")String keyword,
      @RequestParam(defaultValue="desc")String align,
      HttpServletRequest request) throws Exception {
    
    logger.debug("list");
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("startIndex", (pageNo - 1) * pageSize);
    paramMap.put("size", pageSize);
    paramMap.put("keyword", keyword);
    paramMap.put("align", align);
    
    List<Product> products = productDao.selectList(paramMap);
    request.setAttribute("pageCount", (products.size()/10));
    request.setAttribute("products", products);
    return "product/ProductList";
  } 
  
  @RequestMapping(value="add", method=RequestMethod.GET)
  public String form() {
    return "product/ProductForm";
  } 
  
  @RequestMapping(value="add", method=RequestMethod.POST)
  public String add(
      Product product,
      MultipartFile file) throws Exception {
    
    logger.debug("add");
    if (file.getSize() > 0) {
      String newFileName = MultipartHelper.generateFilename(file.getOriginalFilename());
      File attachfile = new File(servletContext.getRealPath(SAVE_DIR) + "/" + newFileName);
      file.transferTo(attachfile);
      makeThumbImg(servletContext.getRealPath(SAVE_DIR), newFileName);
      product.setPhoto(newFileName);
    }
    

    productDao.insert(product);
    
    return "redirect:list.do";
  }
  
  @RequestMapping("detail")
  public String detail(
      String name,
      Model model) throws Exception {
    logger.debug("detail");
    Product product = productDao.selectOne(name);
    model.addAttribute("product", product);
    List<Reply> replys = replyDao.selectList(name);
    model.addAttribute("replys", replys);

    return "product/ProductDetail";
  }
  
  @RequestMapping("detail2")
  public String detail2(
      String name,
      Model model) throws Exception {
    logger.debug("detail");
    Product product = productDao.selectOne(name);
    model.addAttribute("product", product);
    List<Reply> replys = replyDao.selectList(name);
    model.addAttribute("replys", replys);
    
    return "product/ProductDetail2";
  }


  @RequestMapping(value="update", method=RequestMethod.POST)
  public String update(
      Product product,
      MultipartFile file,
      Model model) throws Exception {
    logger.debug("update");

    if (file.getSize() > 0) {
      String newFileName = MultipartHelper.generateFilename(file.getOriginalFilename());
      File attachfile = new File(servletContext.getRealPath(SAVE_DIR) + "/" + newFileName);
      file.transferTo(attachfile);
      makeThumbImg(servletContext.getRealPath(SAVE_DIR), newFileName);
      product.setPhoto(newFileName);
    } else if (product.getPhoto().length() == 0) {
      product.setPhoto(null);
    }
    if (productDao.update(product) <= 0) {
      model.addAttribute("errorCode", "401");
      return "product/ProductAuthError";
    } 
    return "redirect:list.do";
  }

  
  
  @RequestMapping("delete")
  public String delete(String name, Model model) throws Exception {
    logger.debug("delete");
    
    if (productDao.delete(name) <= 0) {
      model.addAttribute("errorCode", "401");
      return "product/ProductAuthError";
    } 

    return "redirect:list.do";
  }
  
  @RequestMapping("search")
  public String search(
      String kind,
      String genre,
      String name,
      Model model) throws Exception {
    logger.debug("search");

    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("kind", kind);
    paramMap.put("name", name);
    paramMap.put("genre", genre);
    
    if(kind.equals("DVD")) {
      kind = "dvd";
    }
    
    List<Product> products2 = productDao.search(paramMap);
    List<Product> products = new ArrayList<>(); 
    
    if(kind.equals("all") && !genre.equals("all")) {
      for(Product p : products2){
        if(p.getGenre().equals(genre)) { products.add(p); }
      }  
    } else if (!kind.equals("all") && genre.equals("all")) {
      for(Product p : products2){
        if(p.getKind().equals(kind)) { products.add(p); }
      }  
    } else if (!kind.equals("all") && !genre.equals("all")){
      for(Product p : products2){
        if(p.getKind().equals(kind) && p.getGenre().equals(genre)) { products.add(p); }
      }  
    } else if (kind.equals("all") && genre.equals("all")){
      for(Product p : products2){
        products.add(p);
      }
    }
    
    
    model.addAttribute("products", products);

    return "product/ProductList";
  }

  
  
  @RequestMapping(value="rent", method=RequestMethod.GET)
  public String rent(
      String name,
      Model model
      ) {
    
    model.addAttribute("name",name);
    return "product/ProductRent";
  }
  
  @RequestMapping(value="rent", method=RequestMethod.POST)
  public String rent(
      String name, String rentmember,
      Model model) throws Exception {
    logger.debug("rent");
    
    Product p = productDao.selectOne(name);
    int rentcount = p.getRentcount();
    if(rentcount == p.getAmount()) {
      model.addAttribute("errorCode", "대여 불가");
      return "product/ProductAuthError";
    }
    rentcount++;
    
    Member member = memberDao.selectOne(rentmember);
    String rentproduct = name+"/"+member.getRentproduct();
    String id = member.getId();
    rentmember = rentmember+"/"+p.getRentmember();
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("rentcount", rentcount);
    paramMap.put("rentmember", rentmember);
    paramMap.put("id", id);
    
    paramMap.put("id", id);
    paramMap.put("rentproduct", rentproduct);
    
    if (productDao.rent(paramMap) <  0) {
      model.addAttribute("errorCode", "401");
      return "product/ProductAuthError";
    } 
    
    if (memberDao.rent(paramMap) <  0) {
      model.addAttribute("errorCode", "401");
      return "product/MemberAuthError";
    } 
    
    String record = name+"/"+member.getRecord();
    HashMap<String,Object> paramMap2 = new HashMap<>();
    paramMap2.put("name", rentmember);
    paramMap2.put("record", record);
    if (memberDao.updateRecord(paramMap2) <  0) {
      model.addAttribute("errorCode", "401");
      return "product/MemberAuthError";
    } 
    
    return "redirect:list.do";
  }
  
  
  @RequestMapping(value="returnProduct", method=RequestMethod.GET)
  public String returnProduct(
      String name,
      Model model
      ) {
    model.addAttribute("name",name);
    return "product/ProductReturn";
  }
  
  @RequestMapping(value="returnProduct", method=RequestMethod.POST)
  public String returnProduct(
      String name, String rentmember,
      Model model) throws Exception {
    logger.debug("return");
    
    Product p = productDao.selectOne(name);
    int rentcount = p.getRentcount()-1;
    String[] m = p.getRentmember().split("/");
    String rentm = "";
    for(String member : m) {
      if(!member.equals(rentmember)) {
        rentm += member + "/";
      }
    }
    
    Member member = memberDao.selectOne(rentmember);
    String rentproduct = "";
    String[] rentproducts = member.getRentproduct().split("/");
    for(String rentp : rentproducts) {
      if(!member.equals(rentp)) {
        rentproduct += rentp + "/";
      }
    }
    
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("rentcount", rentcount);
    paramMap.put("name", name);
    paramMap.put("rentmember", rentm);
    
    paramMap.put("rentproduct", rentproduct);
    paramMap.put("id", rentmember);
    
    if (productDao.returnProduct(paramMap) < 0) {
      model.addAttribute("errorCode", "401");
      return "product/ProductAuthError";
    }
    
    if (memberDao.returnProduct(paramMap) < 0) {
      model.addAttribute("errorCode", "401");
      return "product/MemberAuthError";
    }
    
    return "redirect:list.do";
  }

}
