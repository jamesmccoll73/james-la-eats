<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Search</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="index.css">
        <script src="https://kit.fontawesome.com/3204349982.js" crossorigin="anonymous"></script>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		
		<form class="form-inline" action="search" method="POST">
		  <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Search by...</label>
		  <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="searchBy" style="width:10%;">
		    <option value="category" id="category" selected>Category</option>
	        <option value="name" id="name">Name</option>
		  </select>
		  <input type="text" name="searchVal" id="searchVal" style="width:60%">
		  <button style="background-color: #af0606; color: white;" class="form-control" type="submit" name="submit" ><i class=" fa fa-search"></i></button>
		  
		  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		  <div>
		  	  <span>
		  	     <label for="price">Price</label>
		  	     <input type="radio" id="price" name="sortBy" value="price" checked>
		  	  </span>
		  	  <span>
		  	     <label for="rating">Rating</label>
		  	     <input type="radio" id="rating" name="sortBy" value="rating">
		  	  </span>
			  <span>
			     <label for="reviewCount">Review Count</label>
			     <input type="radio" id="reviewCount" name="sortBy" value="reviewCount">
			  </span>
		  </div>
		   
  		</form>
		
		
		
		
		<h3 style="margin-left: 75px;"> Results for "<%= request.getParameter("searchVal") %>" </h3>
			
			<hr style="margin: 10px 75px;">
	
			
			
			
			
			
			<c:set var="restaurants" value="${requestScope.data}"/>
			
			<c:forEach items="${restaurants}" var="r">
					
				<c:url value="details.jsp" var="myURL">
					<c:param name="name" value="${r.getName()}" />
					<c:param name="address" value="${r.getDisplayAddress()}" />
					<c:param name="phone" value="${r.getPhone()}" />
					<c:param name="categories" value="${r.getCategoriesString()}" />
					<c:param name="price" value="${r.getPrice()}" />
					<c:param name="rating" value="${r.getRating()}" />
					<c:param name="image" value="${r.getImageUrl()}" />
					<c:set var="rating" value="${r.getRating()}"/>
				</c:url>
				
				<% 
				double rat = (Double)pageContext.getAttribute("rating");
				String temp = "";
				
				for(int i = 0; i < 5; i++){
					if(rat >= 1){
						temp = temp + "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-star-fill' viewBox='0 0 16 16'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>";
					}
					else if(rat >= 0.5){
						temp = temp + "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-star-half' viewBox='0 0 16 16'> <path d='M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z'/></svg>";
					}
					else{
						temp = temp + "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-star' viewBox='0 0 16 16'> <path d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z'/></svg>";
					}
					rat --;
				}
				pageContext.setAttribute("starRating", temp);
				request.setAttribute("starRating", temp);
				
				
				
				
				%>
				
				
				
				
				<div class="media">
					<div class="media-left">
						<a href="${myURL}"> <img style="object-fit:cover; border-radius:25px; width: 200px; height: 200px; margin: 10px 60px 10px 100px;" src = "${r.getImageUrl()}" /> </a> </br>
					</div>
					<div class="media-body">
						<a href="${myURL}" style="margin-top: 40px; font-size: 25px; color: grey;">  <c:out value="${r.getName()}" /> <br> </a>
					<div style="font-size: 15px; line-height: 30px;">	
						Price: <c:out value="${r.getPrice()}" /> <br>
						Review Count: <c:out value="${r.getReviewCount()}" /> <br>
						Rating: <%out.print(request.getAttribute("starRating")); %> <br>
						<a href="${r.getUrl()}" target="_blank"> Yelp Link </a> <br> 
						</div>
					</div>
				</div>
				<hr style="margin: 10px 75px;">
				
			</c:forEach>
		
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