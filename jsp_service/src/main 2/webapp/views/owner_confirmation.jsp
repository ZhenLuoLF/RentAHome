<%@ page import="com.rentahome.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reservation Confirmed</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      .container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        max-width: 600px;
        width: 100%;
        text-align: center;
      }
      .header {
        text-align: center;
        margin-bottom: 20px;
      }
      .header h1 {
        margin: 0;
        font-size: 24px;
        color: #333;
      }
      .confirmation-message {
        font-size: 18px;
        color: #28a745;
        margin-bottom: 20px;
      }
      .details {
        font-size: 16px;
        color: #777;
        margin-bottom: 20px;
      }
      .back-btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        text-align: center;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        text-decoration: none;
      }
      .back-btn:hover {
        background-color: #0069d9;
      }
    </style>
  </head>
  <body>
  <%
    UserDTO loggedInUserDTO = (UserDTO) request.getSession().getAttribute("loggedInUser");
  %>
    <div class="container">
      <div class="header">
        <h1>Reservation Confirmed</h1>
      </div>

      <div class="confirmation-message">
        The reservation has been successfully confirmed!
      </div>

      <div class="details">
        Thank you for confirming the reservation.
        <%if(loggedInUserDTO.getRole().equals("Owner")){%>
        The guest will be notified of the confirmation.
        <%}else{%>
        The owner will be notified of the confirmation.
        <%}%>
      </div>

      <%if(loggedInUserDTO.getRole().equals("Owner")){%>
      <a href="/owner_dashboard" class="back-btn">Back to Dashboard</a>
      <%}else{%>
      <a href="/" class="back-btn">Back to homepage</a>
      <%}%>
    </div>
  </body>
</html>
