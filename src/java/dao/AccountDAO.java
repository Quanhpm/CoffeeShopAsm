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
    public List<AccountDTO> select() throws SQLException, ClassNotFoundException {
        List<AccountDTO> list = null;
        Connection con = DBUtils.getConnection();
        Statement stm = con.createStatement();

        ResultSet rs = stm.executeQuery("SELECT * FROM Account");  
        list = new ArrayList<>();
        while (rs.next()) {
            AccountDTO account = new AccountDTO();
            account.setAccountId(rs.getInt("accountId"));
            account.setUserName(rs.getString("userName"));
            account.setPassword(rs.getString("password"));
            account.setEmail(rs.getString("email"));
            account.setRole(rs.getString("role"));
            list.add(account);
        }
        con.close();
        return list;
    }

    public void create(AccountDTO account) throws SQLException, ClassNotFoundException {
        Connection con = DBUtils.getConnection();
        PreparedStatement stm = con.prepareStatement("INSERT INTO Account (userName, password, email, role) VALUES (?, ?, ?, ?)");
        
        stm.setString(1, account.getUserName());
        stm.setString(2, account.getPassword());
        stm.setString(3, account.getEmail());
        stm.setString(4, account.getRole());
        
        int count = stm.executeUpdate();
        
        con.close();
    }

    public void delete(int id) throws SQLException, ClassNotFoundException {
        Connection con = DBUtils.getConnection();
        PreparedStatement stm = con.prepareStatement("DELETE FROM Account WHERE accountId = ?");
        
        stm.setInt(1, id);
        
        int count = stm.executeUpdate();
        
        con.close();
    }

    
    public AccountDTO read(int id) throws SQLException, ClassNotFoundException {
        AccountDTO account = null;
        
        Connection con = DBUtils.getConnection();
        
        PreparedStatement stm = con.prepareStatement("SELECT * FROM Account WHERE accountId = ?");
        
    
        stm.setInt(1, id);
        
        
        ResultSet rs = stm.executeQuery();
        
        if (rs.next()) {
            
            account = new AccountDTO();
            account.setAccountId(rs.getInt("accountId"));
            account.setUserName(rs.getString("userName"));
            account.setPassword(rs.getString("password"));
            account.setEmail(rs.getString("email"));
            account.setRole(rs.getString("role"));
        }
        
       
        con.close();
        
        return account;
    }
    
    
    
        public boolean isUsernameExist(String username) throws SQLException, ClassNotFoundException {
        
        Connection con = DBUtils.getConnection();
       
        PreparedStatement stm = con.prepareStatement("SELECT * FROM Account WHERE userName = ?");
        stm.setString(1, username);
        
        
        ResultSet rs = stm.executeQuery();
        
       
        boolean exists = rs.next();
        
        
        con.close();
        
        return exists;
    }
}
