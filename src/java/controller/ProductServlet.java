package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ✅ Session and role check
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        ProductDAO dao = new ProductDAO();

        if ("add".equals(action)) {
            Product p = new Product();
            p.setName(request.getParameter("name"));
            p.setDescription(request.getParameter("description"));
            p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            p.setWarehouseId(Integer.parseInt(request.getParameter("warehouse_id")));
            dao.insert(p);
            response.sendRedirect("viewProducts.jsp");
        } else if ("update".equals(action)) {
            Product p = new Product();
            p.setId(Integer.parseInt(request.getParameter("id")));
            p.setName(request.getParameter("name"));
            p.setDescription(request.getParameter("description"));
            p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            p.setWarehouseId(Integer.parseInt(request.getParameter("warehouse_id")));
            dao.update(p);
            response.sendRedirect("viewProducts.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ✅ Session and role check
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        ProductDAO dao = new ProductDAO();

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            response.sendRedirect("viewProducts.jsp");
        }
    }
}