
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
        String pp = request.getParameter("pp");
        String about = request.getParameter("about");
        String mobno = request.getParameter("mobno");
        String interest = request.getParameter("interest");
        String insta = request.getParameter("insta");
        String snapchat = request.getParameter("snapchat");
        String twitter = request.getParameter("twitter");
        String linkedin = request.getParameter("linked");
        String uname = request.getParameter("uname");

        System.out.println(pp);
        System.out.println(about);
        System.out.println(mobno);
        System.out.println(interest);
        System.out.println(insta);
        System.out.println(snapchat);
        System.out.println(twitter);
        System.out.println(linkedin);
        System.out.println(uname);
        byte[] imagedata = DatatypeConverter.parseBase64Binary(pp.substring(pp.indexOf(",") + 1));
        Database db = new Database(conn.getConn());

        if (db.addUserProfile(uname, db.addImage(imagedata, uname) + "", about, mobno, interest, insta, snapchat, twitter, linkedin)) {
            System.out.println("Profile Successfully Created.....");
            User user = db.getUser(uname);
            if (user.isActivated()) {
                request.getSession().setAttribute("user", user);
                Random random = new SecureRandom();
                String token = new BigInteger(160, random).toString(32);
                request.getSession().setAttribute("token", token);
                response.sendRedirect(request.getContextPath() + "/user?uname=" + uname + "&token=" + URLEncoder.encode(token, "UTF-8"));
            } else {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/serv/signupconf.jsp?email=" + URLEncoder.encode(user.getEmail(), "UTF-8") + "&name=" + URLEncoder.encode(user.getFname() + " " + user.getLname(), "UTF-8") + "&uname=" + URLEncoder.encode(uname, "UTF-8"));
                dispatcher.forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    } else {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
%>