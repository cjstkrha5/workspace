package java76.pms.controller;

import java.io.File;
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
import java76.pms.domain.Member;
import java76.pms.util.MultipartHelper;

@Controller
@RequestMapping("/member/*")
public class MemberController {  
  
  private static final Logger logger = Logger.getLogger(MemberController.class); 
  
  public static final String SAVE_DIR = "/image"; 
  @Autowired MemberDao memberDao;
  @Autowired ServletContext servletContext;
  
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
    
    List<Member> members = memberDao.selectList(paramMap);
    
    request.setAttribute("members", members);
    
    return "member/MemberList";
  }
  
  @RequestMapping(value="add", method=RequestMethod.GET)
  public String form() {
    return "member/MemberForm";
  }
  
  @RequestMapping(value="add", method=RequestMethod.POST)
  public String add(
      Member member,
      MultipartFile file) throws Exception {

    logger.debug("add");
    if (file.getSize() > 0) {
      String newFileName = MultipartHelper.generateFilename(file.getOriginalFilename());
      File attachfile = new File(servletContext.getRealPath(SAVE_DIR) + "/" + newFileName);
      file.transferTo(attachfile);
      member.setImage(newFileName);
    }
    logger.debug("add");
    memberDao.insert(member);
    
    return "redirect:list.do";
  }
  
  @RequestMapping("detail")
  public String detail(
      String id,
      Model model) throws Exception {
    logger.debug("detail");
    Member member = memberDao.selectOne(id);
    model.addAttribute("member", member);
    return "member/MemberDetail";
  }

  @RequestMapping("mydetail")
  public String mydetail(
      String id,
      Model model) throws Exception {
    logger.debug("detail");
    Member member = memberDao.selectOne(id);
    model.addAttribute("member", member);
    return "member/MyDetail";
  }
  
  @RequestMapping(value="update", method=RequestMethod.POST)
  public String update(
      Member member,
      Model model) throws Exception {
    logger.debug("update");
    if (memberDao.update(member) <= 0) {
      model.addAttribute("errorCode", "401");
      return "member/MemberAuthError";
    } 
    return "redirect:list.do";
  }
  
  @RequestMapping("delete")
  public String delete(String id, String password, Model model){
    logger.debug("delete");
    HashMap<String,Object> paramMap = new HashMap<>();
    paramMap.put("id", id);
    paramMap.put("password", password);
    
    if (memberDao.delete(paramMap) <= 0) {
      model.addAttribute("errorCode", "401");
      return "member/MemberAuthError";
    } 

    return "redirect:list.do";
  }
  
  
  @RequestMapping("search")
  public String search(
      String name,
      Model model) throws Exception {
    logger.debug("search");
    
    List<Member> members = memberDao.search(name);
    
    model.addAttribute("members", members);

    return "member/MemberList";
  }
  
}
