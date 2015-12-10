create table auction_product (
  pno       int,
  kind      varchar(100) not null,
  name      varchar(100) not null,
  info      text,
  photo     varchar(100),
  sprice    int default 0,
  cprice   int default 0,
  eprice    int default 0,
  sdt       datetime,
  edt       datetime,
  bidder    varchar(100)
  constraint auction_product_pk primary key (pno)
);
alter table auction_p modify column pno int auto_increment;
번호, 종류, 상품명, 상품소개, 상품사진, 시작가, 진행가, 낙찰가, 낙찰자, 경매시작일, 경매종료일  


create table auction_member (
  id        varchar(100) not null,
  name      varchar(100) not null,
  tel       varchar(50),
  email     varchar(50) not null,
  pwd       varchar(50),
  purchase  text
  constraint member_pk primary key (id)
);

create table auction_reply (
  productname varchar(100) not null,
  id varchar(100) not null,
  reply varchar(1000),
  cre_dt datetime
);



