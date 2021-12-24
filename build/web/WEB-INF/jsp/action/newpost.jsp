
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
        String pic = request.getParameter("pic");
        String post = request.getParameter("post");
        String uname = request.getParameter("uname");
        byte[] imagedata = DatatypeConverter.parseBase64Binary(pic.substring(pic.indexOf(",") + 1));
        Database db = new Database(conn.getConn());
        if (!db.newPost(uname, post, db.addImage(imagedata, uname))) {
           response.sendError(HttpServletResponse.SC_BAD_GATEWAY);
        }
        response.sendRedirect(request.getParameter("url"));
%>