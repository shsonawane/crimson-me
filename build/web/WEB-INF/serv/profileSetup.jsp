<%-- 
    Document   : profilesetup
    Created on : 17 Oct, 2017, 5:05:09 PM
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

            .hhh{
                background-color:black;
                width:100%;
                height:auto;
            }


            div.gallery {
                margin: 5px;
                border: 1px solid #ccc;
                float: left;
                width: 180px;
                background-color:grey;
                z-index: 1;
            }

            div.gallery:hover {
                border: 1px solid #777;
            }

            div.gallery img {
                width: 100%;
                height: auto;
            }

            div.desc {
                padding: 15px;
                text-align: center;
            }





            input[type=text], select, textarea {
                width: 60%; /* Full width */
                padding: 12px; /* Some padding */  
                border: 1px solid #ccc; /* Gray border */
                border-radius: 4px; /* Rounded borders */
                box-sizing: border-box; /* Make sure that padding and width stays in place */
                margin-top: 6px; /* Add a top margin */
                margin-bottom: 16px; /* Bottom margin */
                resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
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


            .button1 {
                background-color:grey;
                color:black;
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

            .button1:hover {
                background-color:red;}


            .footer {
                font-size:70px;
                background-color: #470103;
                padding:20px40px;
                border:none;
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


            img {
                border-radius:8px;
                border: 1px solid black;
                outline: 1px solid black;

                padding: 5px;
            }		 


            * {box-sizing:border-box}


            .mySlides {display:none}

            /* Slideshow container */
            .slideshow-container {
                max-width: 1000px;
                position: relative;
                margin: auto;
            }



            /* Fading animation */
            .fade {
                -webkit-animation-name: fade;
                -webkit-animation-duration: 1.5s;
                animation-name: fade;
                animation-duration: 1.5s;
            }

            @-webkit-keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }

            @keyframes fade {
                from {opacity: .4} 
                to {opacity: 1}
            }





        </style>

    </head>

    <body>

        <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
            <div class="overlay">
                <div class="w3-display-topleft w3-padding-large w3-xlarge">
                    
                     <b style="background-color:black">Profile Settings</b>
                </div>
                </br>

                <br>
                <h1 class="heading" align="center">CrimsonMe</h1>



                <!--
                <div class="header">
                  <h1>Header</h1>
                  </div> -->
                <br>

                <div class="slideshow-container">

                    <div class="mySlides fade" style="width: 100%;height: 300px;">
                        <center>
                            <h3>Profile Picture</h3>
                            <img id="pv" src="resources/asset/samp.png" style="width:300px; height:300px; alt:manipaldomebuild"> 
                            <br>
                            <button class="button">Take Photo</button>
                            <button class="button" onclick="document.getElementById('fl').click()">Upload Pic</button>
                            <input id="fl" type="file" onchange="previewFile()" hidden><br>
                            <script>
                                function previewFile() {
                                    var preview = document.getElementById('pv');
                                    var file = document.getElementById('fl').files[0];
                                    var reader = new FileReader();
                                    reader.onloadend = function () {
                                        preview.src = reader.result;
                                    }

                                    if (file) {
                                        reader.readAsDataURL(file);
                                    } else {
                                        preview.src = "";
                                    }
                                }
                            </script>

                        </center>
                    </div>

                    <div class="mySlides fade" style="width: 100%;height: 300px;">
                        <center>
                            <center><h3>User Information</h3></center><br>
                            <label for="aboutme">About Me</label>
                            <br>	
                            <textarea id="aboutme" name="aboutme" placeholder="Write something.."></textarea>
                            <br>
                            <label for="aboutme">Mobile No.</label><br>
                            <input type="text" id="mobno" name="mobno" placeholder="Enter here">
                            <br>
                            <label for="interests">Interests</label><br>
                            <!-- INTEREST EDITED -->

                            <!--	<input type="text" id="interests" name="interests"  placeholder="Enter here">   -->


                            <input type="text" id="intr1" name="intr1"  placeholder="Enter here" style=" background-image: url('asset/intr1.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">

                            <input type="text" id="intr2" name="intr1"  placeholder="Enter here" style=" background-image: url('asset/intr1.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">

                            <input type="text" id="intr3" name="intr1"  placeholder="Enter here" style=" background-image: url('asset/intr1.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">

                            <input type="text" id="intr4" name="intr1"  placeholder="Enter here" style=" background-image: url('asset/intr1.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;"> 
                            <!-- INTEREST EDIT END -->

                            <br>

                            <input type="text" id="insta" name="insta" placeholder="Enter here" style=" background-image: url('resources/asset/inst.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">

                            <input type="text" id="snap" name="snap"  placeholder="Enter here" style=" background-image: url('resources/asset/sna.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">

                            <br>

                            <input type="text" id="twitter" name="twitter"  placeholder="Enter here" style=" background-image: url('resources/asset/twi.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">

                            <input type="text" id="linked" name="linke" placeholder="Enter here" style=" background-image: url('resources/asset/lin.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:250px; padding: 12px 20px 12px 50px;">
                            <br>
                            <input type="submit" onclick="submit_action();">




                        </center>
                    </div>

                    <div class="mySlides fade" style="width: 100%;height: 300px;">
                        <center>
                            <h3>Find People</h3><br>

                            <input type="text" id="frndsearch" name="frndsearch" placeholder="Enter username here" style=" background-image: url('resources/asset/sea.png');
                                   background-position: 10px 10px;
                                   background-repeat: no-repeat; width:400px; padding: 12px 20px 12px 50px;">
                            <br>
                            <b> Search By Username</b><br>
                            <button class="button">Follow</button>

                        </center>
                    </div>

                    <div class="mySlides fade" style="width: 100%;height: 300px;">
                        <center>

                            <h3>Friend Suggestions</h3>

                            <!--- DIV GALLERY BLAH BLHA -->


                            <section class="hhh">

                                <div class="gallery">
                                    <a target="_blank" href="resources/asset/samp2.png">
                                        <img src="resources/asset/samp2.png" alt="Friendsuggestion1" width="300" height="200">
                                    </a>
                                    <b>Username1</b><br>
                                    <div class="desc">Full Name 1</div>
                                </div>

                                <div class="gallery">
                                    <a target="_blank" href="resources/asset/samp2.png">
                                        <img src="resources/asset/samp2.png" alt="Friendsuggestion2" width="600" height="400">
                                    </a>
                                    <b>Username3</b><br>
                                    <div class="desc">Full Name 2</div>
                                </div>

                                <div class="gallery">
                                    <a target="_blank" href="resources/asset/samp2.png">
                                        <img src="resources/asset/samp2.png" alt="Friendsuggestion3" width="600" height="400">
                                    </a>
                                    <b>Username3</b><br>
                                    <div class="desc">Full Name 3</div>
                                </div>

                            </section>



                            <br>

                            <!-- ENDDDDDDDDDDDDDD-->


                        </center>
                    </div>
                    <br>
                </div>
                <br>
                <br>

                <button id="demo" class="button1" onclick="plusSlides(-1)" >Back</button>
                <button id="demo2" class="button1" onclick="plusSlides(1)">Next</button>
            </div>





            <script>

                var slideIndex = 1;
                document.getElementById("demo").disabled = true;
                showSlides(slideIndex);


                function plusSlides(n) {
                    slideIndex += n;
                    if (slideIndex === 1) {
                        document.getElementById("demo").disabled = true;
                    } else {
                        document.getElementById("demo").disabled = false;
                    }
                    showSlides(slideIndex);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }

                function showSlides(n) {
                    var i;
                    var slides = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("dot");
                    if (n > slides.length) {
                        slideIndex = 1
                    }
                    if (n < 1) {
                        slideIndex = slides.length
                    }
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " active";
                }


                function submit_action() {
                    
                    var form = document.createElement('form');

                    // Move the submit function to another variable
                    // so that it doesn't get overwritten.
                    form._submit_function_ = form.submit;

                    form.setAttribute('method', 'POST');
                    form.setAttribute('action', 'action/profilesetupaction');

                    var a1 = document.createElement('input');
                    a1.setAttribute('type', 'hidden');
                    a1.setAttribute('name', 'pp');
                    a1.setAttribute('value', document.getElementById("pv").src);
                    form.appendChild(a1);

                    var a2 = document.createElement('input');
                    a2.setAttribute('type', 'hidden');
                    a2.setAttribute('name', 'about');
                    a2.setAttribute('value', document.getElementById("aboutme").value);
                    form.appendChild(a2);

                    var a3 = document.createElement('input');
                    a3.setAttribute('type', 'hidden');
                    a3.setAttribute('name', 'mobno');
                    a3.setAttribute('value', document.getElementById("mobno").value);
                    form.appendChild(a3);

                    var a4 = document.createElement('input');
                    a4.setAttribute('type', 'hidden');
                    a4.setAttribute('name', 'interest');
                    a4.setAttribute('value', document.getElementById("intr1").value
                            +"::"+document.getElementById("intr2").value+"::"+
                            document.getElementById("intr3").value+"::"+
                            document.getElementById("intr4").value);
                    form.appendChild(a4);
                    var a5 = document.createElement('input');
                    a5.setAttribute('type', 'hidden');
                    a5.setAttribute('name', 'insta');
                    a5.setAttribute('value', document.getElementById("insta").value);
                    form.appendChild(a5);

                    var a6 = document.createElement('input');
                    a6.setAttribute('type', 'hidden');
                    a6.setAttribute('name', 'snapchat');
                    a6.setAttribute('value', document.getElementById("snap").value);
                    form.appendChild(a6);

                    var a7 = document.createElement('input');
                    a7.setAttribute('type', 'hidden');
                    a7.setAttribute('name', 'twitter');
                    a7.setAttribute('value', document.getElementById("twitter").value);
                    form.appendChild(a7);

                    var a8 = document.createElement('input');
                    a8.setAttribute('type', 'hidden');
                    a8.setAttribute('name', 'linked');
                    a8.setAttribute('value', document.getElementById("linked").value);
                    form.appendChild(a8);

                    var a9 = document.createElement('input');
                    a9.setAttribute('type', 'hidden');
                    a9.setAttribute('name', 'uname');
                    a9.setAttribute('value', '<%=request.getParameter("uid")%>');
                    form.appendChild(a9);

                    document.body.appendChild(form);
                    form._submit_function_(); // Call the renamed function.
                }
            </script>


        </div>
    </body>
</html> </body>
</html>