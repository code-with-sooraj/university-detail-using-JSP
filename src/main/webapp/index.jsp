<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Dashboard</title>
<link rel="stylesheet" type="text/css" href=" <%= application.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Main Dashboard</h1>

        <!-- Button 1 for db1.jsp -->
        <form action="db1.jsp" method="get">
            <button type="submit">List of students</button>
        </form>

        <!-- Button 2 for db2.jsp -->
        <form action="db2.jsp" method="get">
            <button type="submit">List of Courses</button>
        </form>

        <!-- Button 3 for db3.jsp -->
        <form action="db3.jsp" method="get">
            <button type="submit">List of enrollments</button>
        </form>
        
        
        <form action="db4.jsp" method="get">
            <button type="submit">List of grades</button>
        </form>
        
        
        
    </div>

    <footer>
        <p>&copy; 2024 Dashboard App. All Rights Reserved.</p>
    </footer>
</body>
</html>
