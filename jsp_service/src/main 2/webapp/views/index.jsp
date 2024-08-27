<!-- Airbnb clone using Bootstrap 4 and Custom CSS -->

<!-- Bootstrap 4 is the newest version of Bootstrap, which is the most popular HTML, CSS, and JavaScript framework for developing responsive, mobile-first websites.

Bootstrap 4 is completely free to download and use! -->

<!-- What is Bootstrap?  -->

<!-- Bootstrap is a free front-end framework for faster and easier web development.

Bootstrap includes HTML and CSS based design templates for typography, forms, buttons, tables, navigation, modals, image carousels and many other, as well as optional JavaScript plugins.

Bootstrap also gives you the ability to easily create responsive designs. -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="com.rentahome.dto.*" %>
<%@ page import="java.util.List" %>
<%
	UserDTO loggedInUser = (UserDTO) session.getAttribute("loggedInUser");
	List<PropertyDTO> propertyDTOS = (List<PropertyDTO>) request.getAttribute("propertyDTOS");
	List<PropertyTypeDTO> propertyTypeDTOS = (List<PropertyTypeDTO>) request.getAttribute("propertyTypeDTOS");
%>
<html>
<head>
	<style>
		.image-grid {
			display: flex;
			flex-wrap: wrap;
			gap: 1rem; /* Adjust spacing between images */
		}

		.image-group {
			display: none; /* Hide all groups by default */
		}

		.image-group img {
			max-width: 100%;
			height: auto;
		}

		.image-group.show {
			display: flex; /* Show only the selected group */
		}

		.image-group img.show {
			display: block; /* Show the image */
		}

		.image-group img.hide {
			display: none; /* Hide the image */
		}



	</style>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


	<!-- The name between <title> tag defines the title of the document. -->

	<title>Vacation Rentals, Homes & Experiences</title>

	<!-- Bootstrap 4 is designed to be responsive to mobile devices. Mobile-first styles are part of the core framework.

    To ensure proper rendering and touch zooming, add the following <meta> tag inside the <head> element: -->

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap link -->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

	<!-- Font selection link -->

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- The Styles used has been stored and saved in another file named "style.css" and linked through <link> tag as shown below: -->

	<link rel="stylesheet" href="custom.css">
	<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="index.ico" />
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const tags = document.querySelectorAll('.btn[data-tag]');
			const imageGroups = document.querySelectorAll('.image-group');

			// Show a random set of 3 images on page load
			function showRandomImages() {
				const allImages = Array.from(imageGroups).flatMap(group => Array.from(group.children));
				const randomImages = shuffle(allImages).slice(0, 3);
				randomImages.forEach(img => img.classList.add('show'));
			}

			// Shuffle array function
			function shuffle(array) {
				let currentIndex = array.length, temporaryValue, randomIndex;
				while (currentIndex !== 0) {
					randomIndex = Math.floor(Math.random() * currentIndex);
					currentIndex -= 1;
					temporaryValue = array[currentIndex];
					array[currentIndex] = array[randomIndex];
					array[randomIndex] = temporaryValue;
				}
				return array;
			}

			// Show random images on page load
			showRandomImages();

			// Click event to filter images based on tag
			tags.forEach(tag => {
				tag.addEventListener('click', function(e) {
					e.preventDefault();

					// Get the selected tag
					const selectedTag = this.getAttribute('data-tag');

					// Hide all image groups
					imageGroups.forEach(group => {
						if (group.getAttribute('data-tag') === selectedTag) {
							group.style.display = 'flex'; // Show group if tag matches
						} else {
							group.style.display = 'none'; // Hide group if tag does not match
						}
					});

					// Optionally show the first 3 images of the selected tag
					const selectedGroup = Array.from(imageGroups).find(group => group.getAttribute('data-tag') === selectedTag);
					if (selectedGroup) {
						const imagesToShow = Array.from(selectedGroup.children).slice(0, 3);
						selectedGroup.children.forEach(img => img.classList.remove('show'));
						imagesToShow.forEach(img => img.classList.add('show'));
					}
				});
			});
		});
	</script>



</head>
<body class="background_img">

<!-- This is to display the Navbar of the website. -->

<%--<nav class="navbar navbar-expand-lg navbar-light">--%>
<%--	<div class="collapse navbar-collapse">--%>

