<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .edit-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 25px;
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
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        .form-group input:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }
        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
            background-color: #2980b9;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h2>Edit Product</h2>
        <form action="product" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= p.getId() %>">
            
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" value="<%= p.getName() %>" required>
            </div>
            
            <div class="form-group">
                <label>Description</label>
                <input type="text" name="description" value="<%= p.getDescription() %>">
            </div>
            
            <div class="form-group">
                <label>Quantity</label>
                <input type="number" name="quantity" value="<%= p.getQuantity() %>" required>
            </div>
            
            <div class="form-group">
                <label>Price</label>
                <input type="number" name="price" value="<%= p.getPrice() %>" step="0.01" required>
            </div>
            
            <div class="form-group">
                <label>Warehouse ID</label>
                <input type="number" name="warehouse_id" value="<%= p.getWarehouseId() %>" required>
            </div>
            
            <button type="submit" class="btn-submit">Update Product</button>
        </form>
        
        <a href="viewProducts.jsp" class="back-link">← Back to Products</a>
    </div>
</body>
</html>