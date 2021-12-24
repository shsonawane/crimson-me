<%@page import="com.utility.Encryptor"%>
<%@page import="com.db.Database"%>
<%@page import="com.db.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />

<%
    String uid = request.getParameter("uid");
    String key = request.getParameter("key");
    String iv = request.getParameter("iv");
    String ct = request.getParameter("ct");
    
    Database db = new Database(conn.getConn());

    String token = new Encryptor().decrypt(key, iv, ct);
    
    if (token.equals(db.getToken(uid + ""))) {
        if (db.activateAccount(uid)) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/serv/profileSetup.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    } else {
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
%>