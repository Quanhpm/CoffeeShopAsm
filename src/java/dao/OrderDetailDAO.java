/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.DescriptionDTO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Asus
 */
public class OrderDetailDAO {

    public List<OrderDetailDTO> select() throws SQLException, ClassNotFoundException {
        String name = "";
        List<OrderDetailDTO> list = null;
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        Statement stm = con.createStatement();
        //Thực thi lệnh select
        ResultSet rs = stm.executeQuery("select * from [dbo].[OrderDetail]");
        list = new ArrayList<>();
        while (rs.next()) {
            //Đọc từng dòng trong table Toy để vào đối tượng toy
            OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
            orderDetailDTO.setOrderDetailId(rs.getInt("orderDetailId"));
            orderDetailDTO.setOrderId(rs.getInt("orderId"));
            orderDetailDTO.setProductId(rs.getInt("productId"));
            orderDetailDTO.setQuantity(rs.getInt("quantity"));

            //Thêm toy vào list
            list.add(orderDetailDTO);
        }
        //Đóng kết nối db
        con.close();
        return list;
    }

    public int create(OrderDetailDTO orderDetailDTO) throws SQLException, ClassNotFoundException {
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        PreparedStatement stm = con.prepareStatement("insert INTO [dbo].[OrderDetail] (orderId, productId, quantity) values(?,?,?)");
        //Gán giá trị cho các tham số
        
        stm.setInt(1, orderDetailDTO.getOrderId());
        stm.setInt(2, orderDetailDTO.getProductId());
        stm.setInt(3, orderDetailDTO.getQuantity());
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        ResultSet rs = null;
     
        //Đóng kết nối db
        con.close();
        return 0;
    }

}
