<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= username %>!</h2>
    <ul>
        <li><a href="addProduct.jsp">Add Product</a></li>
        <li><a href="viewProducts.jsp">View Products</a></li>
        <li><a href="addWarehouse.jsp">Add Warehouse</a></li>
        <li><a href="viewWarehouses.jsp">View Warehouses</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</body>
</html>