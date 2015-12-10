package java76.pms.domain;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable{
  /**
   * 
   */
  private static final long serialVersionUID = 1L;
  
  protected int     no;
  protected String  title;
  protected Date    startDate;
  protected Date    endDate;
  protected String  member;
  
 /* void setValue(String str) {
    String[] tokens = str.split(",");
    if (tokens.length < 4)
      return;
    title = tokens[0];
    startDate = Date.valueOf(tokens[1]); // yyyy-MM-dd ---> Date 객체 
    endDate = Date.valueOf(tokens[2]);
    member = tokens[3];
  }*/
  
  public Project() {
    System.out.println("Projcet()");
  }
  
  /*public Project(String str) {
    this.setValue(str);
  }
  */
  public Project(String title, Date startDate, Date endDate) {
    this.title = title;
    this.startDate = startDate;
    this.endDate = endDate;
  }


 
  
  @Override
  public String toString() {
    return "Project [no=" + no + ", title=" + title + ", startDate="
        + startDate + ", endDate=" + endDate + ", member=" + member + "]";
  }

  public int getNo() {
    return no;
  }
  
  public void setNo(int no) {
    this.no = no;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  public String getMember() {
    return member;
  }

  public void setMember(String member) {
    this.member = member;
  }
}
