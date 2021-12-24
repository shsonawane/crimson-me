
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Random"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="com.db.User"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
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

        String npass = new PasswordAuthentication().hash(request.getParameter("password").toCharArray());
        String cpass = request.getParameter("curpassword");
        String uname = request.getParameter("uname");

        Database db = new Database(conn.getConn());
        User user = db.getUser(uname);
        if (user != null) {
            if (new PasswordAuthentication().authenticate(cpass.toCharArray(), user.getPassword())) {
                if (db.updatePassword(uname, npass)) {
                    if (user.isActivated()) {
                        request.getSession().setAttribute("user", user);
                        Random random = new SecureRandom();
                        String token = new BigInteger(160, random).toString(32);
                        request.getSession().setAttribute("token", token);
                        response.sendRedirect(request.getContextPath() + "/settings?done=Password%20Successfully%20Updated&uname=" + uname + "&token=" + URLEncoder.encode(token, "UTF-8"));
                    } else {
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/serv/signupconf.jsp?email=" + URLEncoder.encode(user.getEmail(), "UTF-8") + "&name=" + URLEncoder.encode(user.getFname() + " " + user.getLname(), "UTF-8") + "&uname=" + URLEncoder.encode(uname, "UTF-8"));
                        dispatcher.forward(request, response);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                }
            } else {
                //response.sendRedirect(request.getContextPath() + "/home?error");
                response.sendRedirect(request.getContextPath() + "/settings?error&uname=" + uname + "&token=" + URLEncoder.encode((String)request.getSession().getAttribute("token"), "UTF-8"));
                   
            }
        }
    } else {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }

%>