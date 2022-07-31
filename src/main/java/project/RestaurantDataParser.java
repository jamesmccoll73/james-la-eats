package project;


import com.google.gson.*;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParseException;
import com.google.gson.reflect.TypeToken;

/**
 * A class that pretends to be the Yelp API
 */

//@WebServlet("/search")
//public class FakeYelpAPI {
public class RestaurantDataParser {
    static HashMap<String, Business> pairer = new HashMap<String, Business>();
    static ArrayList<Business> finalBus = new ArrayList<Business>();

    /**
     * Initializes the DB with json data
     *
     * @param responseString the Yelp json string
     * @throws FileNotFoundException 
     * @throws URISyntaxException 
     */
    public static ArrayList<Business> Init(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, ServletException, IOException, URISyntaxException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //TODO check if you've done the initialization
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //TODO get businessHelper array from json
        //TODO iterate the businessHelper array and insert every business into the DB
        
//        Gson gson = new Gson();
        
        String searchBy = request.getParameter("searchBy");
        String searchVal = request.getParameter("searchVal");
        String sorter = (String) request.getParameter("sortBy");
        
//    	System.out.println(searchBy);
//    	System.out.println(searchVal);
//    	System.out.println(sorter);
    	
    	String sqlSorter;
    	if(sorter.equals("price")) {
    		sqlSorter = "red.estimated_price ASC";
    	}
    	else if(sorter.equals("rating")) {
    		sqlSorter = "rad.rating DESC";
    	}
    	else {  //Sorting by review count
    		sqlSorter = "rad.review_count DESC";
    	}
    	
    	
        
        try {
//	        File file = new File("/Users/jamesmccoll/eclipse-workspace/pa2_version2/restaurant_data.json");
        	java.net.URL ifstream = RestaurantDataParser.class.getClassLoader().getResource("restaurant_data.json");
            
        	File file = new File(ifstream.toURI());
	        
	        Scanner sc = new Scanner(file);
	        String temp = "";
	        while (sc.hasNext()) {
	        	temp+=sc.nextLine();
	        }
	        Business[] Businesses = new Gson().fromJson(temp, Business[].class);
	        
	        
	        for(Business b: Businesses) {
	        	pairer.put(b.getId(), b);
	        }
	        
	        
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pa2_assignment", "root", "root");
	        PreparedStatement ps;
	        PreparedStatement ps1;
	        PreparedStatement ps2;
	        PreparedStatement ps3;
	        PreparedStatement ps4;
	        PreparedStatement ps5;
	        
	        ps3 = con.prepareStatement("SET SQL_SAFE_UPDATES = 0;");
	        ps3.execute();
	        ps3 = con.prepareStatement("DELETE FROM pa2_assignment.Rating_details");
	        ps3.execute();
	        ps3 = con.prepareStatement("DELETE FROM pa2_assignment.Category");
	        ps3.execute();
	        ps3 = con.prepareStatement("DELETE FROM pa2_assignment.Restaurant_details");
	        ps3.execute();
	        ps3 = con.prepareStatement("DELETE FROM pa2_assignment.Restaurant1");
	        ps3.execute();

	        
	        for (int i = 0; i < Businesses.length; i++) {
	        	ps = con.prepareStatement("INSERT INTO pa2_assignment.Restaurant1 (restaurant_id, restaurant_name, details_id, rating_id) VALUES (?, ?, ?, ?)");
	        	ps.setString(1, Businesses[i].getId());
	        	ps.setString(2,  Businesses[i].getName());
	        	ps.setLong(3,  i+1);
	        	ps.setLong(4,  i+1);
	        	ps.executeUpdate();
	        	
	        	ps1 = con.prepareStatement("INSERT INTO pa2_assignment.Restaurant_details (details_id, image_url, address, phone_no, estimated_price, yelp_url) VALUES (?, ?, ?, ?, ?, ?)");
	        	ps1.setLong(1,  i+1);
	        	ps1.setString(2,  Businesses[i].getImageUrl());
	        	ps1.setString(3, Businesses[i].getDisplayAddress());
	        	ps1.setString(4,  Businesses[i].getPhone());
	        	ps1.setString(5, Businesses[i].getPrice());
	        	ps1.setString(6,  Businesses[i].getUrl());
	        	ps1.executeUpdate();
//	        	

	        	
	        	
        	   List<String> temp1 = Businesses[i].getCategories();
	        	for (int j = 0; j < Businesses[i].getCategories().size(); j++) {
	            	ps2 = con.prepareStatement("INSERT INTO pa2_assignment.Category (category_name, restaurant_id) VALUES (?,?)");
	            	ps2.setString(1, temp1.get(j)); 
	            	ps2.setString(2, Businesses[i].getId());
	            	try {
						ps2.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        	}
	        	
	        	ps4 = con.prepareStatement("INSERT INTO pa2_assignment.Rating_details (rating_id, review_count, rating) VALUES (?,?,?)");
	        	ps4.setLong(1, i+1);
	        	ps4.setLong(2, Businesses[i].getReviewCount());
	        	ps4.setDouble(3,  Businesses[i].getRating());
	        	ps4.executeUpdate();
	        }
	        
	        if(searchBy.equals("category")) {
	        	ps5 = con.prepareStatement("SELECT r.restaurant_id, r.restaurant_name, c.category_name, red.estimated_price, red.yelp_url, red.image_url, rad.review_count, rad.rating "
						+	"FROM pa2_assignment.Restaurant1 r, pa2_assignment.Restaurant_details red, pa2_assignment.Rating_details rad, pa2_assignment.Category c "
						+	"WHERE r.details_id = red.details_id "
						+	"AND r.rating_id = rad.rating_id "
						+	"AND r.restaurant_id = c.restaurant_id "
						+	"AND c.category_name LIKE ? "
						+	"ORDER BY " + sqlSorter);
	        	
	        	String searchCat = "%" + searchVal + "%";
	        	ps5.setString(1, searchCat);
//	        	ps5.setString(2, sqlSorter);
	        }
	        else { // searching by name
	        	ps5 = con.prepareStatement("SELECT r.restaurant_id, r.restaurant_name, c.category_name, red.estimated_price, red.yelp_url, red.image_url, rad.review_count, rad.rating "
						+	"FROM pa2_assignment.Restaurant1 r, pa2_assignment.Restaurant_details red, pa2_assignment.Rating_details rad, pa2_assignment.Category c "
						+	"WHERE r.details_id = red.details_id "
						+	"AND r.rating_id = rad.rating_id "
						+	"AND r.restaurant_id = c.restaurant_id "
						+	"AND r.restaurant_name LIKE ? "
						+	"ORDER BY " + sqlSorter);
	        	
	        	String searchName = "%" + searchVal + "%";
	        	ps5.setString(1, searchName);
//	        	ps5.setString(2, sqlSorter);
	        }
	       
	        finalBus.clear();
	        
	        ResultSet rs = ps5.executeQuery();
	        while(rs.next()) {
	        	if(!finalBus.contains(pairer.get(rs.getString("restaurant_id")))){
	        		finalBus.add(pairer.get(rs.getString("restaurant_id")));
	        	}
	        	
	        	
//	        	System.out.println(rs.getString("restaurant_name") + "   " + rs.getString("estimated_price")); 
	        }
	        return finalBus;
	        
	        
	        
	        
        } catch (SQLException e) {
        	System.out.println(e);
        } catch(ClassNotFoundException e) {
        	System.out.println(e);
        }
	        
        return finalBus;
	        
	        
	        
	        
//	        for (int i = 0; i < allBusinesses.length; ++i) {
//	        	System.out.println(allBusinesses[i].getName());
//	        	System.out.println(allBusinesses[i].getId());
//	        	System.out.println(allBusinesses[i].getReviewCount());
//	        	System.out.println(allBusinesses[i].getImageUrl());
//	        	System.out.println(allBusinesses[i].getRating());
//	        	System.out.println(allBusinesses[i].getUrl());
//	        	System.out.println(allBusinesses[i].getPrice());
//	        	System.out.println(allBusinesses[i].getDisplayAddress());
//	        	System.out.println();
//	        	System.out.println();
//	        	System.out.println();
//	        	
//	        }
//        } catch(FileNotFoundException e) {
//        	System.out.println(e);
//        }
        
        
        
        
//		try(BufferedReader file = new BufferedReader(new FileReader(input))) {
//			TimefallShelter[] shelters = gson.fromJson(file, TimefallShelter[].class);
//			fileName = input;
//			Boolean test = checkFile(shelters);
//			if(test) {
//				worked = true;
//				System.out.println("=== Data accepted ===");
//				fileName = input;
//				return shelters;
//			}
//		}
//		catch(FileNotFoundException e) {
//			System.out.println("The file " + input + " could not be found.");
//		}
//		catch(IOException e) {
//			System.out.println("Error reading input, please try again");
//		}
//		catch(JsonSyntaxException e){
//			System.out.println("Data cannot be converted to the proper type as shown above");
//		}
        
        
        
        
        
   
    }

    public static Business getBusiness(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //TODO return business based on id
        return null;
    }

    /**
     * @param keyWord    the search keyword
     * @param sort       the sort option (price, review count, rating)
     * @param searchType search in category or name
     * @return the list of business matching the criteria
     */
    public static ArrayList<Business> getBusinesses(String keyWord, String sort, String searchType) {
        ArrayList<Business> busisnesses = new ArrayList<Business>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //TODO get list of business based on the param
        return busisnesses;

    }
}

//Code adapted from https://stackoverflow.com/questions/23070298/get-nested-json-object-with-gson-using-retrofit
//class BusinessDeserializer implements JsonDeserializer<BusinessHelper> {
//    @Override
//    public BusinessHelper deserialize(JsonElement je, Type type, JsonDeserializationContext jdc) throws JsonParseException {
//        JsonElement content = je.getAsJsonObject();
//        return new Gson().fromJson(content, BusinessHelper.class);
//    }
//}