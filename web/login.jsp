<%@ page language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%
    // Check for existing remember me cookie
    String rememberedUsername = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("rememberedUser".equals(cookie.getName())) {
                rememberedUsername = cookie.getValue();
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Warehouse System</title>
    <style>
        /* ==== Global Styles ==== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        
        /* ==== Login Container ==== */
        .login-container {
            width: 100%;
            max-width: 450px;
            padding: 40px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        /* ==== Header Styles ==== */
        .login-header {
            margin-bottom: 30px;
        }
        
        .login-header h2 {
            color: #2c3e50;
            margin: 0 0 10px 0;
            font-size: 28px;
        }
        
        .logo {
            width: 100px;
            height: 100px;
            margin-bottom: 15px;
            object-fit: contain;
        }
        
        /* ==== Form Styles ==== */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 40px 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s;
        }
        
        .form-group input:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        .form-group i {
            position: absolute;
            right: 15px;
            top: 40px;
            color: #7f8c8d;
        }
        
        /* ==== Remember Me Section ==== */
        .remember-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        /* ==== Button Styles ==== */
        .btn-login {
            width: 100%;
            padding: 14px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .btn-login:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* ==== Error Message ==== */
        .error-message {
            color: #e74c3c;
            background-color: #fdecea;
            padding: 12px;
            border-radius: 5px;
            margin: 20px 0;
            display: <%= request.getAttribute("error") != null ? "block" : "none" %>;
        }
        
        /* ==== Admin Contact Modal ==== */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 25px;
            border-radius: 8px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .close:hover {
            color: #333;
        }
        
        /* ==== Footer Links ==== */
        .login-footer {
            margin-top: 25px;
            font-size: 14px;
        }
        
        .login-footer a {
            color: #3498db;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .login-footer a:hover {
            color: #2980b9;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <!-- Add your logo here -->
            <i class="fas fa-warehouse"></i>
            <h2>Warehouse Management System</h2>
            <p>Please sign in to continue</p>
        </div>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Enter your username" value="<%= rememberedUsername %>">
                <i class="fas fa-user"></i>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required 
                       placeholder="Enter your password">
                <i class="fas fa-lock"></i>
            </div>
            
            <div class="remember-section">
                <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember" <%= rememberedUsername.isEmpty() ? "" : "checked" %>>
                    <label for="remember">Remember me</label>
                </div>
                <a href="#" id="forgot-password">Forgot password?</a>
            </div>
            
            <button type="submit" class="btn-login">Login</button>
        </form>
        
        <div class="login-footer">
            <p>Don't have an account? <a href="#" id="contact-admin">Contact Admin</a></p>
        </div>
    </div>
    
    <!-- Admin Contact Modal -->
    <div id="adminModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Contact System Administrator</h3>
            <p>Please contact your system administrator for account creation or assistance:</p>
            <ul style="list-style-type: none; padding: 0; margin-top: 20px;">
                <li><i class="fas fa-user-tie"></i> <strong>Admin Name:</strong> John Doe</li>
                <li><i class="fas fa-envelope"></i> <strong>Email:</strong> admin@warehouse.com</li>
                <li><i class="fas fa-phone"></i> <strong>Phone:</strong> +1 (555) 123-4567</li>
                <li><i class="fas fa-building"></i> <strong>Office:</strong> Building A, Room 205</li>
            </ul>
            <p style="margin-top: 20px;">For urgent matters, please visit the IT help desk.</p>
        </div>
    </div>
    
    <!-- Simple JavaScript for modal (will work without it too) -->
    <script>
        // Get the modal
        var modal = document.getElementById("adminModal");
        
        // Get the button that opens the modal
        var btn = document.getElementById("contact-admin");
        
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        
        // When the user clicks the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }
        
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
        
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</body>
</html>