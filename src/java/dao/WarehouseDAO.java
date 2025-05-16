package dao;

import model.Warehouse;
import util.DBConnection;
import java.sql.*;
import java.util.*;

public class WarehouseDAO {
    public void insert(Warehouse w) {
        String sql = "INSERT INTO warehouses (name, location) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, w.getName());
            stmt.setString(2, w.getLocation());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Warehouse> getAll() {
        List<Warehouse> list = new ArrayList<>();
        String sql = "SELECT * FROM warehouses";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Warehouse w = new Warehouse();
                w.setId(rs.getInt("id"));
                w.setName(rs.getString("name"));
                w.setLocation(rs.getString("location"));
                list.add(w);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Warehouse getById(int id) {
        Warehouse w = null;
        String sql = "SELECT * FROM warehouses WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                w = new Warehouse();
                w.setId(rs.getInt("id"));
                w.setName(rs.getString("name"));
                w.setLocation(rs.getString("location"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return w;
    }
}


