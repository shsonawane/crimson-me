
<%@page import="com.db.User"%>
<%@page import="com.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
    String userid = request.getParameter("uname");
    Database db = new Database(conn.getConn());
    User user = db.getUser(userid);
    if (user != null) {
        response.sendError(HttpServletResponse.SC_FOUND);
    }
%>