<%-- 
    Document   : index
    Created on : Mar 16, 2018, 11:20:07 AM
    Author     : Group 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" errorPage="" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <!--Head-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reports</title>

        <link rel="stylesheet" type="text/css" href="styles/styles.css">
    </head>
    <!--Body-->
    <body>
        <%!
            /*Declare variables*/
            Connection con = null;
            ResultSet rs = null;
            PreparedStatement preparedStatement = null;
            String driver = "org.apache.derby.jdbc.ClientDataSource";
            String url = "jdbc:derby://localhost:1527/Certificate;user=app;password=password";
            int category1, category2, category3;

            //Used in the Total Sales query (Extra Credit)
            double category1Sales, category2Sales, category3Sales;
            final int category1Price = 50, category2Price = 40, category3Price = 30;
            double serviceFees, shippingFees, totalSales;

            /**
             * *************** Database methods****************************
             */
            /**
             * *********Creates a connection with Java Derby**************
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

            /**
             * *******Queries *******************************
             */
            //Determine how many tickets were sold in each category
            void numberOfTicketsSold() {
                try {

                    preparedStatement = con.prepareStatement("Select count(*) from Ticket where category_number = ?");

                    preparedStatement.setInt(1, 1);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category1 = rs.getInt(1);
                    }

                    preparedStatement.setInt(1, 2);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category2 = rs.getInt(1);
                    }

                    preparedStatement.setInt(1, 3);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category3 = rs.getInt(1);
                    }

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }

            //Determine how many seats are available in each category
            void numberOfSeatsAvailable() {
                try {

                    preparedStatement = con.prepareStatement("Select count(*) from Ticket where category_number = ?");

                    preparedStatement.setInt(1, 1);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category1 = 75 - rs.getInt(1);
                    }

                    preparedStatement.setInt(1, 2);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category2 = 75 - rs.getInt(1);
                    }

                    preparedStatement.setInt(1, 3);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category3 = 75 - rs.getInt(1);
                    }

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }

            //Determine the cost breakdown (total sales per category, total amount for serviceFees, total amount for shipping fees, and the grand total)
            void totalSales() {
                try {

                    preparedStatement = con.prepareStatement("Select count(*) from Ticket where category_number = ?");

                    preparedStatement.setInt(1, 1);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category1 = category1Price * rs.getInt(1);
                    }

                    preparedStatement.setInt(1, 2);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category2 = category2Price * rs.getInt(1);
                    }

                    preparedStatement.setInt(1, 3);
                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        category3 = category3Price * rs.getInt(1);
                    }

                    preparedStatement = con.prepareStatement("Select Sum(service_fee) from Reservation");

                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        serviceFees = rs.getInt(1);
                    }

                    preparedStatement = con.prepareStatement("Select Sum(shipping_fee) from Reservation");

                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        shippingFees = rs.getInt(1);
                    }

                    preparedStatement = con.prepareStatement("Select Sum(total) from Reservation");

                    rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        totalSales = rs.getInt(1);
                    }

                } catch (Exception e) {
                    e.printStackTrace();

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
        %>



        <div class="content">
             <!-- Header and navigation -->
            <header>
                <img src="images/logo1.png" alt="Logo" id="logo_img">
            </header>
            <nav>
                <ul>
                    <li><a href="index.jsp" >Home</a></li>
                    <li><a href="reservation.jsp">Reservation</a></li>
                    <li><a href="venue.jsp">Venue</a></li>
                    <li><a href="support.jsp">Support</a></li>
                    <li><a href="reports.jsp" class="active">Reports</a></li>
                </ul>
            </nav>

             <!--Main section -->
            <main>
                 <h2 class="text-align_center padding-10px">Reports (Click a button)</h2>
                <form method="POST" action="reports.jsp" id="query">
                    <button type="submit" form="query" value="Submit" name="tickets_sold" title="Click me!" ><h3>Number of Tickets sold in each Category</h3></button>
                    <br>
                    <button type="submit" form="query" value="Submit" name="seats_available" title="Click me!" ><h3>Number of Seats Available in each category</h3></button>
                    <br>
                    <button type="submit" form="query" value="Submit" name="total_sales" title="Click me!" ><h3>Cost Breakdown (Sales by Category, Service Fees, Shipping Fees, and Grand Total) - Extra Credit</h3></button>
                </form>

                <%
                    if (request.getParameter("tickets_sold") != null) {
                        createDatabaseConnection();
                        numberOfTicketsSold();

                        out.println("<div class='results'>");
                        out.println("<h3>Results:</h3>");
                        out.println("<table>");
                        out.println("<tr>");
                        out.println("<th colspan=\"2\">Number of Tickets Purchased</th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Category 1: </td>");
                        out.println("<td>" + category1 + "</td>");
                        out.println("</tr>");
                        out.println("<td>Category 2:</td>");
                        out.println("<td>" + category2 + "</td>");
                        out.println("</tr>");
                        out.println("<td>Category 3:</td>");
                        out.println("<td>" + category3 + "</td>");
                        out.println("</tr>");
                        out.println("</table>");
                        out.println("</div>");

                        shutdown();

                    }

                    if (request.getParameter("seats_available") != null) {
                        createDatabaseConnection();
                        numberOfSeatsAvailable();

                        out.println("<div class='results'>");
                        out.println("<h3>Results:</h3>");
                        out.println("<table>");
                        out.println("<tr>");
                        out.println("<th colspan=\"2\">Number of Seats Available</th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Category 1: </td>");
                        out.println("<td>" + category1 + "</td>");
                        out.println("</tr>");
                        out.println("<td>Category 2:</td>");
                        out.println("<td>" + category2 + "</td>");
                        out.println("</tr>");
                        out.println("<td>Category 3:</td>");
                        out.println("<td>" + category3 + "</td>");
                        out.println("</tr>");
                        out.println("</table>");
                        out.println("</div>");

                        shutdown();
                    }

                    if (request.getParameter("total_sales") != null) {
                        createDatabaseConnection();
                        totalSales();

                        out.println("<div class='results'>");
                        out.println("<h3>Results:</h3>");
                        out.println("<table>");
                        out.println("<tr>");
                        out.println("<th colspan=\"2\">Sales Breakdown</th>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Category 1: </td>");
                        out.println("<td>$" + category1 + "</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Category 2:</td>");
                        out.println("<td>$" + category2 + "</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Category 3:</td>");
                        out.println("<td>$" + category3 + "</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Service Fees:</td>");
                        out.println("<td>$" + serviceFees + "</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Shipping Fees:</td>");
                        out.println("<td>$" + shippingFees + "</td>");
                        out.println("</tr>");
                        out.println("<tr>");
                        out.println("<td>Grand Total:</td>");
                        out.println("<td>$" + totalSales + "</td>");
                        out.println("</tr>");
                        out.println("</table>");
                        out.println("</div>");

                        shutdown();
                    }
                %>
                
            </main>
        </div>
        <!--Sticky Footer-->
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