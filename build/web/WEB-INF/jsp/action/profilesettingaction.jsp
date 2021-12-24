
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

        String pp = request.getParameter("dp");
        String about = request.getParameter("aboutme");
        String mobno = request.getParameter("mobno");
        String interest[] = request.getParameterValues("intr");
        String insta = request.getParameter("insta");
        String snapchat = request.getParameter("snap");
        String twitter = request.getParameter("twitter");
        String linkedin = request.getParameter("linked");
        String uname = request.getParameter("uname");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String intr = interest[0] + "::" + interest[1] + "::" + interest[2] + "::" + interest[3];
        // System.out.println(pp);
        Database db = new Database(conn.getConn());
        String imageid = db.getUserProfile(uname).getPicture();
        if(pp.contains("data:image")){
            byte[] imagedata = DatatypeConverter.parseBase64Binary(pp.substring(pp.indexOf(",") + 1));
            imageid = db.addImage(imagedata, uname) + "";
        }
        if (db.updateUser(fname, lname, dob, gender, uname) || db.addUserProfile(uname, imageid, about, mobno, intr , insta, snapchat, twitter, linkedin)) {
            System.out.println("Profile Successfully Created.....");
            User user = db.getUser(uname);
            if (user.isActivated()) {
                request.getSession().setAttribute("user", user);
                Random random = new SecureRandom();
                String token = new BigInteger(160, random).toString(32);
                request.getSession().setAttribute("token", token);
                response.sendRedirect(request.getContextPath() + "/settings?done=Profile%20Successfully%20Updated&uname=" + uname + "&token=" + URLEncoder.encode(token, "UTF-8"));
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