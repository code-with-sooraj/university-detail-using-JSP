<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIMS-Dashboard 3</title>
<link rel="stylesheet" type="text/css"
	href=" <%=application.getContextPath()%>/css/style.css">
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
		<h1>Enrollments Details</h1>
		<p>These are the enrollments done by students for ongoing courses
			in Vignan University.</p>
		<table>
			<thead>
				<tr>
					<th>Student ID</th>
					<th>Student Name</th>
					<th>Course ID</th>
					<th>Course Name</th>
					<th>Grade</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				String query2 = "SELECT g.grade AS 'Grade', s.student_id AS 'Student ID', s.first_name AS 'Student First Name', s.last_name AS 'Student Last Name',  c.course_id AS 'Course ID', c.course_name AS 'Course Name' FROM Grades g JOIN Students s ON g.student_id = s.student_id JOIN Courses c ON g.course_id = c.course_id";

				ResultSet rs = null;
				Statement stmt = null;
				Connection conn = null;

				try {
					// Load MySQL JDBC Driver
					Class.forName("com.mysql.cj.jdbc.Driver");

					// Database connection details
					String url = "jdbc:mysql://localhost:3306/StudentDB";
					String user = "root";
					String password = "root";

					// Establish connection
					conn = DriverManager.getConnection(url, user, password);
					stmt = conn.createStatement();

					// Execute the query
					rs = stmt.executeQuery(query2);

					// Process the result set and display the data
					while (rs.next()) {
						
						int Student_ID = rs.getInt("Student ID");
						String Student_First_Name = rs.getString("Student First Name");
						String Student_Last_Name = rs.getString("Student Last Name");
						int Course_ID = rs.getInt("Course ID");
						String Course_Name = rs.getString("Course Name");
						String Grade = rs.getString("Grade");
						

						// Output the results in HTML table
						out.println("<tr>");
						
						out.println("<td>" + Student_ID + "</td>");
						out.println("<td>" + Student_First_Name+" "+Student_Last_Name+ "</td>");
						out.println("<td>" + Course_ID + "</td>");
						out.println("<td>" + Course_Name + "</td>");
						out.println("<td>" + Grade + "</td>");
						out.println("</tr>");
					}
				} catch (ClassNotFoundException e) {
					out.println("<tr><td colspan='6'>JDBC Driver not found!</td></tr>");
					e.printStackTrace();
				} catch (SQLException e) {
					out.println("<tr><td colspan='6'>Database error: " + e.getMessage() + "</td></tr>");
					e.printStackTrace();
				} finally {
					// Close resources
					if (rs != null)
						try {
					rs.close();
						} catch (SQLException e) {
					e.printStackTrace();
						}
					if (stmt != null)
						try {
					stmt.close();
						} catch (SQLException e) {
					e.printStackTrace();
						}
					if (conn != null)
						try {
					conn.close();
						} catch (SQLException e) {
					e.printStackTrace();
						}
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
