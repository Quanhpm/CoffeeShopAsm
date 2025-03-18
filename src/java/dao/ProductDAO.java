package dao;

import dto.ProductDTO;
import dto.DescriptionDTO;
import utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ProductDAO {

    // Select all products
    public List<ProductDTO> select() throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = DBUtils.getConnection();
        Statement stm = con.createStatement();

        String query = "SELECT p.productId, p.productName, p.productPrice, p.productImage, "
                + "p.categoryId, p.toppingId, d.title, d.text "
                + "FROM Product p "
                + "LEFT JOIN Description d ON p.productId = d.productId";

        ResultSet rs = stm.executeQuery(query);

        while (rs.next()) {
            ProductDTO product = new ProductDTO();
            product.setId(rs.getInt("productId"));
            product.setName(rs.getString("productName"));
            product.setPrice(rs.getFloat("productPrice"));
            product.setImage(rs.getString("productImage"));
            product.setCategoryId(rs.getInt("categoryId"));
            product.setToppingId(rs.getInt("toppingId"));

            String title = rs.getString("title");
            String text = rs.getString("text");

            if (title != null && text != null) {
                DescriptionDTO description = new DescriptionDTO(title, text);
                product.setDescription(description);
            } else {
                product.setDescription(null);
            }

            list.add(product);
        }

        con.close();
        return list;
    }

    // Create a new product
    public void create(ProductDTO product) throws SQLException, ClassNotFoundException {
        Connection con = DBUtils.getConnection();
        String query = "INSERT INTO Product (productName, productPrice, productImage, categoryId, toppingId) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stm = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

        stm.setString(1, product.getName());
        stm.setFloat(2, product.getPrice());
        stm.setString(3, product.getImage());
        stm.setInt(4, product.getCategoryId());
        stm.setInt(5, product.getToppingId());

        int affectedRows = stm.executeUpdate();

        if (affectedRows > 0) {
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                int productId = rs.getInt(1);
                // If description exists, insert it as well
                if (product.getDescription() != null) {
                    DescriptionDTO description = product.getDescription();
                    String descQuery = "INSERT INTO Description (productId, title, text) VALUES (?, ?, ?)";
                    PreparedStatement descStm = con.prepareStatement(descQuery);
                    descStm.setInt(1, productId);
                    descStm.setString(2, description.getTitle());
                    descStm.setString(3, description.getText());
                    descStm.executeUpdate();
                }
            }
        }

        con.close();
    }

    // Delete a product
    public void delete(int productId) throws SQLException, ClassNotFoundException {
        Connection con = DBUtils.getConnection();

        // Delete related descriptions first
        PreparedStatement stm = con.prepareStatement("DELETE FROM Description WHERE productId = ?");
        stm.setInt(1, productId);
        stm.executeUpdate();

        // Delete the product
        String query = "DELETE FROM Product WHERE productId = ?";
        PreparedStatement deleteStm = con.prepareStatement(query);
        deleteStm.setInt(1, productId);
        deleteStm.executeUpdate();

        con.close();
    }

    // Read a product by its ID
    public ProductDTO read(int productId) throws SQLException, ClassNotFoundException {
        ProductDTO product = null;
        Connection con = DBUtils.getConnection();

        String query = "SELECT p.productId, p.productName, p.productPrice, p.productImage, "
                + "p.categoryId, p.toppingId, d.title, d.text "
                + "FROM Product p "
                + "LEFT JOIN Description d ON p.productId = d.productId "
                + "WHERE p.productId = ?";

        PreparedStatement stm = con.prepareStatement(query);
        stm.setInt(1, productId);

        ResultSet rs = stm.executeQuery();

        if (rs.next()) {
            product = new ProductDTO();
            product.setId(rs.getInt("productId"));
            product.setName(rs.getString("productName"));
            product.setPrice(rs.getFloat("productPrice"));
            product.setImage(rs.getString("productImage"));
            product.setCategoryId(rs.getInt("categoryId"));
            product.setToppingId(rs.getInt("toppingId"));

            String title = rs.getString("title");
            String text = rs.getString("text");
            if (title != null && text != null) {
                DescriptionDTO description = new DescriptionDTO(title, text);
                product.setDescription(description);
            } else {
                product.setDescription(null);
            }
        }

        con.close();
        return product;
    }

    // Update a product
    public void update(ProductDTO product) throws SQLException, ClassNotFoundException {
        Connection con = DBUtils.getConnection();

        String query = "UPDATE Product SET productName = ?, productPrice = ?, productImage = ?, categoryId = ?, toppingId = ? WHERE productId = ?";
        PreparedStatement stm = con.prepareStatement(query);

        stm.setString(1, product.getName());
        stm.setFloat(2, product.getPrice());
        stm.setString(3, product.getImage());
        stm.setInt(4, product.getCategoryId());
        stm.setInt(5, product.getToppingId());
        stm.setInt(6, product.getId());

        int affectedRows = stm.executeUpdate();

        if (affectedRows > 0 && product.getDescription() != null) {
            // Update description if it exists
            DescriptionDTO description = product.getDescription();
            String descQuery = "UPDATE Description SET title = ?, text = ? WHERE productId = ?";
            PreparedStatement descStm = con.prepareStatement(descQuery);
            descStm.setString(1, description.getTitle());
            descStm.setString(2, description.getText());
            descStm.setInt(3, product.getId());
            descStm.executeUpdate();
        }

        con.close();
    }

    public ProductDTO getProductById(int productId) throws SQLException, ClassNotFoundException {
        return read(productId);
    }

    public List<ProductDTO> getProductsByCategoryId(int categoryId) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = DBUtils.getConnection();

        String query = "SELECT p.productId, p.productName, p.productPrice, p.productImage, "
                + "p.categoryId, p.toppingId, d.title, d.text "
                + "FROM Product p "
                + "LEFT JOIN Description d ON p.productId = d.productId "
                + "WHERE p.categoryId = ?";

        PreparedStatement stm = con.prepareStatement(query);
        stm.setInt(1, categoryId);

        ResultSet rs = stm.executeQuery();

        while (rs.next()) {
            ProductDTO product = new ProductDTO();
            product.setId(rs.getInt("productId"));
            product.setName(rs.getString("productName"));
            product.setPrice(rs.getFloat("productPrice"));
            product.setImage(rs.getString("productImage"));
            product.setCategoryId(rs.getInt("categoryId"));
            product.setToppingId(rs.getInt("toppingId"));

            String title = rs.getString("title");
            String text = rs.getString("text");

            if (title != null && text != null) {
                DescriptionDTO description = new DescriptionDTO(title, text);
                product.setDescription(description);
            } else {
                product.setDescription(null);
            }

            list.add(product);
        }

        con.close();
        return list;
    }

    public List<ProductDTO> searchProducts(String keyword) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = DBUtils.getConnection();

        String query = "SELECT p.productId, p.productName, p.productPrice, p.productImage, "
                + "p.categoryId, p.toppingId, d.title, d.text "
                + "FROM Product p "
                + "LEFT JOIN Description d ON p.productId = d.productId "
                + "WHERE p.productName LIKE ?";

        PreparedStatement stm = con.prepareStatement(query);
        stm.setString(1, "%" + keyword + "%"); // Tìm kiếm với từ khóa

        ResultSet rs = stm.executeQuery();

        while (rs.next()) {
            ProductDTO product = new ProductDTO();
            product.setId(rs.getInt("productId"));
            product.setName(rs.getString("productName"));
            product.setPrice(rs.getFloat("productPrice"));
            product.setImage(rs.getString("productImage"));
            product.setCategoryId(rs.getInt("categoryId"));
            product.setToppingId(rs.getInt("toppingId"));

            String title = rs.getString("title");
            String text = rs.getString("text");

            if (title != null && text != null) {
                DescriptionDTO description = new DescriptionDTO(title, text);
                product.setDescription(description);
            } else {
                product.setDescription(null);
            }

            list.add(product);
        }

        con.close();
        return list;
    }

    public List<ProductDTO> sortProductListByPrice(List<ProductDTO> productList, boolean ascending) {
        if (productList != null && !productList.isEmpty()) {
            productList.sort(Comparator.comparingDouble(ProductDTO::getPrice));
            if (!ascending) {
                Collections.reverse(productList); // Đảo ngược nếu sắp xếp giảm dần
            }
        }
        return productList;
    }

}
