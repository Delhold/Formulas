<%--
  Created by IntelliJ IDEA.
  Estudiante: Dario Verdezoto
  Date: 30/5/2024
  Version: 2.0
  Detalle: Formulas del MRUV
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resultado de la Comparacion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
            line-height: 1.6;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007BFF;
            color: #fff;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Resultados</h1>
    <%
        String veliniStr = request.getParameter("velini");
        String velfinStr = request.getParameter("velfin");
        String tiempoStr = request.getParameter("tiempo");
        String distanciaStr = request.getParameter("distancia");

        //INICIALIZAMOS VARIABLES
        Double velini = null;
        Double velfin = null;
        Double tiempo = null;
        Double distancia = null;

        try {
            //VERIFICAMOS QUE LA VELOCIDAD INICIAL TENGA VALOR O NO ESTE VACIO
            if (veliniStr != null && !veliniStr.isEmpty()) {
                // CONVIERTE EL VALOR DE LA VELOCIDAD INICIAL DE STRING A DOUBLE Y LO ASIGNAMOS
                velini = Double.parseDouble(veliniStr);
            }
            //VERIFICAMOS QUE LA VELOCIDAD FINAL TENGA VALOR O NO ESTE VACIO
            if (velfinStr != null && !velfinStr.isEmpty()) {
                // CONVIERTE EL VALOR DE LA VELOCIDAD FINAL DE STRING A DOUBLE Y LO ASIGNAMOS
                velfin = Double.parseDouble(velfinStr);
            }
            //VERIFICAMOS QUE EL TIEMPO TENGA VALOR O NO ESTE VACIO
            if (tiempoStr != null && !tiempoStr.isEmpty()) {
                // CONVIERTE EL VALOR DEL TIEMPO DE STRING A DOUBLE Y LO ASIGNAMOS
                tiempo = Double.parseDouble(tiempoStr);
            }
            //VERIFICAMOS QUE LA DISTANCIA TENGA VALOR O NO ESTE VACIO
            if (distanciaStr != null && !distanciaStr.isEmpty()) {
                // CONVIERTE EL VALOR DE LA DISTANCIA DE STRING A DOUBLE Y LO ASIGNAMOS
                distancia = Double.parseDouble(distanciaStr);
            }
        } catch (NumberFormatException e) {
            out.println("<p>Por favor, ingrese valores numéricos válidos.</p>");
        }

        //REALIZAMOS LOS CALCULOS SI SE HAN PROPORCIONADO AL MENOS TRES VALORES
        if (velini != null && velfin != null && tiempo != null || distancia != null) {
            //FORMULA PARA CALCULAR LA DISTANCIA RECORRIDA DE UN OBJETO
            if (velini != null && velfin != null && tiempo != null) {
                distancia = ((velini + velfin) / 2) * tiempo;
                //FORMULA PARA CALCULAR EL TIEMPO DE UN OBJETO
            } else if (velini != null && velfin != null && distancia != null) {
                tiempo = (2 * distancia) / (velini + velfin);
                //FORMULA PARA CALCULAR LA VELOCIDAD FINAL DE UN OBJETO
            } else if (velini != null && tiempo != null && distancia != null) {
                velfin = (2 * distancia / tiempo) - velini;
                //FORMULA PARA CALCULAR LA VELOCIDAD INICIAL DE UN OBJETO
            } else if (velfin != null && tiempo != null && distancia != null) {
                velini = (2 * distancia / tiempo) - velfin;
            } else {
                //MANDA UN MENSAJE DE ERROR YA QUE MINIMO SE NECESITA 3 VALORES
                //PARA CALCULAR CUALQUIERA DE ESAS FORMULAS
                out.println("<p>Por favor, ingrese al menos tres valores.</p>");
            }
        } else {
            out.println("<p>Por favor, ingrese al menos tres valores.</p>");
        }
        // Verificar que ninguna variable sea negativa después de los cálculos
        if (velini != null && velini < 0) {
            out.println("<p>La velocidad inicial no puede ser negativa.</p>");
        } else if (velfin != null && velfin < 0) {
            out.println("<p>La velocidad final no puede ser negativa.</p>");
        } else if (tiempo != null && tiempo < 0) {
            out.println("<p>El tiempo no puede ser negativo.</p>");
        } else if (distancia != null && distancia < 0) {
            out.println("<p>La distancia no puede ser negativa.</p>");
        } else {
            // Imprimir resultados si todas las variables son válidas
            if (distancia != null) {
                out.println("<p>La distancia recorrida es: " + distancia + " metros.</p>");
            }
            if (tiempo != null) {
                out.println("<p>El tiempo requerido es: " + tiempo + " segundos.</p>");
            }
            if (velfin != null) {
                out.println("<p>La velocidad final es: " + velfin + " m/s.</p>");
            }
            if (velini != null) {
                out.println("<p>La velocidad inicial es: " + velini + " m/s.</p>");
            }
        }
    %>

    <a href="index.jsp">Volver</a>
</div>
</body>
</html>
