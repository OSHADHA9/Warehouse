<%@ page import="model.Warehouse, dao.WarehouseDAO" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    int id = Integer.parseInt(request.getParameter("id"));
    WarehouseDAO dao = new WarehouseDAO();
    Warehouse w = dao.getById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Warehouse</title>
</head>
<body>
    <h2>Edit Warehouse</h2>
    <form action="warehouse" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= w.getId() %>">
        Location: <input type="text" name="location" value="<%= w.getLocation() %>" required><br><br>
        Capacity: <input type="number" name="capacity" value="<%= w.getCapacity() %>" required><br><br>
        <input type="submit" value="Update Warehouse">
    </form>
    <p><a href="viewWarehouses.jsp">Back to Warehouses</a></p>
</body>
</html>