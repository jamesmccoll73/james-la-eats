<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <style>
        	body{
        		background-image: url("background.jpg");
        		background-size: 100%;
        		height: 130%;
        	}
        </style>
        
        <meta charset="UTF-8">
        <title>Home</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="index.css">
        <script src="https://kit.fontawesome.com/3204349982.js" crossorigin="anonymous"></script>
        <meta name="google-signin-client_id" content="414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com">
   	    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
        <% //TODO iterate the cookie and check if user registered %>
    </head>

    <body onLoad="test();">
    	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="loggedIn.jsp" style="color:#f25d22; font-family: Georgia, Serif; font-weight: bold; font-size: 25px; width: 28%">James' LA Eats</a>
		  
		  
	     <div class = "username" style="width:52%; font-size:15px">
			  	<% String name = "";
			  	Cookie[] cookies = request.getCookies();
			  	if(cookies != null){
			  		for(Cookie cookie: cookies){
			  			if(cookie.getName().equals("name")){
			  				name = cookie.getValue();
			  			}
			  		}
			  	}
				if (!name.equals("")){
					String printName = name.replace("&"," ");
					out.println("Hello " + printName + "!"); 
				} %>
		 </div>
		 
		
		  
		  <div style="width: 20%;">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
		        <a class="nav-link" href="loggedIn.jsp" style="color:#f25d22; font-weight:bold;"> Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item active">
		        <%
			  	boolean loggedIn = false;
		        if(cookies != null){
			  		for(Cookie cookie: cookies){
			  			if(cookie.getName().equals("name")){
			  				loggedIn = true;
			  			}
			  		}
			  	}
		        if(loggedIn){
		        	out.println("<form class='form-inline' action='logout' method='POST'>"
		        			+ "<button class='nav-link' onclick='signOut();' style='color:#f25d22; background-color: white; border: none; font-weight:bold;'>Logout</button> </form>");
		        }
		        else{
		        	out.println("<a class='nav-link' href='auth.jsp' onclick='signOut();' style='color:#f25d22; font-weight:bold;'>Login/Register</a>");
		        }%>
		        <!-- <a class="nav-link" href="index.jsp" onclick="signOut();" style="color:grey; font-weight:bold;">Logout</a> -->
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<br>
		<br>
		<br>
		
		<img src="los_angeles.jpg" class="img-fluid" style="border-radius: 25px; width: 75%; margin-left: auto; margin-right:auto; height: 300px; display: block;" Responsive image">
		
		<br>
		<br>
		<br>
		
		<div style="text-align: center">
			<div style="color:white; font-family: Helvetica, Sans-serif; font-size: 15px; display: inline-block; width: 65%;">
				Hi, my name is James McColl. I love food, and ever since I came to Los Angeles, I've been trying as many restaurants as I can. 
				I've compiled a list of my favorites on this website, ranked by rating, price, and yelp review count. Enjoy!
			</div>
		</div>
		
		
		&nbsp; &nbsp; &nbsp;
		<form class="form-inline" action="search" method="POST">
		  <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="color: white;">Search by...</label>
		  <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="searchBy" style="width:10%;">
		    <option value="category" id="category" selected>Category</option>
	        <option value="name" id="name">Name</option>
		  </select>
		  <input type="text" name="searchVal" id="searchVal" style="width:60%">
		  <button style="background-color: #af0606; color: white;" class="form-control" type="submit" name="submit" ><i class=" fa fa-search"></i></button>
		  
		  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		  <div>
		  	  <span>
		  	     <label for="price" style="color: white;">Price</label>
		  	     <input type="radio" id="price" name="sortBy" value="price" checked>
		  	  </span>
		  	  <span>
		  	     <label for="rating" style="color: white;">Rating</label>
		  	     <input type="radio" id="rating" name="sortBy" value="rating">
		  	  </span>
			  <span>
			     <label for="reviewCount" style="color: white;">Review Count</label>
			     <input type="radio" id="reviewCount" name="sortBy" style="color: white;" value="reviewCount">
			  </span>
		  </div>
		   
  		</form>
		  
        
        
        
        <script>
			  var auth2;
			  var googleUser; // The current user
			 
			  var auth2;
			  var profile;
			  function test(){
			      gapi.load('auth2', function(){
			  	    auth2 = gapi.auth2.init({
			  	        client_id: '414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com'
			  	    });
			  	    auth2.attachClickHandler('signin-button', {}, onSuccess, onFailure);
			
			  	    auth2.isSignedIn.listen(signinChanged);
			  	    auth2.currentUser.listen(userChanged); // This is what you use to listen for user changes
			  	}); 
			  }
			 
			
				var signinChanged = function (val) {
				    console.log('Signin state changed to ', val);
					var auth2 = gapi.auth2.getAuthInstance();
					var profile = auth2.currentUser.get().getBasicProfile();
					console.log(profile.getName());
					console.log(profile.getEmail());
					const test = document.getElementsByClassName("username");
					test[0].innerText = "Hello "+ profile.getName() + "!";
					document.cookie = "name= ;";
				};
			
				var onSuccess = function(user) {
				    console.log('Signed in as ' + user.getBasicProfile().getName());
				    // Redirect somewhere
				};
			
				var onFailure = function(error) {
				    console.log(error);
				};
			
				function signOut() {
				    auth2.signOut().then(function () {
				        console.log('User signed out.');
				    });
				    document.cookie = "name= ; max-age=0";
				    
				}        
			</script>
 		
 			<script src="https://apis.google.com/js/platform.js?onload=renderButton" 
				onload="this.onload=function(){};handleClientLoad()"
      			onreadystatechange="if (this.readyState === 'complete') this.onload()" async defer>
			</script>
        
        
    </body>
    
   
    </html>