
<%@page import="java.util.UUID"%>
<%@page import="com.utility.SendMailSSL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.utility.Encryptor"%>
<%@page import="com.db.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
    String userid = request.getParameter("uname");
    String email = request.getParameter("email");
    Database db = new Database(conn.getConn());
    String key = new Encryptor().getSecretEncryptionKey();
    String iv = new Encryptor().getInitVector();
    String path = request.getRequestURL().toString().replaceFirst("WEB-INF/jsp/action/resendemail.jsp", "");
    String token = UUID.randomUUID().toString();
    String url = path + "activation?uid=" + URLEncoder.encode(userid, "UTF-8") + "&key=" + URLEncoder.encode(key, "UTF-8") + "&iv=" + URLEncoder.encode(iv, "UTF-8") + "&ct=" + URLEncoder.encode(new Encryptor().encrypt(key, iv, token), "UTF-8");
    System.out.println(url);
    if (db.updateToken(userid, token) && new SendMailSSL().sendMail(url, email + "@muj.manipal.edu")) {
        out.print("email sucessfull.");
    } else {
        response.sendError(HttpServletResponse.SC_BAD_GATEWAY);
    }
%>
