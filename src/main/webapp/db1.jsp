<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIMS-Dashboard 1</title>
<link rel="stylesheet" type="text/css" href="<%= application.getContextPath() %>/css/style.css">
<style>
    /* Table Styles */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        text-align: left;
        padding: 12px;
        border: 1px solid #ddd;
    }
    th {
        background-color: #007bff;
        color: white;
        font-weight: bold;
    }
    tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tbody tr:hover {
        background-color: #ddd;
    }
    /* Link Styles */
    a {
        display: inline-block;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
        font-size: 1.1rem;
        transition: color 0.3s ease;
    }
    a:hover {
        color: #0056b3;
        text-decoration: underline;
    }
    /* Footer Styles */
    footer {
        margin-top: 20px;
        padding: 10px;
        background-color: #333;
        color: #fff;
        text-align: center;
        border-top: 3px solid #007bff;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Dashboard 1</h1>
        <p>This is the first dashboard where you can display reports or analytics for DB1.</p>

        <!-- Database connection and fetching data -->
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Department</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Declare connection, statement, and result set variables
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    // Database connection details
                    String dbURL = "jdbc:mysql://localhost:3306/StudentDB";
                    String dbUser = "root";
                    String dbPass = "root";

                    try {
                        // Load MySQL JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Establish the connection to the database
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                        // Create a statement
                        stmt = conn.createStatement();
                        String query = "SELECT student_id, first_name, last_name, email, department FROM Students";

                        // Execute the query
                        rs = stmt.executeQuery(query);

                        // Process the result set and display the data
                        while (rs.next()) {
                            int id = rs.getInt("student_id");
                            String firstName = rs.getString("first_name");
                            String lastName = rs.getString("last_name");
                            String email = rs.getString("email");
                            String department = rs.getString("department");

                            // Output the results in HTML table
                            out.println("<tr>");
                            out.println("<td>" + id + "</td>");
                            out.println("<td>" + firstName + "</td>");
                            out.println("<td>" + lastName + "</td>");
                            out.println("<td>" + email + "</td>");
                            out.println("<td>" + department + "</td>");
                            out.println("</tr>");
                        }
                    } catch (ClassNotFoundException e) {
                        out.println("<tr><td colspan='5'>JDBC Driver not found!</td></tr>");
                        e.printStackTrace();
                    } catch (SQLException e) {
                        out.println("<tr><td colspan='5'>Database error: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>

        <a href="index.jsp">Back to Main Dashboard</a>
    </div>

    <footer>
        <p>&copy; 2024 Dashboard App. All Rights Reserved.</p>
    </footer>
</body>
</html>
