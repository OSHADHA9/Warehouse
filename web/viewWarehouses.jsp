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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
            line-height: 1.6;
        }
        
        h2 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        th {
            background-color: #3498db;
            color: white;
            padding: 12px;
            text-align: left;
        }
        
        td {
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        tr:hover {
            background-color: #f1f1f1;
        }
        
        a {
            color: #3498db;
            text-decoration: none;
            margin: 0 5px;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        p a {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 15px;
            background-color: #3498db;
            color: white;
            border-radius: 4px;
        }
        
        p a:hover {
            background-color: #2980b9;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h2>All Warehouses</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Location</th>
            <th>Capacity</th>
            <th>Action</th>
        </tr>
        <% for (Warehouse w : list) { %>
        <tr>
            <td><%= w.getId() %></td>
            <td><%= w.getLocation() %></td>
            <td><%= w.getName()%></td>
            
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