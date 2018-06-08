<%@ page import="domain.Weather" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Serwis pogodowy</title>
</head>

<body>
<jsp:useBean id="client" class="domain.client.WeatherClient" scope="session"/>

<form method="get">

    <label>Wybierz miasto:</label>
    <label>
        <select name="name">
            <option value="Wroclaw">Wroclaw</option>
            <option value="Poznan">Poznan</option>
            <option value="Lodz">Lodz</option>
            <option value="Katowice">Katowice</option>
            <option value="Warszawa">Warszawa</option>
            <option value="Gdansk">Gdansk</option>
            <option value="Krakow">Krakow</option>
        </select>
    </label>

    <input type="submit" value="Pobierz pogode"/>
</form>


<%
  String name = request.getParameter("name");
  if(name != null) {
    Weather weather = client.getByName(name);
    if(weather != null) {
%>
    <p>
        <%=
        "Miasto: " + name + "<br>" +
        "Poziom zachmurzenia: " + weather.getClouds().getAll() + "<br>" +
        "Temperatura: " + weather.getMain().getTemp() + "<br>" +
        "Cinienie: " + weather.getMain().getPressure() + "<br>" +
        "Predkosc wiatru: " + weather.getWind().getSpeed() 
        %>
    </p>
<%
    }
  }
%>
</body>
</html>