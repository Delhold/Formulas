<%--
  Created by IntelliJ IDEA.
  Estudiantes: Dario Verdezoto y Adrian Lopez
  Materia: Lenguaje de Programacion 2
  Date: 29/5/2024
  Time: 8:13
  Version: JSP 1.0
  To change this template use File | Settings | File Templates.
--%>
<%--Dentro de este tag debe estar lenguaje JAVA
Siempre cada programa debe de tener esto --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MRUV</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            display: inline-block;
            width: calc(100% - 22px);
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>MRUV</h1>
    <form action="Resultado.jsp" method="post">
        <label for="velini">Ingrese la velocidad inicial (m/s)</label>
        <input type="text" id="velini" name="velini" >

        <label for="velfin">Ingrese la velocidad final (m/s)</label>
        <input type="text" id="velfin" name="velfin" >

        <label for="tiempo">Ingrese el tiempo (s)</label>
        <input type="text" id="tiempo" name="tiempo" >

        <label for="distancia">Distancia (m):</label>
        <input type="text" id="distancia" name="distancia">

        <input type="submit" value="Calcular">
    </form>
</div>
</body>
</html>
