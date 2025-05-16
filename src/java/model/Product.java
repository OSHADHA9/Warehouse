package model;

public class Product {
    private int id;
    private String name;
    private String description;
    private int quantity;
    private double price;
    private int warehouseId;

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getWarehouseId() {
    return warehouseId;
}
    
    public void setWarehouseId(int warehouseId) {
    this.warehouseId = warehouseId;
}
}   