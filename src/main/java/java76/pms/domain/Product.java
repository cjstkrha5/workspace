package java76.pms.domain;

import java.sql.Date;

public class Product {
  
  protected int pno;
  protected String kind;
  protected String name;
  protected String info;
  protected String photo;
  protected int sprice; 
  protected int cprice;
  protected int eprice;
  protected Date sdt;
  protected Date edt;
  protected String bidder;
  
  
  public int getPno() {
    return pno;
  }
  
  public void setPno(int pno) {
    this.pno = pno;
  }
  
  public String getKind() {
    return kind;
  }
  
  public void setKind(String kind) {
    this.kind = kind;
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public String getInfo() {
    return info;
  }
  
  public void setInfo(String info) {
    this.info = info;
  }
  
  public String getPhoto() {
    return photo;
  }
  
  public void setPhoto(String photo) {
    this.photo = photo;
  }
  
  public int getSprice() {
    return sprice;
  }
  
  public void setSprice(int sprice) {
    this.sprice = sprice;
  }
  
  public int getCprice() {
    return cprice;
  }
  
  public void setCprice(int cprice) {
    this.cprice = cprice;
  }
  
  public int getEprice() {
    return eprice;
  }
  
  public void setEprice(int eprice) {
    this.eprice = eprice;
  }
  
  public Date getSdt() {
    return sdt;
  }
  
  public void setSdt(Date sdt) {
    this.sdt = sdt;
  }
  
  public Date getEdt() {
    return edt;
  }
  
  public void setEdt(Date edt) {
    this.edt = edt;
  }
  
  public String getBidder() {
    return bidder;
  }
  
  public void setBidder(String bidder) {
    this.bidder = bidder;
  }
  
  
}
