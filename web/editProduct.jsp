<%@ page import="model.Product, dao.ProductDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    int id = Integer.parseInt(request.getParameter("id"));
    ProductDAO dao = new ProductDAO();
    Product p = dao.getById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <h2>Edit Product</h2>
    <form action="product" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= p.getId() %>">
        Name: <input type="text" name="name" value="<%= p.getName() %>" required><br><br>
        Description: <input type="text" name="description" value="<%= p.getDescription() %>"><br><br>
        Quantity: <input type="number" name="quantity" value="<%= p.getQuantity() %>" required><br><br>
        Price: <input type="number" name="price" value="<%= p.getPrice() %>" step="0.01" required><br><br>
        Warehouse ID: <input type="number" name="warehouse_id" value="<%= p.getWarehouseId() %>" required><br><br>
        <input type="submit" value="Update Product">
    </form>
    <p><a href="viewProducts.jsp">Back to Products</a></p>
</body>
</html>