<%--		<!-- SVG for Logo -->--%>

<%--		<!-- Scalable Vector Graphics (SVG) is an XML-based vector image format for two-dimensional graphics with support for interactivity and animation. The SVG specification is an open standard developed by the World Wide Web Consortium (W3C) since 1999. SVG images and their behaviors are defined in XML text files. -->--%>

<%--		<svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false" style="height: 2em; width: 2em; display: block; fill: currentcolor; color: white; font-family: Helvetica; font-size: 16px;"><path d="m499.3 736.7c-51-64-81-120.1-91-168.1-10-39-6-70 11-93 18-27 45-40 80-40s62 13 80 40c17 23 21 54 11 93-11 49-41 105-91 168.1zm362.2 43c-7 47-39 86-83 105-85 37-169.1-22-241.1-102 119.1-149.1 141.1-265.1 90-340.2-30-43-73-64-128.1-64-111 0-172.1 94-148.1 203.1 14 59 51 126.1 110 201.1-37 41-72 70-103 88-24 13-47 21-69 23-101 15-180.1-83-144.1-184.1 5-13 15-37 32-74l1-2c55-120.1 122.1-256.1 199.1-407.2l2-5 22-42c17-31 24-45 51-62 13-8 29-12 47-12 36 0 64 21 76 38 6 9 13 21 22 36l21 41 3 6c77 151.1 144.1 287.1 199.1 407.2l1 1 20 46 12 29c9.2 23.1 11.2 46.1 8.2 70.1zm46-90.1c-7-22-19-48-34-79v-1c-71-151.1-137.1-287.1-200.1-409.2l-4-6c-45-92-77-147.1-170.1-147.1-92 0-131.1 64-171.1 147.1l-3 6c-63 122.1-129.1 258.1-200.1 409.2v2l-21 46c-8 19-12 29-13 32-51 140.1 54 263.1 181.1 263.1 1 0 5 0 10-1h14c66-8 134.1-50 203.1-125.1 69 75 137.1 117.1 203.1 125.1h14c5 1 9 1 10 1 127.1.1 232.1-123 181.1-263.1z"></path></svg>--%>

<%--		<!-- End of SVG -->--%>

<%--		<ul class="navbar-nav ml-auto">--%>


<%--			<%--%>
<%--				if (loggedInUser != null) {--%>
<%--			%>--%>
<%--			<!-- If user is logged in -->--%>
<%--			<li class="nav-item"><a class="nav-link" href="update_page/<%= loggedInUser.getUserId() %>">Update Account</a></li>--%>
<%--			<li class="nav-item"><a class="nav-link" href="/logout">LogOut</a></li>--%>
<%--			<%--%>
<%--			} else {--%>
<%--			%>--%>
<%--			<!-- If user is not logged in -->--%>
<%--			<li class="nav-item"><a class="nav-link" href="signup_page">Sign Up</a></li>--%>
<%--			<li class="nav-item"><a class="nav-link" href="login">Login</a></li>--%>
<%--			<%--%>
<%--				}--%>
<%--			%>--%>
<%--		</ul>--%>
<%--	</div>--%>
<%--</nav>--%>

<!-- End of NavBar -->




<jsp:include page="header.jsp"></jsp:include>
<!-- This is to make the Form Contents appear on the Image -->
<h1 style="font-size: 2em; font-weight: bold; margin-bottom: 15px;color: #FF5A5F; text-align: center">Book unique home and experiences.</h1>
<form action="/search_property" method="post" style="display: flex; align-items: center; flex-wrap: wrap; background-color: white; padding: 10px; font-family: Helvetica, Arial, sans-serif; font-weight: 600; color: #484848; border-radius: 5px;">
	<div style="padding: 10px 20px; margin-left: 80px">
		<label>WHERE</label>
		<input type="text" placeholder="Anywhere" name="address" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px;" required/>
	</div>
	<div style="padding: 10px 20px;">
		<label>CHECK IN</label>
		<input type="date" placeholder="dd-mm-yyyy" name="checkin" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px;" required/>
	</div>
	<div style="padding: 10px 20px;">
		<label>CHECK OUT</label>
		<input type="date" placeholder="dd-mm-yyyy" name="checkout" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px;" required/>
	</div>
	<div style="padding: 10px 20px;">
		<label>Category</label>
		<select name="category" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px;">
			<% for(PropertyTypeDTO propertyTypeDTO : propertyTypeDTOS) {%>
				<option value = <%=propertyTypeDTO.getPropertyTypeName()%>> <%=propertyTypeDTO.getPropertyTypeName()%></option>
			<% } %>
		</select>
	</div>
	<button type="submit" style="padding: 8px 16px; border: none; background-color: #007bff; color: white; font-size: 16px; border-radius: 4px;">Search</button>
