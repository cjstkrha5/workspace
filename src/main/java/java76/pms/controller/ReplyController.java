package java76.pms.controller;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java76.pms.dao.ReplyDao;
import java76.pms.domain.Reply;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {  
  
  private static final Logger logger = Logger.getLogger(ReplyController.class); 
  
  @Autowired ReplyDao replyDao;
  
  @RequestMapping(value="add")
  public String add(String name, String content, String id) {
    HashMap<String,Object> replyMap = new HashMap<>();
    replyMap.put("id", id);
    replyMap.put("reply", content);
    replyMap.put("productname", name);
    replyDao.insert(replyMap);
    
    return "redirect:../product/list.do";
  }
 
  @RequestMapping(value="update")
  public String update(
      Reply reply,
      Model model) throws Exception {
    logger.debug("update");
    if (replyDao.update(reply) <= 0) {
      model.addAttribute("errorCode", "401");
      return "reply/ReplyAuthError";
    } 
    return "redirect:list.do";
  }
  
  @RequestMapping("delete")
  public String delete(int no, Model model){
    logger.debug("delete");
    
    if (replyDao.delete(no) <= 0) {
      model.addAttribute("errorCode", "401");
      return "reply/ReplyAuthError";
    } 

    return "redirect:list.do";
  }
  
  
}
