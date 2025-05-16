<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Warehouse</title>
</head>
<body>
    <h2>Add Warehouse</h2>
    <form action="warehouse" method="post">
        <input type="hidden" name="action" value="add">
        Location: <input type="text" name="location" required><br><br>
        Capacity: <input type="number" name="capacity" required><br><br>
        <input type="submit" value="Add Warehouse">
    </form>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>