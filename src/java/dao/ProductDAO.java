/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductDTO;
import dto.DescriptionDTO;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    public List<ProductDTO> select() throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();

        // Tạo kết nối DB
        Connection con = DBUtils.getConnection();
        Statement stm = con.createStatement();

        // Truy vấn dữ liệu từ bảng Product và Description
        String query = "SELECT p.productId, p.productName, p.productPrice, p.productImage, " +
                       "p.categoryId, p.toppingId, d.title, d.text " +
                       "FROM Product p " +
                       "LEFT JOIN Description d ON p.productId = d.productId";

        ResultSet rs = stm.executeQuery(query);

        while (rs.next()) {
            // Đọc dữ liệu của sản phẩm
            ProductDTO product = new ProductDTO();
            product.setId(rs.getInt("productId"));
            product.setName(rs.getString("productName"));
            product.setPrice(rs.getFloat("productPrice"));
            product.setCategoryId(rs.getInt("categoryId"));
            product.setToppingId(rs.getInt("toppingId"));

            // Đọc dữ liệu của Description (nếu có)
            String title = rs.getString("title");
            String text = rs.getString("text");

            if (title != null && text != null) {
                DescriptionDTO description = new DescriptionDTO(title, text);
                product.setDescription(description);
            } else {
                product.setDescription(null); // Không có mô tả
            }

            // Thêm sản phẩm vào danh sách
            list.add(product);
        }

        // Đóng kết nối
        con.close();
        return list;
    }
}
