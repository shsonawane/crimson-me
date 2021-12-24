
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.db.Database"%>
<%@page import="com.db.UserProfile"%>
<%@page import="com.db.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    String t = (String) request.getSession().getAttribute("token");
    String search = request.getParameter("search");
    if (!request.getParameter("token").equals(t) && search == null) {
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
    }
    Database db = new Database(conn.getConn());
    User user = (User) request.getSession().getAttribute("user");
    UserProfile userProfile = db.getUserProfile(user.getUsername());
    String searchUrl = request.getContextPath() + "/search?uname=" + user.getUsername() + "&token=" + t + "&search=";
    String url = request.getContextPath() + "/search?" + request.getQueryString();
%>
<!DOCTYPE html>
<html>
    <title>CrimsonMe</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="resources/asset/css/theme1.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}



        .heading {
            font-size:70px;
            background-color:  black;
            padding:20px40px;
            border:none;
            color:white
        }


        #myInput {
            background-image: url('resources/asset/newse3.png');
            background-position: 2px 4px;
            background-repeat: no-repeat;
            width: 30%;
            font-size: 16px;
            padding: 12px 20px 2px 40px;
            border: 1px solid #ddd;
            margin-bottom: 4px;
            margin-top:4px;
            border-radius: 15px/50px;
        }

        .center-cropped {
            width: 100px;
            height: 100px;
            background-position: center center;
            background-repeat: no-repeat;
        }

        /* POP UP MODEL*/

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <body class="w3-theme-l5" style="background-image: url('resources/asset/back1.jpg');">

        <!-- Navbar -->
        <div class="w3-top">
            <div class="w3-bar w3-theme-d2 heading w3-left-align  w3-large ">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                <a href="<%=request.getContextPath() + "/user?uname=" + user.getUsername() + "&token=" + t%>" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a>
                <a href="Logout" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Logout"><i class="fa fa-power-off"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications"><i class="fa fa-globe"></i></a>
                <a href="<%=request.getContextPath() + "/settings?uname=" + user.getUsername() + "&token=" + t%>" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-cog"></i></a>                
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
                <div class="w3-dropdown-hover w3-hide-small">
                    <% String firstReq = null;
                        try {
                            String sql1 = "SELECT count(*) FROM crimson.followers where following = ? and status='0';";
                            PreparedStatement ps1 = conn.getConn().prepareStatement(sql1);
                            ps1.setString(1, user.getUsername());
                            ResultSet rs1 = ps1.executeQuery();
                            int count = 0;
                            if (rs1.next()) {
                                count = rs1.getInt(1);
                            }
                    %>
                    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-user"></i><span class="w3-badge w3-right w3-small w3-black"><%=count%></span></button>     
                    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                        <br>
                        <%
                            String sql = "SELECT * FROM crimson.followers where following = ? and status='0' order by timestamp;";
                            PreparedStatement ps = conn.getConn().prepareStatement(sql);
                            ps.setString(1, user.getUsername());
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                if (rs.isLast()) {
                                    firstReq = rs.getString(1);
                                }
                        %>
                        <center><b style="text-align:center"><%=rs.getString(1)%></b></center>
                        <b class="w3-half">
                            <button class="w3-button w3-block w3-theme-d1 w3-section" onclick="window.location = '<%="action/acceptrequest?token=" + t%>&f1=<%=rs.getString(1)%>&f2=<%=user.getUsername()%>&url=<%=URLEncoder.encode(url, "UTF-8")%>'"  title="Accept"><i class="fa fa-check"></i>Accept</button>
                        </b>
                        <b class="w3-half">
                            <button class="w3-button w3-block w3-theme-d2 w3-section" onclick="window.location = '<%="unfollow/acceptrequest?token=" + t%>&f1=<%=rs.getString(1)%>&f2=<%=user.getUsername()%>&url=<%=URLEncoder.encode(url, "UTF-8")%>'"  style =" margin-bottom: 80px;" title="Decline"><i class="fa fa-remove"></i>Reject</button>
                        </b>
                        <hr><hr>
                        <%
                            }
                        %>
                    </div>
                    <%
                        } catch (SQLException ex) {
                        }
                    %>
                </div>

                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"></a>
                <strong align="center"> CrimsonMe</strong>
                &nbsp;   &nbsp; 
                <input type="text" id="myInput" placeholder="Search for names.." title="Type in a name">
                <script>
                    document.getElementById("myInput")
                            .addEventListener("keyup", function (event) {
                                event.preventDefault();
                                if (event.keyCode === 13) {
                                    window.location = "<%=searchUrl%>" + "" + document.getElementById("myInput").value;
                                    //document.getElementById("myInput").click();
                                }
                            });
                </script>
                <!--  JAVA SCRIPT CODE FOR SEARCH
                
                <script>
              function myFunction() {
                  var input, filter, ul, li, a, i;
                  input = document.getElementById("myInput");
                  filter = input.value.toUpperCase();
                  ul = document.getElementById("LIST OF ELEMENTS : ORDERED /UNORDERED");
                  li = ul.getElementsByTagName("ELECT AN ELEMENT - LI ");
                  for (i = 0; i < li.length; i++) {
                      a = li[i].getElementsByTagName("a")[0];
                      if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          li[i].style.display = "";
                      } else {
                          li[i].style.display = "none";
              
                      }
                  }
              }
              </script>
              
                -->
                &nbsp;   &nbsp;   &nbsp; &nbsp;   &nbsp;   &nbsp; 
                &nbsp;   &nbsp;   

                <strong align="center">Hi, <%=user.getUsername()%></strong>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account"><img src="<%=request.getContextPath()%>/image?id=<%=userProfile.getPicture()%>" class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
            </div>
        </div>

        <!-- Navbar on small screens -->
        <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
            <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>

        </div>

        <!-- Page Container -->
        <div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
            <!-- The Grid -->
            <div class="w3-row">
                <!-- Left Column -->
                <div class="w3-col m3">
                    <!-- Profile -->
                    <div class="w3-card w3-round w3-white">
                        <div class="w3-container">
                            <h4 class="w3-center"><%=user.getFname()%> <%=user.getLname()%></h4>
                            <p class="w3-center"><img src="<%=request.getContextPath()%>/image?id=<%=userProfile.getPicture()%>" class="w3-circle" style="height:100%;width:100%;" alt="Avatar"></p>
                            <hr>
                            <p><i class="fa fa-phone fa-fw w3-margin-right w3-text-theme"></i>+91 <%=userProfile.getPhone()%></p>
                            <p><i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i><%=user.getEmail()%>@muj.manipal.edu</p>
                            <%
                                SimpleDateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
                                String strDate = formatter.format(user.getDob());
                            %>
                            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i><%=strDate%></p>
                        </div>
                    </div>
                    <br>

                    <!-- Accordion -->
                    <div class="w3-card w3-round">
                        <div class="w3-white">
                            <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> About Me</button>
                            <div id="Demo1" class="w3-hide w3-container">
                                <p><%=userProfile.getAboutMe()%></p>
                            </div>
                            <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> Events</button>
                            <div id="Demo2" class="w3-hide w3-container">
                                <p><b>Blood Donation Camp</b><br>16 Nov 2017 Thursday 0800 hrs - 1700 hrs</p>
                            </div>
                            <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> Followers</button>
                            <div id="Demo3" class="w3-hide w3-container">
                                <div class="w3-row-padding">
                                    <hr>
                                    <%
                                        try {
                                            String sql = "SELECT username,profilepic FROM crimson.followers join crimson.profile on follower = username where following = ? and status='1' order by timestamp;";
                                            PreparedStatement ps = conn.getConn().prepareStatement(sql);
                                            ps.setString(1, user.getUsername());
                                            ResultSet rs = ps.executeQuery();
                                            while (rs.next()) {
                                                String uname = rs.getString(1);
                                                String pic = request.getContextPath() + "/image?id=" + rs.getString(2);
                                    %>
                                    <div>
                                        <img src="<%=pic%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:40px">
                                        <h6><%=uname%></h6>
                                        <hr class="w3-clear">
                                    </div>
                                    <%
                                            }
                                        } catch (SQLException e) {
                                        }
                                    %>
                                </div>
                            </div>
                            <button onclick="myFunction('Demo4')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-picture-o fa-fw w3-margin-right"></i> Photos</button>
                            <div id="Demo4" class="w3-hide w3-container">
                                <div class="w3-row-padding">
                                    <br>
                                    <%
                                        try {
                                            String sql = "SELECT idimages FROM crimson.images where images.by = ?;";
                                            PreparedStatement ps = conn.getConn().prepareStatement(sql);
                                            ps.setString(1, user.getUsername());
                                            ResultSet rs = ps.executeQuery();
                                            while (rs.next()) {
                                                String pic = request.getContextPath() + "/image?id=" + rs.getString(1);
                                    %>          
                                    <div class="w3-half">
                                        <img src="<%=pic%>" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <%
                                            }
                                        } catch (SQLException e) {
                                        }
                                    %>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <br>

                    <!-- Interests --> 
                    <div class="w3-card w3-round w3-white w3-hide-small">
                        <div class="w3-container">
                            <p>Interests</p>
                            <p>
                                <%
                                    String inst[] = userProfile.getInterest().split("::");
                                    for (int i = 0; i < inst.length; i++) {
                                        if (!inst.equals("")) {
                                            if (i % 2 == 0) {
                                %><span class="w3-tag w3-small w3-theme-d1"><%=inst[i]%></span><%
                                } else {
                                %><span class="w3-tag w3-small w3-theme-d2"><%=inst[i]%></span><%
                                            }
                                        }
                                        out.println(" ");
                                    }
                                    %>
                            </p>
                        </div>
                    </div>
                    <br>

                    <!-- Alert Box -->
                    <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
                        <span onclick="this.parentElement.style.display = 'none'" class="w3-button w3-theme-l3 w3-display-topright">
                            <i class="fa fa-remove"></i>
                        </span>
                        <p><strong>Hey!</strong></p>
                        <p>People are looking at your profile. Find out who.</p>
                    </div>

                    <!-- End Left Column -->
                </div>

                <!-- Middle Column Search-->
                <div class="w3-col m7">
                    <%
                        String searchLike = "%" + search + "%";
                        try {
                            boolean result = false;
                            int i = 1;
                            String sql = "SELECT iduser,fname,lname,profilepic,status FROM crimson.user join crimson.profile on iduser=username left outer join crimson.followers on iduser=following and follower=?"
                                    + "where iduser like ? or fname like ? or lname like ?;";
                            PreparedStatement ps = conn.getConn().prepareStatement(sql);
                            ps.setString(1, user.getUsername());
                            ps.setString(2, searchLike);
                            ps.setString(3, searchLike);
                            ps.setString(4, searchLike);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                String uname = rs.getString(1);
                                String name = rs.getString(2) + " " + rs.getString(3);
                                String pic = request.getContextPath() + "/image?id=" + rs.getString(4);
                                result = true;
                                String b1 = "none", b2 = "none", b3 = "none";
                                if (!uname.equals(user.getUsername())) {
                                    if (rs.getString(5) == null) {
                                        b3 = "block";
                                    } else if (rs.getString(5).equals("1")) {
                                        b1 = "block";
                                    } else {
                                        b2 = "block";
                                    }
                                }
                    %>
                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <img src="<%=pic%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                        <h4><%=name%></h4>
                        <span><%=uname%></span>
                        <div class="w3-right">
                            <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" disabled style="display: <%=b1%>"><i class="fa fa-user"></i>  Following</button> 
                            <button id="unfollow_<%=i + ""%>" class="w3-button w3-theme-d2 w3-margin-bottom" style="display: <%=b2%>" onclick="window.location = '<%="action/unfollow?token=" + t%>&f2=<%=uname%>&f1=<%=user.getUsername()%>&url=<%=URLEncoder.encode(url, "UTF-8")%>'" ><i class="fa fa-user"></i>  Cancel Request</button> 
                            <button id="follow_<%=i + ""%>"  class="w3-button w3-theme-d1 w3-margin-bottom" style="display: <%=b3%>" onClick="sendRequest('<%=i + ""%>', '<%=uname%>');"><i class="fa fa-user-plus  "></i>  Follow</button> 
                        </div>
                    </div>
                    <%
                            i++;
                        }
                        ;
                        if (result == false) {
                    %>
                    <div id="head" class="w3-container w3-card w3-white w3-round w3-margin w3-center"><br>
                        <h4>Nothing Found!</h4>
                        <span>Nothing Found on your search "<%=search%>"</span>
                        <hr>
                    </div>
                    <%
                            }
                        } catch (Exception ex) {
                            //out.print(ex.fillInStackTrace());
                            response.sendError(HttpServletResponse.SC_BAD_GATEWAY);
                        }
                    %>
                    <!-- End Middle Column Search-->
                </div>

                <!-- Right Column -->
                <div class="w3-col m2">
                    <div class="w3-card w3-round w3-white w3-center">
                        <div class="w3-container">
                            <p>Upcoming Events:</p>
                            <img src="resources/asset/blood.jpg" alt="BloodDonation" style="width:100%;">
                            <p><strong>Blood Donation Camp</strong></p>
                            <p>16 Nov 2017
                                Thursday 0800 hrs - 1700 hrs </p>
                            <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
                        </div>
                    </div>
                    <br>
                    <%if (firstReq != null) {%>
                    <div class="w3-card w3-round w3-white w3-center">
                        <div class="w3-container">
                            <p>Follow Request</p>
                            <%
                                User NEWREQ = db.getUser(firstReq);
                                UserProfile NEWRQ_P = db.getUserProfile(firstReq);
                            %>
                            <img src="<%=request.getContextPath()%>/image?id=<%=NEWRQ_P.getPicture()%>" alt="Avatar" style="width:50%"><br>
                            <span><%=NEWREQ.getFname()%> <%=NEWREQ.getLname()%></span><br>
                            <span>(<%=firstReq%>)</span>
                            <div class="w3-row w3-opacity">
                                <div class="w3-half">
                                    <button class="w3-button w3-block w3-black w3-section" onclick="window.location = '<%="action/acceptrequest?token=" + t%>&f1=<%=NEWREQ.getUsername()%>&f2=<%=user.getUsername()%>&url=<%=URLEncoder.encode(url, "UTF-8")%>'" title="Accept"><i class="fa fa-check"></i></button>
                                </div>
                                <div class="w3-half">
                                    <button class="w3-button w3-block w3-red w3-section" onclick="window.location = '<%="action/unfollow?token=" + t%>&f1=<%=NEWREQ.getUsername()%>&f2=<%=user.getUsername()%>&url=<%=URLEncoder.encode(url, "UTF-8")%>'"  title="Decline"><i class="fa fa-remove"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <br>

                    <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
                        <p>ADS</p>
                    </div>
                    <br>

                    <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
                        <p><strong >Communities</strong></p>
                    </div>

                    <!-- End Right Column -->
                </div>

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
        <br>

        <!-- Footer -->
        <!--
        <footer class="w3-container w3-theme-d3 w3-padding-16">
         
        </footer>  -->

        <footer class="w3-container w3-theme-d5">
            <p align="center">Copyright &copy; 2017,CrimsonMe</p>
        </footer>

        <script>
            // Accordion
            function myFunction(id) {
                var x = document.getElementById(id);
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                    x.previousElementSibling.className += " w3-theme-d1";
                } else {
                    x.className = x.className.replace("w3-show", "");
                    x.previousElementSibling.className =
                            x.previousElementSibling.className.replace(" w3-theme-d1", "");
                }
            }

            // Used to toggle the menu on smaller screens when clicking on the menu button
            function openNav() {
                var x = document.getElementById("navDemo");
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                }
            }

            function sendRequest(id, f2) {
                var url = "<%="action/sendrequest?token=" + t%>&f1=<%=user.getUsername()%>&f2=" + f2;
                //alert(url);
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", url, true);
                xhttp.send();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        //alert("done")
                        document.getElementById("follow_" + id).style.display = "none";
                        document.getElementById("unfollow_" + id).style.display = "block";
                    }
                };
            }
        </script>

    </body>
</html> 

