<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Warehouse System</title>
    <style>
        /* ==== Global Styles ==== */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --success-color: #2ecc71;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: var(--secondary-color);
        }
        
        /* ==== Header Styles ==== */
        .dashboard-header {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            color: white;
            padding: 1.5rem 2rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            animation: slideDown 0.5s ease-out;
        }
        
        @keyframes slideDown {
            from { transform: translateY(-100%); }
            to { transform: translateY(0); }
        }
        
        .welcome-message {
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .logout-btn {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .logout-btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        
        /* ==== Main Content ==== */
        .dashboard-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
            animation: fadeIn 0.8s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        /* ==== Dashboard Cards ==== */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }
        
        .dashboard-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        
        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: var(--primary-color);
        }
        
        .card-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }
        
        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .card-description {
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        /* ==== Quick Actions ==== */
        .quick-actions {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }
        
        .section-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--secondary-color);
            position: relative;
            padding-bottom: 0.5rem;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary-color);
        }
        
        .action-list {
            list-style: none;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1rem;
        }
        
        .action-item {
            transition: all 0.3s ease;
        }
        
        .action-link {
            display: flex;
            align-items: center;
            padding: 1rem;
            background: var(--light-color);
            border-radius: 8px;
            text-decoration: none;
            color: var(--secondary-color);
            font-weight: 500;
            transition: all 0.3s ease;
            height: 100%; /* Ensure equal height */
            min-height: 60px; /* Minimum height for all buttons */
        }
        
        .action-link:hover {
            background: var(--primary-color);
            color: white;
            transform: translateX(5px);
        }
        
        .action-link i {
            margin-right: 0.8rem;
            font-size: 1.2rem;
            min-width: 24px; /* Fixed width for icons */
            text-align: center;
        }
        
        /* ==== Responsive Design ==== */
        @media (max-width: 768px) {
            .dashboard-header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }
            
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
            
            .action-list {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <header class="dashboard-header">
        <div class="welcome-message">Welcome, <%= username %>!</div>
        <a href="logout.jsp" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </header>
    
    <main class="dashboard-container">
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-box-open"></i>
                </div>
                <h3 class="card-title">Total Products</h3>
                <p class="card-description">View and manage all products in inventory</p>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-warehouse"></i>
                </div>
                <h3 class="card-title">Warehouses</h3>
                <p class="card-description">Manage your storage locations</p>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3 class="card-title">Analytics</h3>
                <p class="card-description">View system statistics and reports</p>
            </div>
            
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-bell"></i>
                </div>
                <h3 class="card-title">Alerts</h3>
                <p class="card-description">Low stock and other notifications</p>
            </div>
        </div>
        
        <section class="quick-actions">
            <h2 class="section-title">Quick Actions</h2>
            <ul class="action-list">
                <li class="action-item">
                    <a href="addProduct.jsp" class="action-link">
                        <i class="fas fa-plus-circle"></i> Add Product
                    </a>
                </li>
                <li class="action-item">
                    <a href="viewProducts.jsp" class="action-link">
                        <i class="fas fa-list-ul"></i> View Products
                    </a>
                </li>
                <li class="action-item">
                    <a href="addWarehouse.jsp" class="action-link">
                        <i class="fas fa-warehouse"></i> Add Warehouse
                    </a>
                </li>
                <li class="action-item">
                    <a href="viewWarehouses.jsp" class="action-link">
                        <i class="fas fa-map-marked-alt"></i> View Warehouses
                    </a>
                </li>
                <li class="action-item">
                    <a href="manageSuppliers.jsp" class="action-link">
                        <i class="fas fa-truck-loading"></i> Supplier Chain
                    </a>
                </li>
            </ul>
        </section>
    </main>
</body>
</html>