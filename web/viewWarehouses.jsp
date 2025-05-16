<%@ page import="java.util.*, model.Warehouse, dao.WarehouseDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    WarehouseDAO dao = new WarehouseDAO();
    List<Warehouse> list = dao.getAll();
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Warehouses</title>
</head>
<body>
    <h2>All Warehouses</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Location</th><th>Capacity</th><th>Action</th>
        </tr>
        <% for (Warehouse w : list) { %>
        <tr>
            <td><%= w.getId() %></td>
            <td><%= w.getName()%></td>
            <td><%= w.getLocation() %></td>
            
            <td>
                <a href="editWarehouse.jsp?id=<%= w.getId() %>">Edit</a> |
                <a href="warehouse?action=delete&id=<%= w.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>