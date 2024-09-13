<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIMS-Dashboard 2</title>
<link rel="stylesheet" type="text/css" href=" <%= application.getContextPath() %>/css/style.css">
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
        <h1>Course Details</h1>
        <p>These are the running course going in Vignan University.</p>
        <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Credits</th>
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
                        String query = "SELECT course_id , course_name, credits FROM Courses";

                        // Execute the query
                        rs = stmt.executeQuery(query);

                        // Process the result set and display the data
                        while (rs.next()) {
                            int id = rs.getInt("course_id");
                            String course_Name = rs.getString("course_name");
                            String credits = rs.getString("credits");
                           

                            // Output the results in HTML table
                            out.println("<tr>");
                            out.println("<td>" + id + "</td>");
                            out.println("<td>" + course_Name + "</td>");
                            out.println("<td>" + credits + "</td>");
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
