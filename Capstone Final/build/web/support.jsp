<%-- 
    Document   : index
    Created on : Mar 16, 2018, 11:20:07 AM
    Author     : Group 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Head-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Support</title>

        <link rel="stylesheet" type="text/css" href="styles/styles.css">
    </head
    <!--Body-->
    <body>

        <div class="content">
            <!-- Header and navigation-->
            <header>
                <img src="images/logo1.png" alt="Logo" id="logo_img">
            </header>
            <nav>
                <ul>
                    <li><a href="index.jsp" >Home</a></li>
                    <li><a href="reservation.jsp">Reservation</a></li>
                    <li><a href="venue.jsp">Venue</a></li>
                    <li><a href="support.jsp" class="active">Support</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
            </nav>

            <main>
                <!--Contact information-->
                <div class="contact_info">
                    <h3 class="color_c0c0c0 padding-10px">Contact Us:</h3>
                    <p class="padding-10px">For general questions about how to book your reservation <br>
                        >> 704-444-JAZZ (5299) <br>
                        For Technical Support<br>
                        >> 704-444-SYST (7978)<br><br>

                        For all other inquiries:<br>
                        Ph 704-444-1000<br>
                        Fax 704-444-1001<br>
                        Email: J&Bsupport@gmail.com
                    </p>

                </div>

                <!--FAQs-->
                <div class="faqs">
                    <h3 class="color_c0c0c0 padding-10px">FAQs</h3>
                    <p class="padding-10px">
                        Q. Is this a legitimate website <br><br>
                        A. Yes! In fact, our web application is really easy to use. We have strived to reduce complications. Simple yet powerful is our goal.<br><br>

                        Q. Do you serve food and drinks? <br><br>
                        A. Unfortunately, we do not serve food or drinks; having said that, we are located near many popular restaurants. Whether you prefer Italian, Chinese, or American cuisine
                        there are a variety of options located near us.<br><br>

                        Q. Is there an age restriction at your venue?<br><br>
                        A. Nope! Music lovers of all ages are welcome to enjoy and relax. <br><br>

                        Q. Can I take photographs or videos? <br><br>
                        A. Definitely! We allow people to capture their wonderful memories at these concerts, but we would request that you do not use flash feature since it can distract the 
                        musicians<br><br>
                        
                        Q. Will I have fun?<br><br>
                        A. Of course! We bet that this will be an experience that you will not forget for the rest of your life.<br><br>
                    </p>

                </div>
            </main>
        </div>
        <!--Sticky footer -->
        <footer>
            <div class="row text-align_center">
                <div class="column-left">
                    <h3>Group Members:</h3>
                    <ul class="list_style_type_none">
                        <li>Tesfaye Alemu</li>
                        <li>Zack Hardilo</li>
                        <li>Gerry Kalombo</li>
                        <li>Amit Kohli</li>
                        <li>Matthew O'Brien</li>
                    </ul>
                </div>
                <div class="column-center">
                    <h3>Users please note:</h3>
                    <p>Tickets are non-refundable and are non-taxable. We reserve the right to decline admission if anyone neglects to follow our policies.</p>
                </div>
                <div class="column-right">
                    <p>Class: CTI 289-80</p>
                    <p>Instructors: Ann Aksut, Barbara Neequaye, Pooya Eslami, Susan Medlin</p>

                    <p>&copy; 2018 Jazz Concert Reservation System<p>
                </div>
            </div>
        </footer>

    </body>
</html>