package controller;

import dao.WarehouseDAO;
import model.Warehouse;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/warehouse")
public class WarehouseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String location = request.getParameter("location");

            Warehouse w = new Warehouse();
            w.setName(name);
            w.setLocation(location);

            WarehouseDAO dao = new WarehouseDAO();
            dao.insert(w);

            response.sendRedirect("viewWarehouses.jsp");
        }
    }
}
