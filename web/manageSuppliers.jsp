<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Suppliers | Warehouse System</title>
    <style>
        /* ==== Global Styles ==== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        /* ==== Container Styles ==== */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* ==== Form Styles ==== */
        .form-section {
            margin-bottom: 40px;
            padding: 25px;
            background: #f9f9f9;
            border-radius: 8px;
        }
        
        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
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
        
        .form-group input, 
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s;
        }
        
        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .form-group input:focus, 
        .form-group textarea:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        /* ==== Button Styles ==== */
        .btn {
            padding: 12px 24px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* ==== Table Styles ==== */
        .supplier-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .supplier-table th {
            background-color: #3498db;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .supplier-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .supplier-table tr:hover {
            background-color: #f1f9ff;
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
            padding: 5px 10px;
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
        
        /* ==== Back Link ==== */
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
        
        /* ==== Divider ==== */
        .divider {
            border: none;
            height: 1px;
            background-color: #e0e0e0;
            margin: 30px 0;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="form-section">
            <h2><i class="fas fa-truck"></i> Add Supplier</h2>
            <form method="post" action="SupplierServlet">
                <input type="hidden" name="action" value="add" />
                
                <div class="form-group">
                    <label for="name">Supplier Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="contact_person">Contact Person</label>
                    <input type="text" id="contact_person" name="contact_person" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" id="phone" name="phone" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" required></textarea>
                </div>
                
                <button type="submit" class="btn"><i class="fas fa-plus-circle"></i> Add Supplier</button>
            </form>
        </div>
        
        <hr class="divider">
        
        <h2><i class="fas fa-list"></i> Supplier List</h2>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:4306/warehouse_db", "root", "");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM suppliers");
        %>
        <table class="supplier-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Contact Person</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id")%></td>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("contact_person")%></td>
                    <td><%= rs.getString("phone")%></td>
                    <td><%= rs.getString("email")%></td>
                    <td><%= rs.getString("address")%></td>
                    <td>
                        <div class="action-links">
                            <a href="editSupplier.jsp?id=<%= rs.getInt("id")%>" class="action-link">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <a href="SupplierServlet?action=delete&id=<%= rs.getInt("id")%>" 
                               class="action-link delete"
                               onclick="return confirm('Are you sure you want to delete this supplier?')">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </div>
                    </td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        out.println("<div class='error-message'>Error: " + e.getMessage() + "</div>");
                    }
                %>
            </tbody>
        </table>
        
        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</body>
</html>