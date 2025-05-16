<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    int id = Integer.parseInt(request.getParameter("id"));
    String name = "", contact = "", phone = "", email = "", address = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/warehouse_db", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM suppliers WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            contact = rs.getString("contact_person");
            phone = rs.getString("phone");
            email = rs.getString("email");
            address = rs.getString("address");
        }
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Supplier</title>
</head>
<body>

<h2>Edit Supplier</h2>
<form method="post" action="SupplierServlet">
    <input type="hidden" name="action" value="update" />
    <input type="hidden" name="id" value="<%= id %>" />
    Name: <input type="text" name="name" value="<%= name %>" required><br><br>
    Contact Person: <input type="text" name="contact_person" value="<%= contact %>" required><br><br>
    Phone: <input type="text" name="phone" value="<%= phone %>" required><br><br>
    Email: <input type="email" name="email" value="<%= email %>" required><br><br>
    Address: <textarea name="address" required><%= address %></textarea><br><br>
    <input type="submit" value="Update Supplier">
</form>

<br>
<a href="manageSuppliers.jsp">Back to Supplier List</a>

</body>
</html>