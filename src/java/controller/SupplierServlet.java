package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/SupplierServlet")
public class SupplierServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String contactPerson = request.getParameter("contact_person");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:4306/warehouse_db", "root", "");

                PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO suppliers (name, contact_person, phone, email, address) VALUES (?, ?, ?, ?, ?)");

                ps.setString(1, name);
                ps.setString(2, contactPerson);
                ps.setString(3, phone);
                ps.setString(4, email);
                ps.setString(5, address);

                ps.executeUpdate();
                conn.close();

                request.setAttribute("message", "Supplier added successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error: " + e.getMessage());
            }

            RequestDispatcher rd = request.getRequestDispatcher("manageSuppliers.jsp");
            rd.forward(request, response);
        } 
        
        else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String contactPerson = request.getParameter("contact_person");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/warehouse_db", "root", "");

                PreparedStatement ps = conn.prepareStatement(
                    "UPDATE suppliers SET name=?, contact_person=?, phone=?, email=?, address=? WHERE id=?");

                ps.setString(1, name);
                ps.setString(2, contactPerson);
                ps.setString(3, phone);
                ps.setString(4, email);
                ps.setString(5, address);
                ps.setInt(6, id);

                ps.executeUpdate();
                conn.close();

                request.setAttribute("message", "Supplier updated successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error: " + e.getMessage());
            }

            RequestDispatcher rd = request.getRequestDispatcher("manageSuppliers.jsp");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:4306/warehouse_db", "root", "");

                PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM suppliers WHERE id=?");
                ps.setInt(1, id);

                ps.executeUpdate();
                conn.close();

                request.setAttribute("message", "Supplier deleted successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error: " + e.getMessage());
            }

            RequestDispatcher rd = request.getRequestDispatcher("manageSuppliers.jsp");
            rd.forward(request, response);
        }
    }
}