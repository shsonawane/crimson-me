<%-- 
    Document   : image
    Created on : 18 Nov, 2017, 2:52:26 AM
    Author     : Shubham
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.db.Database"%>
<%@page contentType="image/gif" pageEncoding="UTF-8"%>

<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />

<%
  int id ;
  Database db = new Database(conn.getConn());
  if ( request.getParameter("id") != null ){
    id = Integer.parseInt(request.getParameter("id")) ;   
    try{  
       // get the image from the database
       byte[] imgData = db.getImage(id) ;   
       // display the image
       response.setContentType("image/gif");
       OutputStream os = response.getOutputStream();
       os.write(imgData);
       os.flush(); 
       os.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      throw e;
    }
  }
%>