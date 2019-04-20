<%-- 
    Document   : index
    Created on : Mar 16, 2018, 11:20:07 AM
    Author     : Group 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!---Head section-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Venue</title>

        <link rel="stylesheet" type="text/css" href="styles/styles.css">
    </head>
    <!---Body section-->
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
                    <li><a href="venue.jsp" class="active">Venue</a></li>
                    <li><a href="support.jsp">Support</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
            </nav>
             <!--Main section-->
            <main>
                <!--Image slider using only CSS and HTML (no Javascript involved) -->
                <div class="slider">
                </div>
                <!--Information about the Venue -->
                <h3 class ="text-align_center">J&B Music Pavilion</h3>

                <!--Basic Venue information (contains description of Venue) -->
                <div class="venue_information">
                    <h3 class="text-align_center margin_none color_c0c0c0">Venue Information</h3>
                    <p class="padding-10px">
                        J&B (Jazz and Blues) Music Pavilion is an indoor amphitheater in Charlotte, North Carolina, that specializes in hosting large concerts. 
                        It has a capacity of total capacity of 3000. This amphitheater hosts many different varieties of acts, including rock, alternative, pop, country, jazz, and 
                        rhythm and blues, but is renowned for hosting jazz and blues concerts.
                    </p>
                </div>

                 <!--Information about directions and parking -->
                <div class="directions_and_parking">
                    <h3 class="text-align_center margin_none color_c0c0c0">Directions and Parking</h3>

                    <p class="padding-10px">
                        J&B Music Pavilion is conveniently located near I-85 and I-485 in the University Area of Charlotte. 

                        From South Carolina 
                        Take I-77 N to I-85 N. Take exit 48 (I-485 East). Take the first exit for Highway 29, and make a left at the light at the end of the exit ramp. Make the first right onto Jazzy Blvd., and the J&B Music Pavilion will be on the left! 

                        From Points North 
                        Take I-85 S to exit 48 (I-485 East). Take the first exit for Highway 29, and make a left at the light at the end of the exit ramp. Make the first right onto Jazzy Blvd., and the J&B Music Pavilion will be on the left! 

                    </p>

                    <p class="padding-10px">
                        Parking
                        Lots are located adjacent to the J&B Music Pavilion and for your convenience parking is included in the ticket price. <br><br>

                        Upgraded parking is also available:<br>
                        Premier Parking – prices vary per show and is available in advance and day of show (subject to availability) <br>
                        Limo/RV Parking – prices vary per show and is available day of show only at the parking entrance
                    </p>
                </div>

            </main>
        </div>
         <!-- Sticky footer-->
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