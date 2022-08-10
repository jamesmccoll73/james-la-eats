<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="301645777112-2rlc9gth0f5d4reimjcm9bf0kj7ahec0.apps.googleusercontent.com"
          name="google-signin-client_id">
    <title>Login / Register</title>
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
    <script crossorigin="anonymous"
            src="https://kit.fontawesome.com/3204349982.js"></script>
    <script async defer src="https://apis.google.com/js/platform.js"></script>
    <link href="index.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto"
          rel="stylesheet" type="text/css"> 
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
		
		<%-- <div style="color:black; font-size:15px; font-weight:bold; background-color:#fc7979; width:100%; height:30px; text-align:center;" >
			<% String er = (String) request.getAttribute("error");
			if (er != null) out.println(er);
			%>
		</div> --%>
		
		<% String er = (String) request.getAttribute("error");
			if (er != null) out.println(er);
		%>
		
		

		
		
	   <nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="loggedIn.jsp" style="color:#f25d22; font-family: Georgia, Serif; font-weight: bold; font-size: 25px; width: 80%">James' LA Eats</a>
		  
		  <div style="width: 20%;">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
		        <a class="nav-link" href="loggedIn.jsp" style="color:#f25d22; "> Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="auth.jsp" style="color:#f25d22; ">Login/Register</a>
		      </li>
		    </ul>
		  </div>
		</nav>

		<div class="container-fluid">
		    <div class="row">
		        <div class="col-lg-6">
		            <br></br>
		            <h3 class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</h3>
			            <form action="login" method="POST">
			            	<div class="form-outline mb-4">
				              <label class="form-label" for="typeEmailX-2">Email</label>
				              <input type="email" name ="email" id="typeEmailX-2" class="form-control form-control-lg" required/>
				            </div>
				
				            <div class="form-outline mb-4">
				              <label class="form-label" for="typePasswordX-2">Password</label>
				              <input type="password" name="password" id="typePasswordX-2" class="form-control form-control-lg" required/>  
				            </div>
				
				
				            <button class="btn btn-primary btn-lg btn-block" style="background-color: #dd4b39; type="submit">Login</button>
				            <hr class="mx-5">
				            <div>
				            	<div class="g-signin2" data-onsuccess="onSignIn" data-width="auto" data-height="40" data-longtitle="true" data-theme="dark"> </div>
				            	<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				            </div>
			            </form> 
        		</div>
		        <div class="col-lg-6">
		            <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Register</p>
			            <form class="mx-1 mx-md-4" action="register" method="POST">
			            
			                  <div class="d-flex flex-row align-items-center mb-4">
			                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
			                    <div class="form-outline flex-fill mb-0">
			                      <label class="form-label" for="form3Example3c">Email</label>
			                      <input type="email" name="newEmail" id="form3Example3c" class="form-control" style="width:225%" required/>
			                    </div>
			                  </div>
			                  
			                  <div class="d-flex flex-row align-items-center mb-4">
			                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
			                    <div class="form-outline flex-fill mb-0">
			                      <label class="form-label" for="form3Example1c">Username</label>
			                      <input type="text" name="newName" id="form3Example1c" class="form-control" style="width:225%" required/>
			                    </div>
			                  </div>
			
			                  <div class="d-flex flex-row align-items-center mb-4">
			                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
			                    <div class="form-outline flex-fill mb-0">
			                      <label class="form-label" for="form3Example4c">Password</label>
			                      <input type="password" name="newPassword" id="form3Example4c" class="form-control" style="width:225%"/ required> 
			                    </div>
			                  </div>
			
			                  <div class="d-flex flex-row align-items-center mb-4">
			                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
			                    <div class="form-outline flex-fill mb-0">
			                      <label class="form-label" for="form3Example4cd">Confirm Password</label>
			                      <input type="password" name="newPasswordConfirmed" id="form3Example4cd" class="form-control" style="width:225%" required/>
			                    </div>
			                  </div>
							   
			                  <div class="form-check d-flex justify-content-center mb-5">
			                    <label class="form-check-label" for="form2Example3c" style="width:80%;">
			                     I have read and agree to all terms and conditions of James' LA Eats
			                    <input type="checkbox" style="width:15%;" class="form-check-input me-2" value="" id="form2Example3c" required/> </label>
			                  </div> 
			                  
			                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
			                    <button type="submit" style="background-color:#dd4b39;" class="btn btn-primary btn-lg">Create Account</button>
			                  </div>
			
			              </form>
        		</div>
    		</div>
		</div>







</body>

     <script>
		function onSignIn(googleUser) {
	        // Useful data for your client-side scripts:
	        var profile = googleUser.getBasicProfile();
	        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	        console.log('Full Name: ' + profile.getName());
	        console.log('Given Name: ' + profile.getGivenName());
	        console.log('Family Name: ' + profile.getFamilyName());
	        console.log("Image URL: " + profile.getImageUrl());
	        console.log("Email: " + profile.getEmail());
	        var name = profile.getName();
	        var email = profile.getEmail();
	        // The ID token you need to pass to your backend:
	        var id_token = googleUser.getAuthResponse().id_token;
	        window.location.href = "http://localhost:8080/pa2_version2/loggedIn.jsp";
	  		addGoogleUser(name, email, id_token);
	  		document.cookie = "name= ;";
	      }
		
			function onSuccess(googleUser) {
		      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
		      onSignIn(googleUser);
		    }
			
		    function onFailure(error) {
		      console.log(error);
		    }
		 
		    
		  function addGoogleUser(name, email, id) {
				$.ajax({
					url: "register",
					data: {
						username: name,
						password: id,
						email: email
					},
					success: function(result) {
						window.location.href = "http://localhost:8080/james-la-eats/loggedIn.jsp";		        
					}
				});	
			}
		     
		 
		    	function signOut() {
		    	    var auth2 = gapi.auth2.getAuthInstance();
		    	    auth2.signOut().then(function () {
		    	      console.log('User signed out.');
		    	      
		    	    });
		    	  }
		      
		    
		    
		      var CLIENT_ID = '414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com';
		      var API_KEY = config.API_KEY;
		      
		   
		      var authorizeButton = document.getElementById('g-signin2');
		      
		      function handleClientLoad() {
		        gapi.load('client:auth2', initClient);
		      }
		      function initClient() {
		          gapi.client.init({
		          apiKey: API_KEY,
		          clientId: CLIENT_ID,
		          discoveryDocs: DISCOVERY_DOCS,
		          scope: SCOPES
		        }).then(function () {
		          // Listen for sign-in state changes.
		          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);
		         
		          authorizeButton.onclick = handleAuthClick;
		        }, function(error) {
		          appendPre(JSON.stringify(error, null, 2));
		        });
		      }
		      function handleAuthClick(event) {
		        gapi.auth2.getAuthInstance().signIn();
		      }
		    
	</script>
	
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" 
				onload="this.onload=function(){};handleClientLoad()"
      			onreadystatechange="if (this.readyState === 'complete') this.onload()" async defer></script>
	


</html>
