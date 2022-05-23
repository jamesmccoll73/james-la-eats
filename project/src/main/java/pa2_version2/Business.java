package pa2_version2;

import java.util.ArrayList;
import java.util.List;

/**
 * The class used to model a business
 */
public class Business {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String alias;
	private String name;
	private String image_url;
	private Boolean is_closed;
	private String url;
	private int review_count;
	private Category[] categories;
	private double rating;
	private String[] transactions;
	private String price;
	private Location location;
	private String phone;
	private String display_phone;
	private double distance;
	
	
	public Business(String id, String alias, String name, String image_url, Boolean is_closed, String url, int review_count, Category[] categories, 
					double rating, String[] transactions, String price, Location location, String phone, String display_phone, double distance)
	{
		this.id = id;
		this.alias = alias;
		this.name = name;
		this.image_url = image_url;
		this.is_closed = is_closed;
		this.url = url;
		this.review_count = review_count;
		this.categories = categories;
		this.rating = rating;
		this.transactions = transactions;
		this.price = price;
		this.location = location;
		this.phone = phone;
		this.display_phone = display_phone;
		this.distance = distance;
	}
	
	
	class Category
	{
		private String alias;
		private String title;
		
		public Category(String alias, String title) {
			this.alias = alias;
			this.title = title;
		}
		
		public String getAlias() {
			return alias;
		}
		public String getTitle() {
			return title;
		}
	}
	
	class Coordinates
	{
		private double latitude;
		private double longitude;
		
		public Coordinates(double latitude, double longitude) {
			this.latitude = latitude;
			this.longitude = longitude;
		}
		
		public double getLatitude() {
			return latitude;
		}
		public double getLongitude() {
			return longitude;
		}
	}
	
	class Location
	{
		private String address1;
		private String address2;
		private String address3;
		private String city;
		private String zip_code;
		private String country;
		private String state;
		
		public Location(String address1, String address2, String address3, String city, String zip_code,
					String country, String state) {
			this.address1 = address1;
			this.address2 = address2;
			this.address3 = address3;
			this.city = city;
			this.zip_code = zip_code;
			this.country = country;
			this.state = state;
		}
		
		public String getAddress1() {
			return address1;
		}
		public String getAddress2() {
			return address2;
		}
		public String getAddress3() {
			return address3;
		}
		public String getCity() {
			return city;
		}
		public String getZipCode() {
			return zip_code;
		}
		public String getCountry() {
			return country;
		}
		public String getState() {
			return state;
		}
		public String getDisplayAddress() {
			if(address1 == null) { address1 = "";}
			if(address2 == null) { address2 = "";}
			if(address3 == null) { address3 = "";}
			
			return address1 + " " + address2 + " " + address3 + ", " + city + 
					", " + state + " " + zip_code;
		}
	}
	/////////////////////////////////GETTERS
	
	public String getId() {
		return id;
	}
	public String getAlias() {
		return alias;
	}
	public String getName() {
		return name;
	}
	public String getImageUrl() {
		return image_url;
	}
	public Boolean getIsClosed() {
		return is_closed;
	}
	public String getUrl() {
		return url;
	}
	public int getReviewCount() {
		return review_count;
	}
	public double getRating() {
		return rating;
	}
	
	public List<String> getCategories() {
		List<String> temp = new ArrayList<>();
		for (int i = 0; i < categories.length; i++) {		
			temp.add(categories[i].getTitle());
		}
		return temp;
	}
	
	public StringBuffer getCategoriesString() {
		StringBuffer temp = new StringBuffer();
		for (int i = 0; i < categories.length-1; i++) {		
			temp.append(categories[i].getTitle() + ", ");
		}
		temp.append(categories[categories.length-1].getTitle());
		return temp;
	}
	
	
	public String[] getTransactions() {
		return transactions;
	}
	public String getPrice() {
		return price;
	}
	public String getDisplayAddress(){
		return location.getDisplayAddress();
	}
	public String getPhone() {
		return phone;
	}
	public String getDisplayPhone() {
		return display_phone;
	}
	public double getDistance() {
		return distance;
	}
}

