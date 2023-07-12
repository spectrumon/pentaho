package net.roseindia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;












import net.roseindia.bean.UserBean;
import net.roseindia.dbconnection.ConnectionProvider;

public class UserDao {

    private Connection conn;

    public UserDao() {
    	conn = ConnectionProvider.getConnection();
    }

    public void addUser(UserBean userBean) {
        try {
        	String sql = "INSERT INTO users(userid, firstname,lastname,Present,Credit)" +
    		" VALUES (?, ?, ?,?,? )";
            PreparedStatement ps = conn.prepareStatement(sql);
            
      
            ps.setInt(1, userBean.getId());
            ps.setString(2, userBean.getfName());
            ps.setString(3, userBean.getlName()); 
            ps.setString(4, userBean.getPresent());
            ps.setString(5, userBean.getCredit());
         
           
            
            
            
            
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    public void AddRecord(UserBean userBean) {
        try {
        	String sql = "INSERT INTO Records(userid, firstname,lastname,Present,Credit,Creadit_type)" +
    		" VALUES (?, ?, ?,?,?,? )";
            PreparedStatement ps = conn.prepareStatement(sql);
            
      
            ps.setInt(1, userBean.getId());
            ps.setString(2, userBean.getfName());
            ps.setString(3, userBean.getlName()); 
            ps.setString(4, userBean.getPresent());
            ps.setString(5, userBean.getCredit());
            ps.setString(6, userBean.getCreadit_type());
            
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

    public void removeUser(int userId) {
        try {
        	String sql = "DELETE FROM users WHERE userid=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
      }

    
    public void removeCredit(int userId) {
        try {
        	String sql = "DELETE FROM Records WHERE userid=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
      }

    
    
    
    
    
    
    
    public void editUser(UserBean userBean) {    	
    	try {
    		String sql = "UPDATE users SET firstname=? , lastname=?, Present=?, Credit=?" +
            " WHERE userid=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setString(1, userBean.getfName());
            ps.setString(2, userBean.getlName()); 
            ps.setString(3, userBean.getPresent());
            ps.setString(4, userBean.getCredit());
            ps.setInt(5, userBean.getId());
           
            
            
            ps.executeUpdate();            

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    
    public List getAllUsers() {
        List users = new ArrayList();
        try {
        	String sql = "SELECT * FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserBean userBean = new UserBean();
                userBean.setId(rs.getInt("userid"));
                userBean.setfName(rs.getString("firstname"));
                userBean.setlName(rs.getString("lastname"));    
                userBean.setPresent(rs.getString("Present")); 
                userBean.setcreation_time(rs.getString("creation_time")); 
                userBean.setCredit(rs.getString("Credit"));
                
                
                
                users.add(userBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    
    //Abhi
    
    public List getAtten() {
        List users = new ArrayList();
        try {
        	String sql = "SELECT * FROM Records";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserBean userBean = new UserBean();
                userBean.setId(rs.getInt("userid"));
                userBean.setfName(rs.getString("firstname"));
                userBean.setlName(rs.getString("lastname"));    
                userBean.setPresent(rs.getString("Present")); 
                userBean.setcreation_time(rs.getString("creation_time")); 
                userBean.setCredit(rs.getString("Credit"));
                userBean.setCreadit_type(rs.getString("Creadit_type"));
                
                
                
                users.add(userBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    
    //EndAbhi 
    
    
    
    
    
    
    
    
   //Abhi Agree
    
    public List getSum() {
        List users = new ArrayList();
        try {
        	String sql = "select userid,Creadit_type,firstname,lastname,sum(present) as present,sum(Credit) as Credit,creation_time from Records Group by userid";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserBean userBean = new UserBean();
                userBean.setId(rs.getInt("userid"));
                userBean.setfName(rs.getString("firstname"));
                userBean.setlName(rs.getString("lastname"));    
                userBean.setPresent(rs.getString("Present")); 
                userBean.setcreation_time(rs.getString("creation_time")); 
                userBean.setCredit(rs.getString("Credit"));
                userBean.setCreadit_type(rs.getString("Creadit_type"));
                
                
                
                
                users.add(userBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    
    
    
    //test login
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //--------------------------------------------------------------
    
    //public static String loginCheck(UserBean UserBean){
   
        public static String loginCheck(UserBean UserBean){
        
            String query="select * from login where email=? and password=? and role=?";
            
           
            
            try{
        
            	 Connection con= ConnectionProvider.getConnection();
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1,UserBean.getEmail());
                ps.setString(2,UserBean.getPassword());
                ps.setString(3,UserBean.getrole());
              
                
                ResultSet rs=ps.executeQuery();
      
                if(rs.next()){
                	
                    //rs.getString(rs.getString("role"));

                    return "true";
            
                }
                else{
                    return "false";
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            
            return "error";
        }
    
    
    
    //-------------------------------------------------------
    
    
    
    
    //test...end
    
    
    
    public UserBean getUserById(int userId) {
    	UserBean userBean = new UserBean();
        try {
        	String sql = "SELECT * FROM users WHERE userid=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	userBean.setId(rs.getInt("userid"));
            	userBean.setfName(rs.getString("firstname"));
            	userBean.setlName(rs.getString("lastname"));     
              	userBean.setPresent(rs.getString("Present")); 
              	userBean.setcreation_time(rs.getString("creation_time")); 
              	userBean.setCredit(rs.getString("Credit")); 
              	
              	
              	
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userBean;
    }
    
    
    
    
    public UserBean getAttenById(int userId) {
    	UserBean userBean = new UserBean();
        try {
        	String sql = "SELECT * FROM records WHERE userid=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	userBean.setId(rs.getInt("userid"));
            	userBean.setfName(rs.getString("firstname"));
            	userBean.setlName(rs.getString("lastname"));     
              	userBean.setPresent(rs.getString("Present")); 
              	userBean.setcreation_time(rs.getString("creation_time")); 
              	userBean.setCredit(rs.getString("Credit")); 
              	
              	
              	
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userBean;
    }
    
    
    
    
    
    
    
    
    
}