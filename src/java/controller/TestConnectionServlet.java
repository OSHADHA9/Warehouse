package controller;

import util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/test-conn")
public class TestConnectionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                out.println("✅ Database Connected Successfully!");
            } else {
                out.println("❌ Connection Failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
