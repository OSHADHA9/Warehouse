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
    <title>View Products | Warehouse System</title>
    <style>
        /* ==== Global Styles ==== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        /* ==== Header Styles ==== */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .header h2 {
            color: #2c3e50;
            margin: 0;
        }
        
        /* ==== Action Buttons ==== */
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        
        .btn-primary {
            background-color: #3498db;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: #95a5a6;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
        
        /* ==== Product Table ==== */
        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .product-table th {
            background-color: #3498db;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .product-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .product-table tr:hover {
            background-color: #f1f9ff;
        }
        
        .product-table tr:last-child td {
            border-bottom: none;
        }
        
        /* ==== Action Links ==== */
        .action-links {
            display: flex;
            gap: 10px;
        }
        
        .action-link {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            padding: 4px 8px;
            border-radius: 4px;
        }
        
        .action-link:hover {
            background-color: #e3f2fd;
        }
        
        .action-link.delete {
            color: #e74c3c;
        }
        
        .action-link.delete:hover {
            background-color: #fdecea;
        }
        
        /* ==== Status Indicators ==== */
        .status-low {
            color: #e74c3c;
            font-weight: 500;
        }
        
        .status-medium {
            color: #f39c12;
            font-weight: 500;
        }
        
        .status-high {
            color: #2ecc71;
            font-weight: 500;
        }
        
        /* ==== Responsive Design ==== */
        @media (max-width: 768px) {
            .product-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="header">
        <h2><i class="fas fa-boxes"></i> Product Inventory</h2>
        <div class="action-buttons">
            <a href="addProduct.jsp" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add Product
            </a>
            <a href="dashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Dashboard
            </a>
        </div>
    </div>
    
    <table class="product-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Product p : productList) {
                    String quantityClass = "";
                    if (p.getQuantity() < 10) {
                        quantityClass = "status-low";
                    } else if (p.getQuantity() < 25) {
                        quantityClass = "status-medium";
                    } else {
                        quantityClass = "status-high";
                    }
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><strong><%= p.getName() %></strong></td>
                <td><%= p.getDescription() != null ? p.getDescription() : "N/A" %></td>
                <td class="<%= quantityClass %>">
                    <%= p.getQuantity() %>
                    <% if (p.getQuantity() < 10) { %>
                        <i class="fas fa-exclamation-triangle"></i>
                    <% } %>
                </td>
                <td>$<%= String.format("%.2f", p.getPrice()) %></td>
                <td>
                    <div class="action-links">
                        <a href="editProduct.jsp?id=<%= p.getId() %>" class="action-link">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="product?action=delete&id=<%= p.getId() %>" 
                           class="action-link delete"
                           onclick="return confirm('Are you sure you want to delete this product?')">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </div>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    
    <script>
        // Simple confirmation for delete action
        function confirmDelete() {
            return confirm('Are you sure you want to delete this product?');
        }
    </script>
</body>
</html>
   
    
   
  
