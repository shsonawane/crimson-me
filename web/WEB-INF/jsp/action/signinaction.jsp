
<%@page import="java.net.URLEncoder"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Random"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="com.db.Database"%>
<%@page import="com.db.User"%>
<%@page import="com.utility.PasswordAuthentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
    if (request.getMethod().equals("POST")) {
        String userid = request.getParameter("username");
        String pass = request.getParameter("password");
        Database db = new Database(conn.getConn());
        User user = db.getUser(userid);
        if (user != null) {
            if (new PasswordAuthentication().authenticate(pass.toCharArray(), user.getPassword())) {
                if (user.isActivated()) {
                    request.getSession().setAttribute("user", user);
                    Random random = new SecureRandom();
                    String token = new BigInteger(160, random).toString(32);
                    request.getSession().setAttribute("token", token);
                    response.sendRedirect(request.getContextPath() + "/user?uname=" + userid + "&token=" + URLEncoder.encode(token, "UTF-8"));
                } else {
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/serv/signupconf.jsp?email=" + URLEncoder.encode(user.getEmail(), "UTF-8") + "&name=" + URLEncoder.encode(user.getFname() + " " + user.getLname(), "UTF-8")+"&uname="+URLEncoder.encode(userid, "UTF-8"));
                    dispatcher.forward(request, response);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/home?error");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/home?error");
        }
    } else {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
%>