<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ page import="com.rentahome.dto.PropertyDTO" %>
<%@ page import="com.rentahome.dto.FeatureDTO" %>
<%@ page import="com.rentahome.dto.PropertyTypeDTO" %>
<%@ page import="java.util.List" %>
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

<div class="py-5 text-center">
    <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/image/propertyTemp.jpg" alt="" width="72" height="72">
    <h2>Property update form</h2>
    <p class="lead">Please input your new property here.</p>
</div>

<%
    Integer ownerId = (Integer) request.getAttribute("ownerId");
    List<PropertyTypeDTO> propertyTypeDTOList = (List<PropertyTypeDTO>) request.getAttribute("propertyTypes");
%>

<div class="container">
    <form action="/addProperty" method="post">
        <div class="row g-3">
            <div class="form-group col-6">
                <label for="propertyId" class="form-label">Property ID</label>
                <input type="number" class="form-control" readonly
                       id="propertyId"placeholder="You can not input property ID" name="propertyId" value="">
            </div>
            <div class="form-group col-6">
                <label for="ownerId" class="form-label">Owner Id</label>
                <input type="number" class="form-control" readonly
                       id="ownerId"placeholder="" name="ownerId" value="<%=ownerId%>">
            </div>
            <div class="form-group col-12">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control"
                       id="address" placeholder="New property address" name="address" value="" required>
            </div>
            <div class="form-group   col-6">
                <label for="price" class="form-label">Property price</label>
                <input type="number" class="form-control"
                       id="price" placeholder="Input your price here" name="price" value="" required>
            </div>
            <div class="form-group   col-6">
                <label for="picture" class="form-label">Picture location</label>
                <input type="text" class="form-control"
                       id="picture" placeholder="Picture location" name="picture" value="" required>
            </div>


            <div class="form-group col-sm-6">
                <label for="availableStartDate" class="form-label">Available start date</label>
                <input type="date" class="form-control"
                       id="availableStartDate"
                       placeholder="Available start date" name="availableStartDate" value="" required>
            </div>
            <div class="form-group col-sm-6">
                <label for="availableEndDate" class="form-label">Available end date</label>
                <input type="date" class="form-control"
                       id="availableEndDate"
                       placeholder="Available end date" name="availableEndDate" value="" required>
            </div>
            <div class="form-group mb-3">
                <label for="exampleFormControlSelect1">Property Type</label>
                <select class="form-control" id="exampleFormControlSelect1" name="propertyType">
                    <%for(PropertyTypeDTO propertyTypeDTO: propertyTypeDTOList){%>
                    <option value="<%=propertyTypeDTO.getPropertyTypeName()%>"><%=propertyTypeDTO.getPropertyTypeName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="form-group">
                <label>Select the features</label>
            </div>
            <div class="form-check col-md-4">
                <input name="features"  class="form-check-input" type="checkbox" value="Pool" id="PoolCheck">
                <label class="form-check-label" for="PoolCheck">
                    Pool
                </label>
            </div>
            <div class="form-check col-md-4">
                <input name="features" class="form-check-input" type="checkbox" value="Garden" id="GardenCheck">
                <label class="form-check-label" for="GardenCheck">
                    Garden
                </label>
            </div>
            <div class="form-check col-md-4 mb-3">
                <input name="features" class="form-check-input" type="checkbox" value="Beach" id="BeachCheck">
                <label class="form-check-label" for="BeachCheck">
                    Beach
                </label>
            </div>
        </div>
        <button type="submit"
                class="w-100 btn btn-primary">Add</button>

    </form>

</div>

<footer class="my-5 pt-5 text-body-secondary text-center text-small">

</footer>
</body>
</html>