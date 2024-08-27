
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ page import="com.rentahome.dto.ReservationDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rentahome.dto.PropertyDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<%
    List<ReservationDTO> reservationDTOS = (List<ReservationDTO>) request.getAttribute("reservationDTOS");
    List<PropertyDTO> propertyDTOS = (List<PropertyDTO>) request.getAttribute("propertyDTOS");
%>
<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
    <div class="list-group">
        <% for(ReservationDTO reservationDTO : reservationDTOS) {%>

        <a href = "#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria - current = "true" >
            <img src = "https://github.com/twbs.png" alt = "twbs" width = "32" height = "32" class=
            "rounded-circle flex-shrink-0" >
            <div class="d-flex gap-2 w-100 justify-content-between" >
                <div >
                    <h6 class="mb-0" > This is reservation for your property id: <%=reservationDTO.getPropertyId()%>></h6 >
                    <p class="mb-0 opacity-75" > This reservation start from <%=reservationDTO.getStartDate()%> to <%=reservationDTO.getEndDate()%></p>
                </div >
                <small class="opacity-50 text-nowrap" > <%=reservationDTO.getStatus()%> </small >
            </div >
        </a >
       <% }%>
    </div>
</div>
</body>
</html>