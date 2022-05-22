package pa2_version2;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.*;
import java.util.concurrent.TimeUnit;

/**
 * Servlet implementation class RegisterDispatcher
 */

@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private static final String url = "jdbc:mysql://localhost:3306/PA4Users";

    /**
     * Default constructor.
     */
   

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
   
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
//        doGet(request, response);
	        RequestDispatcher dispatch = null;
	    	try {
	    		Cookie[] cookies = request.getCookies();
		    	 if(cookies != null) { 
	    			for(Cookie cookie: cookies){
	    				if(cookie.getName().equals("name")) {
	    					cookie.setMaxAge(0);
			    	  		response.addCookie(cookie);
	    				}
		    	  	}
		    	 }
		    	TimeUnit.SECONDS.sleep(1);
//	        	request.getRequestDispatcher("loggedIn.jsp").include(request, response);
		    	response.sendRedirect(request.getContextPath() + "/loggedIn.jsp");
	        		
	        		
	        }
	        catch(Exception e){
	        	e.printStackTrace();
	        }
        }
	}
        
        