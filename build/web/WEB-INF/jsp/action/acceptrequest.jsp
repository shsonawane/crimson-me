<%-- 
    Document   : sendrequest
    Created on : 18 Nov, 2017, 2:22:47 PM
    Author     : Shubham
--%>


<%@page import="com.db.User"%>
<%@page import="com.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    String t = (String) request.getSession().getAttribute("token");
    if (!request.getParameter("token").equals(t)) {
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
    }
    String follower = request.getParameter("f1");
    String following = request.getParameter("f2");
    Database db = new Database(conn.getConn());
    if (!db.acceptRequest(follower, following)) {
        response.sendError(HttpServletResponse.SC_BAD_GATEWAY);
    }
    response.sendRedirect(request.getParameter("url"));
%>