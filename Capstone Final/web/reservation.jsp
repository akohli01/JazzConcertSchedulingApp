<%-- 
    Document   : reservation
    Created on : Mar 16, 2018, 11:20:07 AM
    Author     : Group 1
--%>
<!--Define necessary imports for JSP -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" errorPage="" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
     <!---Head section-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reservation</title>

        <link rel="stylesheet" type="text/css" href="styles/styles.css">

    </head>
    <!---Body section-->
    <body>
        <!-- JSP code to process the reservation data -->

        <%! // The '!' symbol is need by JSP in order to use methods 
            
            /*Declare variables*/
            Connection con = null;
            ResultSet rs = null;
            PreparedStatement preparedStatement = null;
            ResultSet tableKeys = null;
            String driver = "org.apache.derby.jdbc.ClientDataSource";
            String url = "jdbc:derby://localhost:1527/Certificate;user=app;password=password";
            //StringBuilder was covered in the Netbeans project
            StringBuilder errorMessage = new StringBuilder();
            StringBuilder successMessage = new StringBuilder();
            StringBuilder emptyReservationErrorMessage = new StringBuilder();

            /**
             * *************** Database methods****************************
             */
            /**
             * *********Create a connection with Java Derby**************
             */
            void createDatabaseConnection() {
                try {
                    Class.forName(driver).newInstance();
                    // Get a connection
                    con = DriverManager.getConnection(url);
                    System.out.println("Connection established");
                } catch (Exception except) {
                    except.printStackTrace();
                }
            }

            /*Method to check availability for seats in each category*/
            boolean checkAvailability(int category1, int category2, int category3){
                //Declare variables
                int category1Availability = 75, category2Availability = 75, category3Availability = 75;
                boolean errorChecker = false;
                
                //Check to make sure the user has selected a seat in at least one category
                if(category1 == 0 && category2 == 0 && category3 ==0){
                    emptyReservationErrorMessage.append("Sorry, you did not choose a seat in any category. <br>Please choose a seat in at least one category.<br><br>");
                    return true;      
                }
                
                //Check to make sure there are enough seats available in each category according to the user's selection
                try {

                    preparedStatement = con.prepareStatement("Select count(*) from Ticket where category_number = ?");

                    preparedStatement.setInt(1, 1);

                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category1Availability = 75 - rs.getInt(1);
                    }

                    if (category1 > category1Availability) {
                        errorChecker = true;
                    }

                    preparedStatement.setInt(1, 2);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category2Availability = 75 - rs.getInt(1);
                    }

                    if (category2 > category2Availability) {
                        errorChecker = true;
                    }

                    preparedStatement.setInt(1, 3);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category3Availability = 75 - rs.getInt(1);
                    }

                    if (category3 > category3Availability) {
                        errorChecker = true;
                    }

                    if (errorChecker == true) {
                        generateAlertMessage(category1Availability, category2Availability, category3Availability);

                    }

                } catch (Exception e) {
                    e.printStackTrace();

                }

                return errorChecker;
            }

            /**
             * Generate an error message (only used in certain situations such as no availability)
             */
            void generateAlertMessage(int category1Availability, int category2Availability, int category3Availability) {
                errorMessage.append("Sorry, 1 or more of your selections is not available <br><br>");
                errorMessage.append("Category 1 has " + category1Availability + " seats available <br>");
                errorMessage.append("Category 2 has " + category2Availability + " seats available <br>");
                errorMessage.append("Category 3 has " + category3Availability + " seats available");
            }

            /**
             * Generate a success message (used if everything goes fine and no errors take place)
             */
            void generateSuccessMessage(String firstName, String lastName, int category1, int category2, int category3, int subtotal, double serviceFee, double shippingFee, double total) {
                //declare String variables to store the corresponding numeric data (please see next comment for additional detail)
                String subtotalString,serviceFeeString, shippingFeeString, totalString;
                
                //Format the numeric types to include 2 decimal places using String.format (page 175 in Java textbook)
                subtotalString = String.format("%02.2f", (double)subtotal);
                serviceFeeString = String.format("%02.2f", serviceFee);
                shippingFeeString = String.format("%02.2f", shippingFee);
                totalString = String.format("%.2f", total);
                
                //Add data to Stringbuilder successMessage using append (append was used in the Netbeans project)
                successMessage.append("<div class=\"center\">");
                successMessage.append("Thank you " + firstName + " " + lastName + " for your order!<br><br>");
                successMessage.append("Here are the details for your order:<br><br>");
                
                successMessage.append("<table>");
                successMessage.append("<tr>");
                successMessage.append("<th colspan=\"2\">Number of Tickets Purchased</th>");
                successMessage.append("</tr>");
                successMessage.append("<tr>");
                successMessage.append("<td>Category 1: </td>");
                successMessage.append("<td>" + category1 +"</td>");
                successMessage.append("</tr>");
                successMessage.append("<td>Category 2:</td>");
                successMessage.append("<td>" + category2 +"</td>");
                successMessage.append("</tr>");
                successMessage.append("<td>Category 3:</td>");
                successMessage.append("<td>" + category3 +"</td>");
                successMessage.append("</tr>");
                successMessage.append("</table>");
                successMessage.append("<br>");
                
                successMessage.append("<table>");
                successMessage.append("<tr>");
                successMessage.append("<th colspan=\"2\">Cost Breakdown</th>");
                successMessage.append("</tr>");
                successMessage.append("<tr>");
                successMessage.append("<td>Subtotal:</td>");
                successMessage.append("<td>" + subtotalString +"</td>");
                successMessage.append("</tr>");
                successMessage.append("<td>Service Fee:</td>");
                successMessage.append("<td>" + serviceFeeString +"</td>");
                successMessage.append("</tr>");
                successMessage.append("<td>Shipping Fee:</td>");
                successMessage.append("<td>" + shippingFeeString +"</td>");
                successMessage.append("</tr>");
                successMessage.append("</tr>");
                successMessage.append("<td>Grand Total:</td>");
                successMessage.append("<td>" + totalString +"</td>");
                successMessage.append("</tr>");
                successMessage.append("</table>");
            }

            /**
             * Inserts the data into the correct tables in the database
             */
                  
            //Insert customer information into customer table
            void insertCustomerInformation(String firstName, String lastName, String email, String phoneNumber, String streetAddress, String city, String state, int zip) {
                try {
                    preparedStatement = con.prepareStatement("insert into Customer (first_name, last_name, email, phone_number, street_address, city, state, zip) values(?,?,?,?,?,?,?,?)");
                    preparedStatement.setString(1, firstName);
                    preparedStatement.setString(2, lastName);
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, phoneNumber);
                    preparedStatement.setString(5, streetAddress);
                    preparedStatement.setString(6, city);
                    preparedStatement.setString(7, state);
                    preparedStatement.setInt(8, zip);

                    preparedStatement.executeUpdate();

                    preparedStatement.close();
                } catch (SQLException sqlExcept) {
                    sqlExcept.printStackTrace();
                }
            }

            //Insert reservation information into the reservation table
            void insertReservationInformation(String purchaseType, int subtotal, double serviceFee, double shippingFee, double total, String email, int category1, int category2, int category3) {
                try {

                    preparedStatement = con.prepareStatement("insert into Reservation (date, purchase_type, subtotal, service_fee, shipping_fee, total, email) values(?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

                    preparedStatement.setDate(1, new java.sql.Date(System.currentTimeMillis()));
                    preparedStatement.setString(2, purchaseType);
                    preparedStatement.setInt(3, subtotal);
                    preparedStatement.setDouble(4, serviceFee);
                    preparedStatement.setDouble(5, shippingFee);
                    preparedStatement.setDouble(6, total);
                    preparedStatement.setString(7, email);

                    preparedStatement.executeUpdate();

                    tableKeys = preparedStatement.getGeneratedKeys();
                    tableKeys.next();
                    int autoGeneratedID = tableKeys.getInt(1);

                    insertTicketInformation(category1, category2, category3, autoGeneratedID);

                    preparedStatement.close();
                } catch (SQLException sqlExcept) {
                    sqlExcept.printStackTrace();
                }
            }

            //Insert ticket information into tickets table        
            void insertTicketInformation(int category1, int category2, int category3, int reservationNumber) {
                try {

                    preparedStatement = con.prepareStatement("insert into Ticket (category_number, reservation_number) values(?,?)");

                    if (category1 != 0) {

                        for (int i = 0; i < category1; i++) {
                            preparedStatement.setInt(1, 1);
                            preparedStatement.setInt(2, reservationNumber);
                            preparedStatement.executeUpdate();
                        }
                    }

                    if (category2 != 0) {

                        for (int i = 0; i < category2; i++) {
                            preparedStatement.setInt(1, 2);
                            preparedStatement.setInt(2, reservationNumber);
                            preparedStatement.executeUpdate();
                        }
                    }

                    if (category3 != 0) {
                        for (int i = 0; i < category3; i++) {
                            preparedStatement.setInt(1, 3);
                            preparedStatement.setInt(2, reservationNumber);
                            preparedStatement.executeUpdate();
                        }
                    }

                    preparedStatement.close();
                } catch (SQLException sqlExcept) {
                    sqlExcept.printStackTrace();
                }
            }

            /**
             * *Shuts down the database server so that resources can be saved
             * when not being used
             */
            void shutdown() {
            
                try {
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (con != null) {
                         DriverManager.getConnection("jdbc:derby:;shutdown=true");
                        con.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            /**
             * ********Calculation methods*******
             */
            
            //Calculate the subtotal(cost for tickets based on category only)
            int determineSubtotal(int category1, int category2, int category3) {
                final int CATEGORY_1_PRICE = 50;
                final int CATEGORY_2_PRICE = 40;
                final int CATEGORY_3_PRICE = 30;

                return (CATEGORY_1_PRICE * category1) + (CATEGORY_2_PRICE * category2) + (CATEGORY_3_PRICE * category3);
            }

            //Calculate the service fee
            double determineServiceFee(String purchaseType, int subtotal) {
                final double SERVICE_FEE_RATE = .07;

                if (purchaseType.equals("in_person")) {
                    return 0;
                } else {
                    return (subtotal * SERVICE_FEE_RATE);
                }
            }
            
            //Calculate the shipping fee
            double determineShippingFee(String purchaseType) {
                final double SHIPPING_FEE_AMOUNT = 5.95;

                if (purchaseType.equals("online_shipping")) {
                    return SHIPPING_FEE_AMOUNT;
                } else {
                    return 0;
                }
            }

            //Calculate the total cost for a reservation by adding up the subtotal, shipping fee, and service fee
            double determineTotal(int subtotal, double serviceFee, double shippingFee) {

                return subtotal + serviceFee + shippingFee;
            }

            /**
             * **Check if customer exists. This method will not allow a customer to be added again in the customer table if they already exist. This is done to 
             * reduce redundancies.
             */
            boolean checkCustomerExistence(String email) {
                try {

                    preparedStatement = con.prepareStatement("Select count(*) from Customer where email = ?");
                    preparedStatement.setString(1, email);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        if (rs.getInt(1) != 0) {
                            return true;
                        }

                    }

                } catch (Exception e) {
                    e.printStackTrace();

                }

                return false;
            }
        %>

        <%
            //Check if reservation form has been submitted. This is done using the getParameter method covered on the Netbeans project
            if (request.getParameter("submit") != null) {
                //Declare variables that need to have full scope of this if statement (Scope was covered on page 75 - Java textbook)
                boolean errorChecker;
                
                //Get user's selection for the number of tickets per category;
                int category1 = Integer.parseInt(request.getParameter("category_1"));
                int category2 = Integer.parseInt(request.getParameter("category_2"));
                int category3 = Integer.parseInt(request.getParameter("category_3"));

                createDatabaseConnection();
                errorChecker = checkAvailability(category1, category2, category3);

                if (errorChecker != true) {
                    
                    //Declare variables that need to have a scope for this if statement
                    int subtotal, zip;
                    double serviceFee, shippingFee, total;
                    boolean existingCustomer = false;
                    String firstName, lastName, email, phoneNumber, streetAddress, city, state, purchaseType;
                    
                    //Get the data from the reservation form and assign it to the corresponding variables
                    firstName = request.getParameter("first_name");
                    lastName = request.getParameter("last_name");
                    email = request.getParameter("email");
                    existingCustomer = checkCustomerExistence(email);
                    phoneNumber = request.getParameter("phone_number");
                    streetAddress = request.getParameter("street_address");
                    city = request.getParameter("city");
                    state = request.getParameter("state");
                    zip = Integer.parseInt(request.getParameter("zip"));
                    purchaseType = request.getParameter("purchase_type");

                    //Calculate the necessary costs
                    subtotal = determineSubtotal(category1, category2, category3);
                    serviceFee = determineServiceFee(purchaseType, subtotal);
                    shippingFee = determineShippingFee(purchaseType);
                    total = determineTotal(subtotal, serviceFee, shippingFee);

                    //Check if customer exists already in database
                    if (existingCustomer != true) {
                        insertCustomerInformation(firstName, lastName, email, phoneNumber, streetAddress, city, state, zip);

                    }

                    //Insert reservation information into reservation table by calling the appropriate method
                    insertReservationInformation(purchaseType, subtotal, serviceFee, shippingFee, total, email, category1, category2, category3);

                    //Generate a success message if everything went fine
                    generateSuccessMessage(firstName, lastName, category1, category2, category3, subtotal, serviceFee, shippingFee, total);

                }
                
                //Close the database connection
                shutdown();
            }
        %>

        <!--Page content -->
        <div class="content">
            <!-- Header and navigation-->
            <header>
                <img src="images/logo1.png" alt="Logo" id="logo_img">

            </header>
            <nav>
                <ul>
                    <li><a href="index.jsp" >Home</a></li>
                    <li><a href="reservation.jsp" class="active">Reservation</a></li>
                    <li><a href="venue.jsp">Venue</a></li>
                    <li><a href="support.jsp">Support</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
            </nav>
            <!-- Main section-->
            <main>
                <h3 class="heading_margin_left">Reservation Form</h3>
                 <!--Reservation form -->
                <form method="POST" action="reservation.jsp">

                    <fieldset class="customer_fieldset">
                        <legend>Customer Information:</legend>
                        First Name <input type="text" name ="first_name" required><br>
                        Email <input type="email" name ="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required><br>
                        Last Name <input type="text" name ="last_name" required><br>
                        Phone Number <input type="tel" name ="phone_number" required> <br>
                        Street Address: <input type="text" name ="street_address" required><br>
                        City: <input type="text" name ="city" required> <br>
                        State: <input type="text" name ="state" required><br>
                        Zip: <input type="text" name ="zip" required> 
                    </fieldset>
                    <br>
                    <fieldset class="reservation_fieldset">
                        <legend>Ticket Reservation</legend>
                        <br>
                        Category 1 ($50 each): <input type="number" name ="category_1" min="0" max="75" value="0"> <br>  
                        Category 2 ($40 each): <input type="number" name ="category_2" min="0" max="75" value="0"> <br>  
                        Category 3 ($30 each): <input type="number" name ="category_3" min="0" max="75" value="0">  
                        <br>

                        <h4>Purchase Type:</h4>
                        <input type="radio" name="purchase_type" value="in_person" required>In-person* 
                        <input type="radio" name="purchase_type" value="online_shipping">Online with Shipping**
                        <input type="radio" name="purchase_type" value="online_no_shipping">Online - No Shipping*** <br>

                        <p>
                            *In-person option results in no service or shipping fees<br>
                            **Online with shipping results in a 7% service fee and $5.95 for shipping <br>
                            ***Online - No Shipping only results in a 7% service fee
                        </p>

                        <input type="reset" value="Clear">
                        <input type="submit" name="submit" value="Submit"/>

                    </fieldset>
                </form>

                 <!-- This JSP code will output the results (whether success or error) onto the same page -->
                <%
                    if (request.getParameter("submit") != null) {

                        if (successMessage != null && successMessage.length() !=0) {

                            out.println("<div class='results'>");
                            out.println("<h3>Results:</h3>");
                            out.println(successMessage);
                            out.println("</div>");
                        }

                        successMessage = new StringBuilder();

                    }

                    if (request.getParameter("submit") != null && errorMessage.length() !=0) {

                        if (errorMessage != null) {
                            out.println("<div class='results'>");
                            out.println("<h3>Results:</h3>");
                            out.println(errorMessage);
                            out.println("</div>");

                        }
                        errorMessage = new StringBuilder();
                    }

                    if (request.getParameter("submit") != null) {

                        if (emptyReservationErrorMessage != null && emptyReservationErrorMessage.length() !=0) {
                            out.println("<div class='results'>");
                            out.println("<h3>Results:</h3>");
                            out.println(emptyReservationErrorMessage);
                            out.println("</div>");

                        }
                        emptyReservationErrorMessage = new StringBuilder();
                    }

                %>

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