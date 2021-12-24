<%-- 
    Document   : signupconf
    Created on : 21 Oct, 2017, 2:15:44 PM
    Author     : Shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                background-image: url('<%=request.getContextPath()%>/resources/asset/back6.jpg');
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

            .back{
                background-color: black;
                color: white;
                padding: 14px 25px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
            }


            .back:hover {
                background-color: red;



            </style>
        </head>


        <body>

            <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
                <div class="overlay">
                    <div class="w3-display-topleft w3-padding-large w3-xlarge">
                        
                         <b style="background-color:black">Welcome, <%=request.getParameter("name")%></b>
                        
                    </div>
                    </br>

                    <br>
                    <h1 class="heading"><center>CrimsonMe</center></h1>

                    <div class="clearfix">

                        <div style="margin: 5%;" align="center">
                            <h3 style="background-color: black"> You've been sent an email to confirm your email address <%=request.getParameter("email")%>@muj.manipal.edu. Please click on the link in the email to activate your account.</h3>
                            <br>

                            <i><a class="back" href="resendemail?uname=<%=request.getParameter("uname")%>&email=<%=request.getParameter("email")%>">Resend Email</i></a><br>
                            <br>
                            <i><a class="back" href="outlook.com">Open Outlook </i></a>

                            <i><a class="back" href="<%=request.getContextPath() + "/home"%>">Return to site</i></a>


                        </div>
                    </div>




                    </body>
                    </html>
