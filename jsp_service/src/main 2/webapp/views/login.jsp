
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="style.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        html,body{
            display: grid;
            height: 100%;
            width: 100%;
            place-items: center;
            background: #f2f2f2;
            /* background: linear-gradient(-135deg, #c850c0, #4158d0); */
        }
        ::selection{
            background: #4158d0;
            color: #fff;
        }
        .wrapper{
            width: 380px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
        }
        .wrapper .title{
            font-size: 35px;
            font-weight: 600;
            text-align: center;
            line-height: 100px;
            color: #fff;
            user-select: none;
            border-radius: 15px 15px 0 0;
            background: linear-gradient(-135deg, #c850c0, #4158d0);
        }
        .wrapper form{
            padding: 10px 30px 50px 30px;
        }
        .wrapper form .field{
            height: 50px;
            width: 100%;
            margin-top: 20px;
            position: relative;
        }
        .wrapper form .field input{
            height: 100%;
            width: 100%;
            outline: none;
            font-size: 17px;
            padding-left: 20px;
            border: 1px solid lightgrey;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .wrapper form .field input:focus,
        form .field input:valid{
            border-color: #4158d0;
        }
        .wrapper form .field label{
            position: absolute;
            top: 50%;
            left: 20px;
            color: #999999;
            font-weight: 400;
            font-size: 17px;
            pointer-events: none;
            transform: translateY(-50%);
            transition: all 0.3s ease;
        }
        form .field input:focus ~ label,
        form .field input:valid ~ label{
            top: 0%;
            font-size: 16px;
            color: #4158d0;
            background: #fff;
            transform: translateY(-50%);
        }
        form .content{
            display: flex;
            width: 100%;
            height: 50px;
            font-size: 16px;
            align-items: center;
            justify-content: space-around;
        }
        form .content .checkbox{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        form .content input{
            width: 15px;
            height: 15px;
            background: red;
        }
        form .content label{
            color: #262626;
            user-select: none;
            padding-left: 5px;
        }
        form .content .pass-link{
            color: "";
        }
        form .field input[type="submit"]{
            color: #fff;
            border: none;
            padding-left: 0;
            margin-top: -10px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
            background: linear-gradient(-135deg, #c850c0, #4158d0);
            transition: all 0.3s ease;
        }
        form .field input[type="submit"]:active{
            transform: scale(0.95);
        }
        form .signup-link{
            color: #262626;
            margin-top: 20px;
            text-align: center;
        }
        form .pass-link a,
        form .signup-link a{
            color: #4158d0;
            text-decoration: none;
        }
        form .pass-link a:hover,
        form .signup-link a:hover{
            text-decoration: underline;
        }
    </style>
</head>
<body>
${unauthorizedMessage }
${unauthenticatedMessage }



<!-- Conditionally display loginFailedStatus -->
<%
    String loginFailedStatus = (String) request.getAttribute("loginFailedStatus");
%>

<% if (loginFailedStatus != null) { %>
<div style="text-align: center; color: #FF5A5F;">
    <%= loginFailedStatus %>
</div>
<% } %>

<%
    String registerSuccess = (String) request.getAttribute("registerSuccess");
%>

<% if (registerSuccess != null) { %>
<div style="text-align: center; color: #00A699;">
    <%= registerSuccess %>
</div>
<% } %>
<%
    String updateStatus = (String) request.getAttribute("updateMsg");
%>

<% if (updateStatus != null) { %>
<div style="text-align: center; color: #00A699;">
    <%= updateStatus %>
</div>
<% } %>


<div class="wrapper">

    <div class="title">
        Login Form
    </div>
    <form action="/user_login" method="post">
        <div class="field">
            <input type="text" class="form-control" id="exampleFormControlInput1"
                   placeholder="Provide your Username" name="name">
            <label>Username</label>
        </div>
        <div class="field">
            <input type="text" class="form-control" id="exampleFormControlInput1"
                   placeholder="Provide your Password" name="password">
            <label>Password</label>
        </div>
        <div class="content">
            <div class="checkbox">
                <input type="checkbox" id="remember-me">
                <label for="remember-me">Remember me</label>
            </div>
            <div class="pass-link">
                <a href="#">Forgot password?</a>
            </div>
        </div>
        <div class="field">
            <input type="submit" value="Login">
        </div>
        <div class="signup-link">
            Not a member? <a href="/signup_page">Signup now</a>
        </div>
    </form>
</div>
</body>
</html>


<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"--%>
<%--         pageEncoding="ISO-8859-1"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="ISO-8859-1">--%>
<%--    <title>Rent A Home Application</title>--%>
<%--    <link--%>
<%--            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"--%>
<%--            rel="stylesheet"--%>
<%--            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"--%>
<%--            crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>


<%--<div style="margin-left: 280px; font-size: 50px; color: red;">Welcome--%>
<%--    To Rent A Home Application</div>--%>


<%--${unauthorizedMessage }--%>
<%--${unauthenticatedMessage }--%>

<%--<div style="margin-left: 500px; color: green;">${registerSuccess}</div>--%>
<%--<div style="margin-left: 500px; color: red;">${loginFailedStatus}</div>--%>
<%--<div style="margin-left: 500px; color: red;">${updateMsg}</div>--%>
<%--<form action="/user_login" method="post">--%>
<%--    <div style="margin-left: 500px; margin-right: 500px">--%>
<%--        <div class="mb-3">--%>
<%--            <label for="exampleFormControlInput1" class="form-label">name</label>--%>
<%--            <input type="text" class="form-control" id="exampleFormControlInput1"--%>
<%--                   placeholder="Provide your name" name="name">--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="exampleFormControlInput2" class="form-label">password</label>--%>
<%--            <input type="text" class="form-control" id="exampleFormControlInput2"--%>
<%--                   placeholder="Provide your Password" name="password">--%>
<%--        </div>--%>

<%--        <button style="margin-left: 100px" type="submit"--%>
<%--                class="btn btn-primary">Login</button>--%>
<%--    </div>--%>
<%--</form>--%>
<%--<br>--%>
<%--<br> <a style="margin-left: 50px" href="/signup_page">New--%>
<%--    User? Register Here!!</a>--%>

<%--</div>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>

<%--</body>--%>
<%--</html>--%>