</form>

<!-- Form Ends here. -->

<!-- The below section displays the Reviews and Feedbacks given by the users. -->

<div style="padding: 2px 100px; font-size: 14px; font-family: Helvetica;">
	<h3>What guests are saying about homes</h3>

	<!-- SVG for particular Star Symbol -->

	<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 20px; width: 20px; fill: rgb(255, 180, 0);"><path d="m21.95 9.48a.84.84 0 0 0 -.87-.48h-4.62a.5.5 0 0 0 0 1l4.14.01-4.81 4.17a.5.5 0 0 0 -.14.57l2.65 6.38-6.07-3.72a.5.5 0 0 0 -.52 0l-6.08 3.72 2.65-6.37a.5.5 0 0 0 -.13-.57l-4.75-4.18h5.75a.5.5 0 0 0 .46-.3l2.37-5.37 1.58 3.57a.5.5 0 0 0 .91-.41l-1.72-3.88a.8.8 0 0 0 -1.56-.01l-2.38 5.39h-5.9a.83.83 0 0 0 -.87.48.85.85 0 0 0 .32.96l4.85 4.25-2.78 6.67a.81.81 0 0 0 .16.98.66.66 0 0 0 .43.15 1.1 1.1 0 0 0 .56-.18l6.37-3.91 6.38 3.92a.81.81 0 0 0 .99.03c.15-.12.37-.41.15-1l-2.77-6.66 4.92-4.26a.84.84 0 0 0 .31-.95zm-.78.53h-.01" fill="#484848"></path><path d="m11 21.5a.5.5 0 1 1 -.5-.5.5.5 0 0 1 .5.5zm-3.5-15.5a.5.5 0 1 0 .5.5.5.5 0 0 0 -.5-.5zm15 10h-.5v-.5a.5.5 0 0 0 -1 0v .5h-.5a.5.5 0 0 0 0 1h .5v.5a.5.5 0 0 0 1 0v-.5h.5a.5.5 0 0 0 0-1zm-15-13h-.5v-.5a.5.5 0 0 0 -1 0v .5h-.5a.5.5 0 0 0 0 1h .5v.5a.5.5 0 0 0 1 0v-.5h.5a.5.5 0 0 0 0-1zm10.22 7.54a.84.84 0 0 0 -.17-.02q-.28-.01-3.19 0a .6.6 0 0 1 -.55-.35l-1.5-3.23a.42.42 0 0 0 -.75 0l-1.81 4.14a2.92 2.92 0 0 0 4.12 3.72l.46-.26 3.49-2.99.16-.18a.5.5 0 0 0 -.26-.82z"></path></svg>
	<!-- End of SVG -->
	<p style="display:inline">Rent A Home were rated
		<strong>4.6 out of 5 stars</strong>
		with <strong> 210,000+ reviews </strong>
	</p>
</div><br>

