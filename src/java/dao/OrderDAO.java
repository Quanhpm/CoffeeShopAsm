/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDTO;
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
public class OrderDAO {
    public List<OrderDTO> select() throws SQLException, ClassNotFoundException {
        String name = "";
        List<OrderDTO> list = null;
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        Statement stm = con.createStatement();
        //Thực thi lệnh select
        ResultSet rs = stm.executeQuery("select * from [dbo].[Order]");
        list = new ArrayList<>();
        while (rs.next()) {
            //Đọc từng dòng trong table Toy để vào đối tượng toy
            OrderDTO order = new OrderDTO();
            order.setOrderId(rs.getInt("orderId"));
            order.setTotalPrice(rs.getFloat("totalPrice"));
            order.setStatus(rs.getString("status"));
            order.setCreatedAt(rs.getDate("createdAt"));
            order.setAccountId(rs.getInt("accountId"));
            //Thêm toy vào list
            list.add(order);
        }
        //Đóng kết nối db
        con.close();
        return list;
    }

    public void create(OrderDTO order) throws SQLException, ClassNotFoundException {
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        PreparedStatement stm = con.prepareStatement("insert Order values(?,?,?,?)");
        //Gán giá trị cho các tham số
        stm.setFloat(1, order.getTotalPrice());
        stm.setString(2, order.getStatus());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        stm.setString(3, sdf.format(order.getCreatedAt()));
        stm.setInt(4, order.getAccountId());
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối db
        con.close();
    }

    public void delete(int id) throws SQLException, ClassNotFoundException {
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        PreparedStatement stm = con.prepareStatement("delete Order where orderId=?");
        //Gán giá trị cho các tham số
        stm.setInt(1, id);

        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối db
        con.close();
    }

    public OrderDTO read(String id) throws SQLException, ClassNotFoundException {
        OrderDTO product = null;
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        PreparedStatement stm = con.prepareStatement("Select * from Order where id=?");
        //Gán giá trị cho các tham số
        stm.setString(1, id);

        //Thực thi lệnh sql
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            //Đọc data trong table Toy để vào đối tượng toy
          OrderDTO order = new OrderDTO();
            order.setOrderId(rs.getInt("orderId"));
            order.setTotalPrice(rs.getFloat("totalPrice"));
            order.setStatus(rs.getNString("status"));
            order.setCreatedAt(rs.getDate("createdAt"));
            order.setAccountId(rs.getInt("accountId"));

        }
        //Đóng kết nối db
        con.close();
        return product;
    }

    public void update(OrderDTO order) throws SQLException, ClassNotFoundException {
        //Tạo kết nối db
        Connection con = DBUtils.getConnection();
        //Tạo đối tượng Statement
        PreparedStatement stm = con.prepareStatement("update Order set totalprice=?, status=?, createdAt=?, accountId=? where orderId=?");
        //Gán giá trị cho các tham số
         stm.setFloat(1, order.getTotalPrice());
        stm.setString(2, order.getStatus());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        stm.setString(3, sdf.format(order.getCreatedAt()));
        stm.setInt(4, order.getAccountId());
        //Thực thi lệnh sql
        int count = stm.executeUpdate();
        //Đóng kết nối db
        con.close();
    }
}
