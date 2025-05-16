<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h2>Add Product</h2>
    <form action="product" method="post">
        <input type="hidden" name="action" value="add">
        Name: <input type="text" name="name" required><br><br>
        Description: <input type="text" name="description"><br><br>
        Quantity: <input type="number" name="quantity" required><br><br>
        Price: <input type="number" step="0.01" name="price" required><br><br>
        Warehouse ID: <input type="number" name="warehouse_id" required><br><br>
        <input type="submit" value="Add Product">
    </form>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>