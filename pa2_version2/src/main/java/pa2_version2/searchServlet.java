package pa2_version2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.regex.*;

/**
 * Servlet implementation class RegisterDispatcher
 */

@WebServlet("/search")
public class searchServlet extends HttpServlet {
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
//        doGet(request, response);;
    	
    	ArrayList<Business> finalBus = null;
		try {
			finalBus = RestaurantDataParser.Init(request, response);
		} catch (ServletException | IOException | URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	request.setAttribute("data", finalBus);
    	request.getRequestDispatcher("searchIn.jsp").forward(request,  response);
    	
//    	String error = "";
//    	
//    	String searchVal = request.getParameter("searchVal");
//    	String sortBy = request.getParameter("sortBy");
//    	String searchBy = request.getParameter("searchBy");
//    	
//    	
//    	
//    	PrintWriter pw = response.getWriter();
//    	pw.println(searchVal);
//    	pw.println(sortBy);
//    	pw.println(searchBy);
    	
        
    	/*
    	
        String regex = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" 
                + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";

        Pattern p = Pattern.compile(regex);
 
        // Find match between given string
        // and regular expression
        // uSing Pattern.matcher()
 
        Matcher m = p.matcher(email);
 
        // Return if the string
        // matched the ReGex
        if(!m.matches()) {
        	error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> Email is not formatted correctly</div>";
        	request.setAttribute("error", error);
        	request.getRequestDispatcher("auth.jsp").include(request, response);
        } 
        else
        {
    	
    	
	        RequestDispatcher dispatch = null;
	    	try {
		    		Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/pa2_assignment","root","password");
					
					PreparedStatement ps = connect.prepareStatement("select * from users where email = ? and password = ?");
					ps.setString(1, email);
	        		ps.setString(2, password);
	        		
	        		ResultSet rs = ps.executeQuery();
	        		if(rs.next()) {
	        			request.setAttribute("name", rs.getString("username"));
	        		}
	        		else {
	        			PreparedStatement ps2 = connect.prepareStatement("select * from users where email = ?");
						ps2.setString(1, email);
						ResultSet rs2 = ps2.executeQuery();
						if(rs2.next()) {
							error += " <div style=\"color:whtie; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\">Incorrect Password</div>";
						}
						else {
							error += " <div style=\"color:white; font-size:15px; background-color: #ff6e6e; width:100%; height:30px; text-align: center;\"> User does not exist</div>";
						}
	        		}
					
	        		
	        		if (!error.equals("")) {
	            		request.setAttribute("error", error);
	        			request.getRequestDispatcher("auth.jsp").include(request, response);
	            	}
	        		else {
	        			request.getRequestDispatcher("loggedIn.jsp").forward(request, response);
	        		}
	        		
	        }
	        catch(Exception e){
	        	e.printStackTrace();
	        }
        }
        */
	}
        
    	
        
    }