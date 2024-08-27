
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ page import="com.rentahome.dto.UserDTO" %>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
	<meta charset="UTF-8">
	<title> Responsive Registration Form | CodingLab </title>
	<link rel="stylesheet" href="style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			font-family: 'Poppins',sans-serif;
		}
		body{
			height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;
			padding: 10px;
			background: linear-gradient(135deg, #71b7e6, #9b59b6);
		}
		.container{
			max-width: 700px;
			width: 100%;
			background-color: #fff;
			padding: 25px 30px;
			border-radius: 5px;
			box-shadow: 0 5px 10px rgba(0,0,0,0.15);
		}
		.container .title{
			font-size: 25px;
			font-weight: 500;
			position: relative;
		}
		.container .title::before{
			content: "";
			position: absolute;
			left: 0;
			bottom: 0;
			height: 3px;
			width: 30px;
			border-radius: 5px;
			background: linear-gradient(135deg, #71b7e6, #9b59b6);
		}
		.content form .user-details{
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
			margin: 20px 0 12px 0;
		}
		form .user-details .input-box{
			margin-bottom: 15px;
			width: calc(100% / 2 - 20px);
		}
		form .input-box span.details{
			display: block;
			font-weight: 500;
			margin-bottom: 5px;
		}
		.user-details .input-box input{
			height: 45px;
			width: 100%;
			outline: none;
			font-size: 16px;
			border-radius: 5px;
			padding-left: 15px;
			border: 1px solid #ccc;
			border-bottom-width: 2px;
			transition: all 0.3s ease;
		}
		.user-details .input-box input:focus,
		.user-details .input-box input:valid{
			border-color: #9b59b6;
		}
		form .role-details .role-title{
			font-size: 20px;
			font-weight: 500;
		}
		form .category{
			display: flex;
			width: 80%;
			margin: 14px 0 ;
			justify-content: space-between;
		}
		form .category label{
			display: flex;
			align-items: center;
			cursor: pointer;
		}
		form .category label .dot{
			height: 18px;
			width: 18px;
			border-radius: 50%;
			margin-right: 10px;
			background: #d9d9d9;
			border: 5px solid transparent;
			transition: all 0.3s ease;
		}
		#dot-1:checked ~ .category label .one,
		#dot-2:checked ~ .category label .two,
		#dot-3:checked ~ .category label .three{
			background: #9b59b6;
			border-color: #d9d9d9;
		}
		form input[type="radio"]{
			display: none;
		}
		form .button{
			height: 45px;
			margin: 35px 0
		}
		form .button input{
			height: 100%;
			width: 100%;
			border-radius: 5px;
			border: none;
			color: #fff;
			font-size: 18px;
			font-weight: 500;
			letter-spacing: 1px;
			cursor: pointer;
			transition: all 0.3s ease;
			background: linear-gradient(135deg, #71b7e6, #9b59b6);
		}
		form .button input:hover{
			/* transform: scale(0.99); */
			background: linear-gradient(-135deg, #71b7e6, #9b59b6);
		}
		@media(max-width: 584px){
			.container{
				max-width: 100%;
			}
			form .user-details .input-box{
				margin-bottom: 15px;
				width: 100%;
			}
			form .category{
				width: 100%;
			}
			.content form .user-details{
				max-height: 300px;
				overflow-y: scroll;
			}
			.user-details::-webkit-scrollbar{
				width: 5px;
			}
		}
		@media(max-width: 459px){
			.container .content .category{
				flex-direction: column;
			}
		}
	</style>
</head>
<body>
<%
	UserDTO user = (UserDTO) request.getAttribute("user");

	UserDTO userInSession = (UserDTO) session.getAttribute("loggedInUser");
%>
<div class="container">
	<div class="title">Registration</div>
	<div class="content">
		<form action="/update" method="post">
			<div class="user-details">
				<div class="input-box">
					<span class="details">Full Name</span>
					<input type="text" placeholder="Enter your full name">
				</div>
				<div class="input-box">
					<span class="details">Username</span>
					<input type="text" class="form-control"
						   placeholder="Enter your username"
						   name="name" value="${user.getName()}"required>
				</div>
				<div class="input-box">
					<span class="details">Email</span>
					<input type="text" class="form-control"

						   placeholder="Provide your Email Address" name="email" value="${user.getEmail()}" required>

				</div>
				<div class="input-box">
					<span class="details">Phone Number</span>
					<input type="text" placeholder="Enter your number" >
				</div>
				<div class="input-box">
					<span class="details">Password</span>
					<input type="text" class="form-control"
						   placeholder="Enter your password"
						   name="password" required>
				</div>
				<div class="input-box">
					<span class="details">Confirm Password</span>
					<input type="text" placeholder="Confirm your password" required>
				</div>
			</div>
			<div class="role-details">
				<input type="radio" name="role" id="dot-1" value="Customer" required>
				<input type="radio" name="role" id="dot-2" value="Owner">
				<input type="radio" name="role" id="dot-3" value="Prefer not to say">
				<span class="role-title">Role</span>
				<div class="category">
					<label for="dot-1">
						<span class="dot one"></span>
						<span class="role">Customer</span>
					</label>
					<label for="dot-2">
						<span class="dot two"></span>
						<span class="role">Owner</span>
					</label>
					<label for="dot-3">
						<span class="dot three"></span>
						<span class="role">Prefer not to say</span>
					</label>
				</div>
			</div>
			<div class="button">
				<input type="submit" value="Update">
			</div>
		</form>
	</div>
</div>
</body>
</html>
<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"--%>
<%--	pageEncoding="ISO-8859-1"%>--%>
<%--	<%@ page import="com.rentahome.dto.*" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="ISO-8859-1">--%>
<%--<title>Insert title here</title>--%>
<%--<link--%>
<%--	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"--%>
<%--	rel="stylesheet"--%>
<%--	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"--%>
<%--	crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>

<%--	<%--%>
<%--		UserDTO user = (UserDTO) request.getAttribute("user");--%>

<%--		UserDTO userInSession = (UserDTO) session.getAttribute("loggedInUser");--%>
<%--	%>--%>
<%--	<div style="font-size: 50px; color: #FF5A5F; text-align: center;">Welcome--%>
<%--		To RentAHome</div>--%>
<%--	<div style="text-align: center; font-size: 30px; color: #00A699">Please update--%>
<%--		your information here</div>--%>
<%--	<div style="margin-left: 500px; margin-right: 500px">--%>
<%--		<form action="/update" method="post">--%>

<%--			<div class="mb-3">--%>
<%--				<label for="exampleFormControlInput1" class="form-label">Username</label>--%>
<%--				<input type="text" class="form-control"--%>
<%--					id="exampleFormControlInput1" placeholder="Provide your Name"--%>
<%--					name="name" value="${user.getName()}">--%>
<%--			</div>--%>
<%--			<div class="mb-3">--%>
<%--				<label for="exampleFormControlInput1" class="form-label">Password</label>--%>
<%--				<input type="text" class="form-control"--%>
<%--					id="exampleFormControlInput1" placeholder="Provide your Password"--%>
<%--					name="password" value="${user.getPassword()}">--%>
<%--			</div>--%>

<%--			<div class="mb-3">--%>
<%--				<label for="exampleFormControlInput1" class="form-label">Email--%>
<%--					Address</label> <input type="text" class="form-control"--%>
<%--					id="exampleFormControlInput1"--%>
<%--					placeholder="Provide your Email Address" name="email" value="${user.getEmail()}">--%>
<%--			</div>--%>

<%--			<div class="mb-3">--%>
<%--				<label for="exampleFormControlInput1" class="form-label">Choose your Role</label> --%>
<%--			--%>
<%--			<select name="role">--%>
<%--				<option value="Owner">Owner</option>--%>
<%--				<option value="Customer">Customer</option>--%>
<%--			</select>--%>
<%--			</div>--%>

<%--			<div style="font-family: Arial, sans-serif; font-size: 16px; color: #333; font-weight: bold;">--%>
<%--				By selecting Update, I agree to RentAHome's Terms of Service, Payments Terms of Service, and Nondiscrimination Policy and acknowledge the Privacy Policy.--%>
<%--			</div>--%>

<%--			<button style="margin-left: 100px" type="submit"--%>
<%--				class="btn btn-primary">Update</button>--%>


<%--		</form>--%>

<%--			<br> <br> <a style="margin-left: 50px" href="/">Back to--%>
<%--			Home Page!!</a>--%>
<%--	</div>--%>
<%--</body>--%>
<%--</html>--%>