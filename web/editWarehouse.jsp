<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        .edit-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s;
        }
        
        .form-group input:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 4px;
            transition: all 0.3s;
        }
        
        .back-link:hover {
            background-color: #e3f2fd;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h2>Edit Warehouse</h2>
        <form action="warehouse" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= w.getId() %>">
            
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" value="<%= w.getName() %>" required>
            </div>
            
            <div class="form-group">
                <label>Location</label>
                <input type="text" name="location" value="<%= w.getLocation() %>" required>
            </div>
            
            <button type="submit" class="btn-submit">Update Warehouse</button>
        </form>
        
        <a href="viewWarehouses.jsp" class="back-link">← Back to Warehouses</a>
    </div>
</body>
</html>