<div class="container">
	<div class="row justify-content-md-between align-items-md-center">
		<div class="col-md-5 mb-5 mb-md-0">
			<!-- Tabs Navigation -->
			<ul class="nav nav-pills" id="feature-tabs" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="tab-pool" data-bs-toggle="tab" href="#pool" role="tab" data-tag="pool">Pools</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="tab-beach" data-bs-toggle="tab" href="#beach" role="tab" data-tag="beach">Beach Front</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="tab-cabin" data-bs-toggle="tab" href="#cabin" role="tab" data-tag="cabin">Garden</a>
				</li>
			</ul>
			<!-- End Tabs Navigation -->
		</div>
		<!-- End Col -->
	</div>
	<!-- End Row -->

	<!-- Tab Content -->
	<div class="tab-content mt-4" id="feature-tab-content">
		<div class="tab-pane fade show active" id="pool" role="tabpanel" aria-labelledby="tab-pool">
			<div class="row">
				<% for(PropertyDTO property : propertyDTOS) {
				 for(FeatureDTO featureDTO : property.getFeatures()) {
				if(featureDTO.getFeatureName().equals("Pool")) { %>
				<div class="col-md-4 mb-3">
					<img src="${pageContext.request.contextPath}<%=property.getPictureLocation()%>" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=property.getAddress()%></h5>
						<p class="card-text">Features:
							<%for(FeatureDTO feature : property.getFeatures()){%>
							<%=feature.getFeatureName()%>
							<%}%>
						</p>
						<a href="/booking/<%=property.getPropertyId()%>" class="btn btn-primary">Reserve it!</a>
					</div>
				</div>
				<% }}} %>
			</div>
		</div>
		<div class="tab-pane fade" id="beach" role="tabpanel" aria-labelledby="tab-beach">
			<div class="row">
				<% for(PropertyDTO property : propertyDTOS) {
					for(FeatureDTO featureDTO : property.getFeatures()) {
						if(featureDTO.getFeatureName().equals("Beach")) { %>
				<div class="col-md-4 mb-3">
					<img src="${pageContext.request.contextPath}<%=property.getPictureLocation()%>" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=property.getAddress()%></h5>
						<p class="card-text">Features:
							<%for(FeatureDTO feature : property.getFeatures()){%>
							<%=feature.getFeatureName()%>
							<%}%>
						</p>
						<a href="/booking/<%=property.getPropertyId()%>" class="btn btn-primary">Reserve it!</a>
					</div>
				</div>
				<% }}} %>
			</div>
		</div>
		<div class="tab-pane fade" id="cabin" role="tabpanel" aria-labelledby="tab-cabin">
			<div class="row">
				<% for(PropertyDTO property : propertyDTOS) {
					for(FeatureDTO featureDTO : property.getFeatures()) {
						if(featureDTO.getFeatureName().equals("Garden")) { %>
				<div class="col-md-4 mb-3">
					<img src="${pageContext.request.contextPath}<%=property.getPictureLocation()%>" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=property.getAddress()%></h5>
						<p class="card-text">Features:
							<%for(FeatureDTO feature : property.getFeatures()){%>
							<%=feature.getFeatureName()%>
							<%}%>
						</p>
						<a href="/booking/<%=property.getPropertyId()%>" class="btn btn-primary">Reserve it!</a>
					</div>
				</div>
				<% }}} %>
			</div>
		</div>
	</div>
	<!-- End Tab Content -->
</div>



	<hr>
	<div class="container" style="margin-top: 70px;">
		<div class="row">
			<div class="col-md-3">
				<section>
					<h6 style="margin-left: 40px;">Airbnb</h6>
					<ul style="list-style: none;">
						<li><a href="#">Help</a></li>
						<li><a href="#">Policies</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Privacy</a></li>
					</ul>
				</section>
			</div>
			<div class="col-md-3">
				<section>
					<h6 style="margin-left: 40px;">Discover</h6>
					<ul style="list-style: none;">
						<li><a href="#">Trust & Safety</a></li>
						<li><a href="#">Site Map</a></li>
					</ul>
				</section>
			</div>
			<div class="col-md-3">
				<section>
					<h6 style="margin-left: 40px;">Hosting</h6>
					<ul style="list-style: none;">
						<li><a href="#">Why Host</a></li>
						<li><a href="#">Responsible Hosting</a></li>
						<li><a href="#">Open Homes</a>&emsp;<a href="#"><button type="button" class="btn btn-primary new">New</button></a></li>
					</ul>
				</section>
			</div>
			<div class="col-md-3">
				<section>
					<h5 style="margin-left: 40px;">
						<a href="#" style="color: #636e72;"><i class="fa fa-facebook" style="padding-right: 15px;"></i></a>
						<a href="#" style="color: #636e72;"><i class="fa fa-twitter" style="padding-right: 15px;"></i></a>
						<a href="#" style="color: #636e72;"><i class="fa fa-instagram" style="padding-right: 15px;"></i></a>
					</h5>
					<ul style="list-style: none;">
						<li><a href="#">Terms</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Site Map</a></li>
					</ul>
				</section>
			</div>
		</div>
	</div>
</div>
</body>
</html>

