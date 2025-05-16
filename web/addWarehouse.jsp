<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Warehouse | Warehouse System</title>
    <style>
        /* ==== Global Styles ==== */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: var(--dark);
        }
        
        /* ==== Header Animation ==== */
        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        
        /* ==== Form Container ==== */
        .form-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            width: 100%;
            max-width: 500px;
            margin: 2rem;
            animation: fadeIn 0.8s ease-out;
            border-top: 5px solid var(- -accent);
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }
        
        .form-header h2 {
            color: var(--secondary);
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .form-header i {
            font-size: 2.5rem;
            color: var(--accent);
            margin-bottom: 1rem;
            display: inline-block;
            animation: floating 3s ease-in-out infinite;
        }
        
        /* ==== Form Styles ==== */
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--secondary);
        }
        
        .form-group input {
            width: 95%;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        /* ==== Button Styles ==== */
        .btn {
            display: inline-block;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .btn-primary {
            background-color: var(--primary);
            color: white;
            width: 95%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        .btn-secondary {
            background-color: white;
            color: var(--primary);
            border: 2px solid var(-primary);
            margin-top: 1rem;
            width: 90%;
            display: block ;
        }
        
        .btn-secondary:hover {
            background-color: var(--light);
        }
        
        /* ==== Decorative Elements ==== */
        .decoration {
            position: absolute;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(67, 97, 238, 0.1);
            z-index: -1;
        }
        
        .decoration-1 {
            top: -20px;
            left: -20px;
        }
        
        .decoration-2 {
            bottom: -30px;
            right: -10px;
            width: 150px;
            height: 150px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="decoration decoration-1"></div>
    <div class="decoration decoration-2"></div>
    
    <div class="form-container">
        <div class="form-header">
            <i class="fas fa-warehouse"></i>
            <h2>Add New Warehouse</h2>
            <p>Fill in the details to register a new warehouse</p>
        </div>
        
        <form action="warehouse" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" required placeholder="Enter warehouse location (e.g., City, Address)">
            </div>
            
            <div class="form-group">
                <label for="capacity">Capacity</label>
                <input type="number" id="capacity" name="capacity" required placeholder="Enter total capacity">
            </div>
            
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-plus-circle"></i> Add Warehouse
            </button>
            
            <a href="dashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </form>
    </div>
</body>
</html>