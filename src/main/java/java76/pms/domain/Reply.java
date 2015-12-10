package java76.pms.domain;

import java.sql.Date;

public class Reply {
  protected String id;
  protected String productname;
  protected String reply;
  protected int no;
  protected Date date;
  
  
  
  public Date getDate() {
    return date;
  }
  


  public void setDate(Date date) {
    this.date = date;
  }
  


  public int getNo() {
    return no;
  }
  

  public void setNo(int no) {
    this.no = no;
  }
  

  public String getId() {
    return id;
  }
  
  public void setId(String id) {
    this.id = id;
  }
  
  public String getProductname() {
    return productname;
  }
  
  public void setProductname(String productname) {
    this.productname = productname;
  }
  
  public String getReply() {
    return reply;
  }
  
  public void setReply(String reply) {
    this.reply = reply;
  }
  
  
  
}
