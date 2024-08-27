<%@ page import="java.util.List" %>
<%@ page import="com.rentahome.dto.PropertyDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.rentahome.dto.ReservationDTO" %>
<%@ page import="com.rentahome.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Rent A Home Application</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
</head>
<body>
<%
    //this is scriptlet tag and is not part of a response but we use it to process data in java code

    List<ReservationDTO> reservationDTOS = (List<ReservationDTO>) request.getAttribute("reservationDTOS");
    List<PropertyDTO> propertyDTOS = (List<PropertyDTO>) request.getAttribute("propertyDTOS");
    UserDTO loggedInUser = (UserDTO) session.getAttribute("loggedInUser");
    String updateMessage = (String) request.getAttribute("updateMsg");
    if(reservationDTOS == null){
        reservationDTOS = new ArrayList<>();
    }
%>

<jsp:include page="header.jsp"></jsp:include>
<div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-md-3" style="margin-right: 20px">

            <div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
                 style="width: 280px;">
                <ul class="nav nav-pills flex-column mb-auto">


                    <li><a href="#" class="nav-link link-dark"> <svg
                            class="bi me-2" width="16" height="16">
                        <use xlink:href="#table" /></svg> Message
                    </a></li>
                    <% if(loggedInUser.getRole().equals("Owner")){%>
                    <li><a href="#" class="nav-link link-dark"> <svg
                            class="bi me-2" width="16" height="16">
                        <use xlink:href="#speedometer2" /></svg> Email
                    </a></li>
                    <li><a href="/addProperty/<%=loggedInUser.getUserId()%>" class="nav-link link-dark"> <svg
                            class="bi me-2" width="16" height="16">
                    </svg> New Property
                    </a></li>
                    <%}%>
                </ul>
            </div>

        </div>


        <div class="col-md-8">
            <div style="color: blue; font-size: 30px; margin-left: 180px; font-weight: bold;">Below are your reservation</div>
            <div class="accordion" id="accordionExample">

                <% for(ReservationDTO reservationDTO : reservationDTOS) {
                    PropertyDTO propertyDTO = null;
                    for(PropertyDTO dto: propertyDTOS) {
                        if (dto.getPropertyId() == reservationDTO.getPropertyId()){
                            propertyDTO =dto;
                            break;
                        }
                    }
                    if (propertyDTO == null){
                        continue;
                    }
                %>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Reservation:# <%=reservationDTO.getReservationId()%>
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <strong>Reservation for property at:<%=propertyDTO.getAddress()%></strong>
                            Starting from <%=reservationDTO.getStartDate()%> to <%=reservationDTO.getEndDate()%>. The reservation status:<%=reservationDTO.getStatus()%>.
                        </div>
                        <%if(loggedInUser.getRole().equals("Owner") && reservationDTO.getStatus().equals("Pending")){%>
                        <a href="/confirmReservation/<%=reservationDTO.getReservationId()%>" class="btn btn-primary" tabindex="-1" role="button" aria-disabled="true">Confirm reservation</a>
                        <%}%>
                    </div>
                </div>
                <%}%>
            </div>

<%--            <div class="list-group">--%>
<%--                <% for (ReservationDTO reservationDTO: reservationDTOS){%>--%>
<%--                <a href="/editeProperty/<%=properties.get(i).getPropertyId()%>" class="list-group-item list-group-item-action active">--%>
<%--                    Reservation: <%=reservationDTO.getReservationId()%> and--%>
<%--                </a>--%>
<%--                <%}%>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>