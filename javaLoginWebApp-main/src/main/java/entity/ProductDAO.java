package entity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection connection;

    // Constructor receives a DB connection
    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    // CREATE
    public void addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO products (product_id, product_name, product_description, product_color, product_size, product_price) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, product.getProduct_id());
            stmt.setString(2, product.getProduct_name());
            stmt.setString(3, product.getProduct_description());
            stmt.setString(4, product.getProduct_color());
            stmt.setInt(5, product.getProduct_size());
            stmt.setDouble(6, product.getProduct_price());
            stmt.executeUpdate();
        }
    }

    // READ (single product by ID)
    public Product getProductById(int id) throws SQLException {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getString("product_color"),
                        rs.getInt("product_size"),
                        rs.getDouble("product_price")
                );
            }
        }
        return null;
    }

    // READ (all products)
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_description"),
                        rs.getString("product_color"),
                        rs.getInt("product_size"),
                        rs.getDouble("product_price")
                ));
            }
        }
        return products;
    }

    // UPDATE
    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE products SET product_name=?, product_description=?, product_color=?, product_size=?, product_price=? WHERE product_id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, product.getProduct_name());
            stmt.setString(2, product.getProduct_description());
            stmt.setString(3, product.getProduct_color());
            stmt.setInt(4, product.getProduct_size());
            stmt.setDouble(5, product.getProduct_price());
            stmt.setInt(6, product.getProduct_id());
            stmt.executeUpdate();
        }
    }

    // DELETE
    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM products WHERE product_id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}

