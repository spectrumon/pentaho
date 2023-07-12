package net.roseindia.handler;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.roseindia.dao.UserDao;
import net.roseindia.bean.UserBean;

public class UserHandler extends HttpServlet {    
    private static String INSERT = "/user.jsp";
    private static String Edit = "/edit.jsp";
    private static String AddRecord = "/AddRecord.jsp";
    private static String AddCredit = "/AddCredit.jsp";
    private static String ViewAtten = "/ViewAttendance.jsp";
    private static String viewsumAll = "/ViewConsolidated.jsp";
    private static String UserRecord = "/listUser.jsp";
    
    private static String UserRecordCredit = "/listUserCredit.jsp";
    private static String UserRecordAtten = "/listUserAtten.jsp";
    
    private static String viewstotalAtten = "/totalAtten.jsp";
    private static String viewtotalCredit = "/totalCredit.jsp";
    
    
    private UserDao dao;

    public UserHandler() {
        super();
        dao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect="";
        String uId = request.getParameter("userid");        
        String action = request.getParameter("action");
        if(!((uId)== null) && action.equalsIgnoreCase("insert"))
        {
        	int id = Integer.parseInt(uId);
        	UserBean user = new UserBean();
        	user.setId(id);
            user.setfName(request.getParameter("firstName"));
            user.setlName(request.getParameter("lastName"));
            user.setPresent(request.getParameter("Present"));
            user.setCredit(request.getParameter("Credit"));
            
            
            
        	dao.addUser(user);
        	redirect = UserRecord;
            request.setAttribute("users", dao.getAllUsers());    
           	System.out.println("Record Added Successfully");
        }
        else if (action.equalsIgnoreCase("delete")){
            String userId = request.getParameter("userId");
            int uid = Integer.parseInt(userId);
            dao.removeUser(uid);
            redirect = UserRecord;
            request.setAttribute("users", dao.getAllUsers());
            System.out.println("Record Deleted Successfully");
        }
        
        
        
        
        else if (action.equalsIgnoreCase("deleteSum")){
            String userId = request.getParameter("userId");
            int uid = Integer.parseInt(userId);
            dao.removeCredit(uid);
            redirect = viewsumAll;
            request.setAttribute("users", dao.getAllUsers());
            System.out.println("Credit Deleted Successfully  ");
        }
        
        
        
        
        
        
        else if (action.equalsIgnoreCase("Insertcredit")){        	
        	redirect = AddCredit;       
        	
        }
        
     
       
    
        
        
        
        else if (action.equalsIgnoreCase("Insertcredit")){
        	String userId = request.getParameter("userId");
            int uid = Integer.parseInt(userId);            
            UserBean user = new UserBean();
        	user.setId(uid);
            user.setfName(request.getParameter("firstName"));
            user.setlName(request.getParameter("lastName"));
            user.setPresent(request.getParameter("Present"));
            user.setCredit(request.getParameter("Credit"));
            user.setCreadit_type(request.getParameter("Creadit_type"));
            
            
            dao.AddRecord(user);
            request.setAttribute("user", user);
            redirect = UserRecord;
            System.out.println("New Record Added Successfully");
             }
        
        
        else if (action.equalsIgnoreCase("InsertRec")){        	
        	redirect = AddRecord;       
        	
        } 
       
        
        
        
        
        else if (action.equalsIgnoreCase("AddRecord")){
        	String userId = request.getParameter("userId");
            int uid = Integer.parseInt(userId);            
            UserBean user = new UserBean();
        	user.setId(uid);
            user.setfName(request.getParameter("firstName"));
            user.setlName(request.getParameter("lastName"));
            user.setPresent(request.getParameter("Present"));
            user.setCredit(request.getParameter("Credit"));
            user.setCreadit_type(request.getParameter("Creadit_type"));
            
            
            dao.AddRecord(user);
            request.setAttribute("user", user);
            redirect = UserRecord;
            System.out.println("New Record Added Successfully");
             }
        
  
        
        //
        
        
        else if (action.equalsIgnoreCase("editform")){        	
        	redirect = Edit;       
        	
        } 
        
        
        
        else if (action.equalsIgnoreCase("edit")){
        	String userId = request.getParameter("userId");
            int uid = Integer.parseInt(userId);            
            UserBean user = new UserBean();
        	user.setId(uid);
            user.setfName(request.getParameter("firstName"));
            user.setlName(request.getParameter("lastName"));
            user.setPresent(request.getParameter("Present"));
            user.setCredit(request.getParameter("Credit"));
            dao.editUser(user);
            request.setAttribute("user", user);
            redirect = UserRecord;
            System.out.println("Record updated Successfully");
             }
        
     
        
        else if (action.equalsIgnoreCase("ViewAttendata")){
            redirect = ViewAtten;
            request.setAttribute("users", dao.getAtten());
         }
        
        
        else if (action.equalsIgnoreCase("ViewSumAllRec")){
            redirect = viewsumAll;
            request.setAttribute("users", dao.getSum());
         }
        
       
        
        else if (action.equalsIgnoreCase("listUser")){
            redirect = UserRecord;
            request.setAttribute("users", dao.getAllUsers());
         } 
        
        else if (action.equalsIgnoreCase("listUserCredit")){
            redirect = UserRecordCredit;
            request.setAttribute("users", dao.getAllUsers());
         } 
        
        else if (action.equalsIgnoreCase("listUserAtten")){
            redirect = UserRecordAtten;
            request.setAttribute("users", dao.getAllUsers());
         } 
        
        
        
        else if (action.equalsIgnoreCase("totalAtten")){
            redirect = viewstotalAtten;
            request.setAttribute("users", dao.getSum());
         }
        
        else if (action.equalsIgnoreCase("totalCredit")){
            redirect = viewtotalCredit;
            request.setAttribute("users", dao.getSum());
         }
        
        
        
        
        
        else {
            redirect = INSERT;
        }


        
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}