<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product | Warehouse Management</title>
    <style>
        /* ==== Global Styles ==== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }
        
        /* ==== Header Styles ==== */
        .header {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: white;
            padding: 15px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        
        .header h1 {
            margin: 0;
            text-align: center;
            font-size: 24px;
        }
        
        /* ==== Main Container ==== */
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        /* ==== Form Styles ==== */
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        
        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border 0.3s;
        }
        
        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        
        /* ==== Button Styles ==== */
        .btn {
            display: inline-block;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
            text-align: center;
            font-size: 16px;
        }
        
        .btn-primary {
            background-color: #3498db;
            color: white;
            width: 100%;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: #95a5a6;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            margin-top: 15px;
            display: inline-block;
        }
        
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
        
        /* ==== Responsive Design ==== */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Warehouse Management System</h1>
    </div>
    
    <div class="container">
        <h2>Add New Product</h2>
        
        <form action="product" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-group">
                <label for="name">Product Name</label>
                <input type="text" id="name" name="name" required placeholder="Enter product name">
            </div>
            
            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" id="description" name="description" placeholder="Enter product description">
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" required placeholder="Enter quantity">
            </div>
            
            <div class="form-group">
                <label for="price">Price (LKR)</label>
                <input type="number" id="price" name="price" step="0.01" required placeholder="0.00">
            </div>
            
            <div class="form-group">
                <label for="warehouse_id">Warehouse ID</label>
                <input type="number" id="warehouse_id" name="warehouse_id" required placeholder="Enter warehouse ID">
            </div>
            
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="dashboard.jsp" class="btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>