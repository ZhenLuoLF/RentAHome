<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.rentahome.dto.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

<%
    UserDTO loggedInUser = (UserDTO) session.getAttribute("loggedInUser");
%>
<div class="container-xxl">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img src="${pageContext.request.contextPath}/image/icon.webp" alt="R" width="30" height="24" class="d-inline-block align-text-top">
                Rent A Home
            </a>

            <div class="mx-auto d-none d-lg-flex" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <% if(loggedInUser != null){
                        if(loggedInUser.getRole().equals("Owner")){%>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/owner_dashboard">Properties</a>
                    </li>
                    <%}%>
                    <li class="nav-item">
                        <a class="nav-link active" href="/reservation_dashboard">Reservations</a>
                    </li>
                    <%}%>
                </ul>
            </div>
            <div class="ml-auto" >
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <%
                        if (loggedInUser != null) {
                    %>
                    <!-- If user is logged in -->
                    <li class="nav-item"><a class="nav-link" href="update_page/<%= loggedInUser.getUserId() %>">Update Account</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">LogOut</a></li>
                    <%
                    } else {
                    %>
                    <!-- If user is not logged in -->
                    <li class="nav-item"><a class="nav-link" href="signup_page">Sign Up</a></li>
                    <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>

            </div>
    </nav>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>