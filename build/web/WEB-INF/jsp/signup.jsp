<%-- 
    Document   : home
    Created on : 13 Oct, 2017, 4:37:52 AM
    Author     : Shubham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="conn" scope="session" class="com.db.ConnectionManager" />


<!DOCTYPE html>
<html>
    <head>
        <title>CrimsonMe</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="resources\asset\css\style.css">

        <style>
            body {
                margin: 0;
            }


            .header {
                background-color: #E41414;
                padding: 30px;
                text-align: center;
            }

            input[type=text] {
                width: 30%;
                padding: 8px 8px;
                margin: 8px 0;
                box-sizing: border-box;
            }

            input[type=password] {
                width: 30%;
                padding: 8px 8px;
                margin: 8px 0;
                box-sizing: border-box;
            }


            input[type=date] {
                width: 20%;
                padding: 8px 8px;
                margin: 8px 0;
                box-sizing: border-box;
            }


            input[type=radio]:checked ~ .check {
                border: 5px solid #0DFF92;
            }

            input[type=radio]:checked ~ .check::before{
                background: #0DFF92;
            }

            input[type=radio]:checked ~ label{
                color: #0DFF92;
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
            button {
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

            input[type=reset] {
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

            input[type=reset]:hover{
                background-color:red;}

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

        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript">

            function checkname() {
                var name = document.getElementById("uname").value;

                if (name) {
                    $.ajax({
                        type: 'get',
                        url: 'SignUpAction',
                        data: {
                            uname: name,
                        },
                        success: function (response) {
                            alert(response);
                            if (response == "OK") {
                                return true;
                            } else {
                                return false;
                            }
                        }
                    });
                } else {
                    return false;
                }
            }
        </script>
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

                <center><h3>Sign Up</h3></center>

                <!--
                <div class="header">
                  <h1>Header</h1>
                  </div> -->
                <br>

                <center>
                    <form id="myform" action="action/signupaction" onsubmit="return validateForm();" method="post">
                        <input type="text" id="uname" name="uname" onblur="userExist();" required placeholder="Username">
                        <div class="popup" align="center">
                            <span class="popuptext" id="myPopup3"></span>
                        </div>
                        <br>  
                        <input type="text" id="fname" name="fname" required placeholder="First Name">
                        <br>

                        <input type="text" id="lname" name="lname" required placeholder="Last Name">

                        <br>
                        <div style="margin-left: -40px;">
                            D.O.B: 

                            <input type="date" name="bday" required >
                        </div>
                        <br> 
                        Select your gender:
                        <input type="radio" name="gender" required value="M">Male
                        <input type="radio" name="gender" required value="F">Female<br>
                        <br>
                        <div class="popup" id='_email' align="center">
                            <span class="popuptext" id="myPopup4">This Email-ID is Already Registered!</span>
                        </div>
                        <div style="margin-left:90px;">
                            <input type="text" id="email" onblur="emailExist();" onclick="document.getElementById('myPopup4').classList.toggle('show', false);" name="email" required placeholder="Enter your email here"> @muj.manipal.edu
                        </div>
                        <input type="password" id="pass" name="password" required placeholder="Enter your password">
                        <br>
                        <input type="password" id="cpass" required placeholder="ReEnter your password">
                        <div class="popup" align="center"><span class="popuptext" id="myPopup" >Password Don't Match!</span></div>
                        <br>
                        <input type="checkbox" checked="checked"> Remember me
                        <br>

                        Clicking on Submit would signify the you accept
                        all our <a href="termsblah.txt" >Terms and Conditions</a>.
                        <br>
                        <input type="submit" value="Submit">
                        <input type="reset">
                    </form>

                    <script type="text/javascript">
                        var flag = false;
                        var eflag = false;

                        function emailExist() {
                            var email = document.getElementById("email").value;
                            var url = "action/emailexist?email=" + email;
                            var xhttp = new XMLHttpRequest();
                            xhttp.open("GET", url, true);
                            xhttp.send();
                            xhttp.onreadystatechange = function () {
                                if (this.readyState == 4 && this.status == 200) {
                                    // alert("Not Exist");
                                    eflag = true;
                                } else if (this.readyState == 4 && this.status == 302) {
                                    //alert("Exist");
                                    eflag = false;
                                }
                            };
                        }

                        function userExist() {
                            var uname = document.getElementById("uname").value;
                            var popup2 = document.getElementById("myPopup3");
                            popup2.classList.toggle("show", false);
                            if (uname.length > 3) {
                                var url = "action/userexist?uname=" + uname;
                                var xhttp = new XMLHttpRequest();
                                xhttp.open("GET", url, true);
                                xhttp.send();
                                xhttp.onreadystatechange = function () {
                                    if (this.readyState == 4 && this.status == 200) {
                                        // alert("Not Exist");
                                        popup2.innerHTML = "Username Available"
                                        popup2.style.color = "green";
                                        popup2.classList.toggle("show", true);
                                        flag = true;
                                    } else if (this.readyState == 4 && this.status == 302) {
                                        //alert("Exist");
                                        popup2.innerHTML = "Username Unavailable"
                                        popup2.style.color = "red";
                                        popup2.classList.toggle("show", true);
                                        flag = false;
                                    }
                                };
                            } else if (uname.length == 0) {
                                popup2.classList.toggle("show", false);
                                flag = false;
                            } else {
                                popup2.innerHTML = "Username too short"
                                popup2.style.color = "red";
                                popup2.classList.toggle("show", true);
                                flag = false;
                            }
                        }

                        function validateForm() {
                            var cp = document.getElementById("cpass").value;
                            var p = document.getElementById("pass").value;
                            if (flag === true) {
                                if (eflag == true) {
                                    if (cp != p) {
                                        var popup = document.getElementById("myPopup");
                                        popup.classList.toggle("show");
                                        setTimeout(function () {
                                            document.getElementById("myPopup").classList.toggle("show");
                                        }, 3000);
                                    } else {
                                        return true;
                                    }
                                } else {
                                    location.href = "#_email";
                                    document.getElementById("email").style.boxShadow = "inset 0 0 5px red";
                                    var popup = document.getElementById("myPopup4");
                                    popup.classList.toggle("show", true);
                                }

                            } else {
                                location.href = "#myform";
                                document.getElementById("uname").style.boxShadow = "inset 0 0 5px red";
                                document.getElementById("uname").focus();
                            }
                            return false;
                        }
                    </script>

                </center> 

            </div>
    </body>
</html>