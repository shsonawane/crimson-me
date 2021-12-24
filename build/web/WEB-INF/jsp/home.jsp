
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />


<!DOCTYPE html>
<html>
    <head>
        <title>CrimsonMe</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

        <style>

            body {
                margin: 0;
            }

            .header {
                background-color: #E41414;
                padding: 20px;
                text-align: center;
            }

            * {
                box-sizing: border-box;
            }

            .column {
                float: right;
                padding: 15px;
            }
            .clearfix::after {
                content: "";
                clear: both;
                display: table;
            }
            .menu {
                width: 25%;
            }
            .content {
                width: 75%;
            }

            body,h1 {font-family: "Raleway", sans-serif}
            body, html {height: 100%}
            .bgimg {
                background-image: url('resources/asset/back6.jpg');
                min-height: 100%;
                background-position: center;
                background-size: cover;
            }
            
            .heading {
                font-size:70px;
                background-color: #B9200B;
                padding:20px40px;
                border:none;
            }




            input[type=text] {
                width: 90%;
                padding: 8px 8px;
                margin: 8px 0;
                box-sizing: border-box;
            }

            input[type=password] {
                width: 90%;
                padding: 8px 8px;
                margin: 8px 0;
                box-sizing: border-box;
            }

            input[type=submit] {
                background-color: black; 
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }
            input[type=submit]:hover{
                background-color:red;}


            .button {
                background-color:black;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }

            .button:hover {
                background-color:red;}


            .footer {
                font-size:70px;
                background-color: #470103;
                padding:20px40px;
                border:none;
            } 

            img {
                border-radius:8px;
                border: 1px solid black;
                outline: 1px solid black;

                padding: 5px;
            }	

        </style>
    </head>


    <body>

        <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
            <div class="overlay">
                <div class="w3-display-topleft w3-padding-large w3-xlarge">
                   <b style="background-color:black">Welcome</b>
                </div>
                </br>

                <br>
                <h1 class="heading"><center>CrimsonMe</center></h1>

                <div class="clearfix">
                    <div class="column menu">

                        <!-- SECTION FROM PAGE 2 BEGIN<-->

                        <h3>Sign In</h3>
                        <br>

                        <form action="action/signinaction" method="post">

                            <input type="text" id="username" name="username" required placeholder="Username">
                            <br>

                            <input type="password" id="password" name="password" required placeholder="Enter your password">

                            <br>
                            <label><%
                                if (request.getParameter("error") != null) {
                                    out.print("Error, Invalid Username or Password!");
                                }
                                %>
                            </label>
                            <br>
                            <input class="button" type="submit" value="Sign In">
                            <br>
                        </form>
                        <br>

                        <strong><a href="forgotpass" style="text-decoration:none; font-family:Raleway ; color:white;">Forgotton Password ? </a></strong>

                        <br>
                        <i><p style="text-decoration:none; font-family:Raleway ; color:white;">Not a Member yet ?</p></i> 

                        <strong><a href="signup" style=" font-family:Raleway ; color:white;">Sign Up Now ! </a></strong>

                        <br>

                        <i><a href="contactus" style=" font-family:Raleway ; color:white;">Contact Us </a></i>	

                    </div>

                    <div class="column content">
                        <center> <img src="resources/asset/mani1.jpg" style="width:700px; height:400px; alt:manipaldomebuild"></center>
                    </div>
                </div>
                </body>
                </html>
