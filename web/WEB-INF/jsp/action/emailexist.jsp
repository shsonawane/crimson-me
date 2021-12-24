
<%@page import="com.db.User"%>
<%@page import="com.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
        String emailid = request.getParameter("email");
        Database db = new Database(conn.getConn());
        User user = db.getUserByEmail(emailid);
        if (user != null) {
            response.sendError(HttpServletResponse.SC_FOUND);
        }
%>