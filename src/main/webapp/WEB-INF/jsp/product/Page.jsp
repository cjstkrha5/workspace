<%@page import="java76.pms.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// r: Result List
 int rTotalList = 0;         // Total row (List)
 int rCurrentPage = 1;   // Current Page-Num
 int rPageSize = 20;      // Number of row for each page
 int rPageRange = 10;   // Range of page number List [1,2, .. 10]
 int rTotalPage = 0;       // Total page number 
 
 // 1. get Total List Size from search result
 List<Product> list = (List<Product>)request.getAttribute("projects");
 rTotalList = list.size();
 
 // 2. get Current Page-Num from Request
 String cPage = request.getParameter("currentPage");
 if(cPage != null && cPage.length() > 0) {
     rCurrentPage = Integer.parseInt(cPage);
 } else {
     rCurrentPage = 1;
 }
 
 // 3. get Total Page
 if (rTotalList % rPageSize == 0 ){
     rTotalPage = rTotalList / rPageSize;
 } else {
     rTotalPage = rTotalList / rPageSize + 1;
 }
 
 // 4. get Start PageRange
 int rPageRangeGroup = 0;
 int rStartPageRange = 1;
 
 // 4.1 get Current PageRange Group: rPageRangeGroup -> 1, 2, 3...
 if(rCurrentPage % rPageRange == 0) {
     rPageRangeGroup = rCurrentPage / rPageRange;
 } else {
     rPageRangeGroup = rCurrentPage / rPageRange + 1;
 }
 // 4.2 get Start PageRange-First Number (1, 21, 41, ...)
 rStartPageRange = (rPageRangeGroup - 1) * rPageRange + 1;
 
 // 5. get StartRow/End Row
 int rStartRow = (rCurrentPage - 1) * rPageSize + 1;
 int rEndRow = rCurrentPage * rPageSize; 
 
%>
 
[page 번호 출력 부분]  [결과] => [Prev] 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 [Next]
-----------------------------------------------------------------------
 <%
 
    // [Prev]
    if(rPageRangeGroup > 1) {
        int tPrev = rStartPageRange - 1;
        out.println("<a href='javascript:changePage(" + tPrev + ");'>[Prev]</a>&nbsp;");
    }
       
  // Print Page-Num
 for(int i = rStartPageRange; i < rStartPageRange + rPageRange;i++)
 {
     if(i > rTotalPage) break;
     if(i > rStartPageRange) out.println(" | ");
             
     if(i == rCurrentPage) {
      out.println("<font color=red><b>" + i + "</b></font>");
     } else {
      out.println("<a href='javascript:changePage(" + i + ");'>" + i + "</a>");
     }
 }
 
   // [Next]
    if(rPageRangeGroup-1 < rTotalPage/rPageRange) {
        int tNext = rStartPageRange + rPageRange;
        out.println("&nbsp;<a href='javascript:changePage(" + tNext + ");'>[Next]</a>");
    }
    
 %>
 
