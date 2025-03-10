package dao;

import dto.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class AccountDAO {
    // Phương thức lấy danh sách tài khoản
    public List<AccountDTO> select() throws SQLException, ClassNotFoundException {
        List<AccountDTO> list = null;
        // Tạo kết nối DB
        Connection con = DBUtils.getConnection();
        // Tạo đối tượng stm và thực hiện lệnh select
        Statement stm = con.createStatement();

        ResultSet rs = stm.executeQuery("SELECT * FROM Account");  // Thay đổi bảng và cột phù hợp
        list = new ArrayList<>();
        while (rs.next()) {
            // Đọc dòng hiện hành vào đối tượng AccountDTO
            AccountDTO account = new AccountDTO();
            account.setAccountId(rs.getInt("accountId"));
            account.setUserName(rs.getString("userName"));
            account.setPassword(rs.getString("password"));
            account.setEmail(rs.getString("email"));
            account.setRole(rs.getString("role"));
            // Thêm account vào list
            list.add(account);
        }
        // Đóng kết nối DB
        con.close();
        return list;
    }

    // Phương thức tạo tài khoản mới
    public void create(AccountDTO account) throws SQLException, ClassNotFoundException {
        // Tạo kết nối DB
        Connection con = DBUtils.getConnection();
        // Tạo đối tượng stm và thực hiện lệnh insert
        PreparedStatement stm = con.prepareStatement("INSERT INTO Account (userName, password, email, role) VALUES (?, ?, ?, ?)");
        
        // Cung cấp giá trị cho các tham số
        stm.setString(1, account.getUserName());
        stm.setString(2, account.getPassword());
        stm.setString(3, account.getEmail());
        stm.setString(4, account.getRole());
        
        // Thực hiện lệnh sql
        int count = stm.executeUpdate();
        
        // Đóng kết nối DB
        con.close();
    }

    // Phương thức xóa tài khoản theo ID
    public void delete(int id) throws SQLException, ClassNotFoundException {
        // Tạo kết nối DB
        Connection con = DBUtils.getConnection();
        // Tạo đối tượng stm và thực hiện lệnh delete
        PreparedStatement stm = con.prepareStatement("DELETE FROM Account WHERE accountId = ?");
        
        // Cung cấp giá trị cho các tham số
        stm.setInt(1, id);
        
        // Thực hiện lệnh sql
        int count = stm.executeUpdate();
        
        // Đóng kết nối DB
        con.close();
    }

    // Phương thức đọc tài khoản theo ID
    public AccountDTO read(int id) throws SQLException, ClassNotFoundException {
        AccountDTO account = null;
        // Tạo kết nối DB
        Connection con = DBUtils.getConnection();
        // Tạo đối tượng stm và thực hiện lệnh select
        PreparedStatement stm = con.prepareStatement("SELECT * FROM Account WHERE accountId = ?");
        
        // Cung cấp giá trị cho các tham số
        stm.setInt(1, id);
        
        // Thực hiện lệnh sql
        ResultSet rs = stm.executeQuery();
        
        if (rs.next()) {
            // Đọc dòng hiện hành vào đối tượng AccountDTO
            account = new AccountDTO();
            account.setAccountId(rs.getInt("accountId"));
            account.setUserName(rs.getString("userName"));
            account.setPassword(rs.getString("password"));
            account.setEmail(rs.getString("email"));
            account.setRole(rs.getString("role"));
        }
        
        // Đóng kết nối DB
        con.close();
        
        return account;
    }
}
