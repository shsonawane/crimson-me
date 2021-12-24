
<%@page import="com.utility.SendMailSSL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.utility.Encryptor"%>
<%@page import="com.db.Database"%>
<%@page import="java.util.UUID"%>
<%@page import="com.utility.PasswordAuthentication"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
    if (request.getMethod().equals("POST")) {
        String userid = request.getParameter("uname");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        Date dob = Date.valueOf(request.getParameter("bday"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String pass = new PasswordAuthentication().hash(request.getParameter("password").toCharArray());
        String token = UUID.randomUUID().toString();
        byte activated = 0;

        Database db = new Database(conn.getConn());
        String key = new Encryptor().getSecretEncryptionKey();
        String iv = new Encryptor().getInitVector();
        String path = request.getRequestURL().toString().replaceFirst("WEB-INF/jsp/action/signupaction.jsp", "");
        String url = path + "activation?uid=" + URLEncoder.encode(userid, "UTF-8") + "&key=" + URLEncoder.encode(key, "UTF-8") + "&iv=" + URLEncoder.encode(iv, "UTF-8") + "&ct=" + URLEncoder.encode(new Encryptor().encrypt(key, iv, token), "UTF-8");
        System.out.println(url);
        if (db.addUser(userid, fname, lname, dob, gender, email, pass, activated) && db.addToken(userid, token) && new SendMailSSL().sendMail(url, email + "@muj.manipal.edu")) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/serv/signupconf.jsp?email=" + URLEncoder.encode(email, "UTF-8")+"&name="+URLEncoder.encode(fname+" "+lname, "UTF-8")+"&uname="+URLEncoder.encode(userid, "UTF-8"));
            dispatcher.forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_GATEWAY);
        }
    }else{
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
%>