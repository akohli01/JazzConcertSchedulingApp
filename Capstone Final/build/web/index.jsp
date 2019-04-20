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
        <title>Home</title>

        <link rel="stylesheet" type="text/css" href="styles/styles.css" />
    </head
    <!--Body  -->
    <body>
        <div class="content">
            <!-- Header and navigation-->
            <header>
                <img src="images/logo1.png" alt="Logo" id="logo_img">
            </header>
            <nav>
                <ul>
                    <li><a href="index.jsp" class="active">Home</a></li>
                    <li><a href="reservation.jsp">Reservation</a></li>
                    <li><a href="venue.jsp">Venue</a></li>
                    <li><a href="support.jsp">Support</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
            </nav>

            <!-- Main section-->
            <main
                <!-- Main image -->
                <img src="images/jazz_concert_main.png" alt="Logo" class="center_image_main" />

                <!--Details for the concert-->
                <div class="concert_information">
                    <h3 class="text-align_center margin_none color_c0c0c0">Jazz Concert Information</h3>

                    <p class="padding-10px">
                        <b>Dates:</b> April 13 - 15, 2018 <br>
                        <b>Bands:</b> Jazzy Lazzy's United, Modern Jazz Police, Living 
                        Jazzy, Blues Woos, Jazz Dazzle <br><br>
                        <b>Schedule:</b>

                    <table id="schedule-table">
                        <tr>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Band</th>
                        </tr>
                        <tr>
                            <td rowspan="3">Friday, April 13</td>
                            <td>5:30 - 6:45 PM</td>
                            <td>Jazzy Lazzy's United</td>
                        </tr>
                        <tr>

                            <td>7:00 - 8:15 PM</td>
                            <td>Modern Jazz Police</td>
                        </tr>
                        <tr>

                            <td>8:30 - 9:15 PM</td>
                            <td>Living Jazzy</td>
                        </tr>
                        <tr>
                            <td rowspan="6">Saturday, April 14</td>
                            <td>1:30 - 2:45 PM</td>
                            <td>Blues Woos</td>
                        </tr>
                        <tr>
                            <td>3:00 - 4:15 PM</td>
                            <td>Jazz Dazzle</td>
                        </tr>
                        <tr>
                            <td>4:30 - 5:45 PM</td>
                            <td>Jazzy Lazzy's United</td>
                        </tr>
                        <tr>
                            <td>6:00 - 7:15 PM</td>
                            <td>Modern Jazz Police</td>
                        </tr>
                        <tr>
                            <td>7:30 - 8:45 PM</td>
                            <td>Living Jazzy</td>
                        </tr>
                        <tr>
                            <td>9:00 - 10:15 PM</td>
                            <td>Blues Woos</td>
                        </tr>

                        <tr>
                            <td rowspan="3" class="color-white">Sunday, April 15</td>
                            <td>1:00 - 2:15 PM</td>
                            <td>Jazz Dazzle</td>
                        </tr>

                        <tr>
                            <td>2:30 - 3:45 PM</td>
                            <td>Jazzy Lazzy's United</td>
                        </tr>

                        <tr>
                            <td>4:00 - 5:15 PM</td>
                            <td>Modern Jazz Police</td>
                        </tr>

                    </table>
                    <br>
                    </p>
                </div>
            </main>
        </div>
        <!-- Sticky footer -->
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
