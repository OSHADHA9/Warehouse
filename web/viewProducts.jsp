<%@ page import="java.util.*, model.Product, dao.ProductDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    ProductDAO dao = new ProductDAO();
    List<Product> productList = dao.getAll();
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
</head>
<body>
    <h2>All Products</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Description</th>
            <th>Quantity</th><th>Price</th><th>Warehouse ID</th><th>Action</th>
        </tr>
        <%
            for (Product p : productList) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getDescription() %></td>
            <td><%= p.getQuantity() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getQuntity()%></td>
            <td>
                <a href="editProduct.jsp?id=<%= p.getId() %>">Edit</a> |
                <a href="product?action=delete&id=<%= p.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>