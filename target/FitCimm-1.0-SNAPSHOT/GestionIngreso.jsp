<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Ingreso"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FitCimm - Gestión de Ingresos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }

            body{
                background:#eef3f8;
                font-family:Arial, Helvetica, sans-serif;
            }

            .contenedor{

                width:850px;
                margin:40px auto;
                background:white;
                padding:35px;
                border-radius:12px;
                box-shadow:0px 0px 15px rgba(0,0,0,.15);

            }

            h1{

                text-align:center;
                color:#0b5394;
                margin-bottom:30px;

            }

            h2{

                color:#0b5394;
                margin-bottom:15px;

            }

            form{

                margin-bottom:20px;

            }

            label{

                font-weight:bold;

            }

            input[type=text],
            input[type=date]{

                width:250px;
                padding:10px;
                border:1px solid #ccc;
                border-radius:6px;

            }

            button{

                background:#0b5394;
                color:white;
                border:none;
                padding:10px 18px;
                border-radius:6px;
                cursor:pointer;

            }

            button:hover{

                background:#073763;

            }

            hr{

                margin:30px 0;

            }

            .mensaje{

                margin-top:20px;
                padding:15px;
                border-left:5px solid #198754;
                background:#d1f5dd;
                border-radius:6px;

            }

            table{

                width:100%;
                border-collapse:collapse;
                margin-top:20px;

            }

            table th{

                background:#0b5394;
                color:white;
                padding:12px;

            }

            table td{

                border:1px solid #ddd;
                padding:10px;
                text-align:center;

            }

            tr:nth-child(even){

                background:#f5f5f5;

            }

            .footer{

                text-align:center;
                margin-top:30px;
                color:gray;

            }

        </style>

    </head>

    <body>

        <div class="contenedor">

            <h1>🏋️ Gestión de Ingresos</h1>

            <h2>Registrar ingreso</h2>

            <form action="SocioController" method="post">

                <input type="hidden" name="accion" value="registrar">

                <label>Documento:</label>

                <input
                    type="text"
                    name="documento"
                    maxlength="10"
                    required>

                <button type="submit">
                    Registrar Ingreso
                </button>

            </form>

            <%

                if(request.getAttribute("mensaje")!=null){

            %>

            <div class="mensaje">

                <%=request.getAttribute("mensaje")%>

            </div>

            <%

                }

            %>

            <hr>

            <h2>Consultar ingresos por fecha</h2>

            <form action="SocioController" method="post">

                <input type="hidden" name="accion" value="consultar">

                <label>Fecha:</label>

                <input
                    type="date"
                    name="fecha"
                    required>

                <button type="submit">

                    Consultar

                </button>

            </form>

            <%

                ArrayList<Ingreso> lista =
                        (ArrayList<Ingreso>)request.getAttribute("lista");

                if(lista!=null){

                    if(lista.size()>0){

            %>

            <table>

                <tr>

                    <th>ID</th>
                    <th>Socio</th>
                    <th>Fecha</th>
                    <th>Hora</th>

                </tr>

                <%

                    for(Ingreso i:lista){

                %>

                <tr>

                    <td><%=i.getIdIngreso()%></td>
                    <td><%=i.getNombreSocio()%></td>
                    <td><%=i.getFechaIngreso()%></td>
                    <td><%=i.getHoraIngreso()%></td>

                </tr>

                <%

                    }

                %>

            </table>

            <%

                }else{

            %>

            <div class="alert alert-warning mt-3">

                No existen ingresos registrados para la fecha seleccionada.

            </div>

            <%

                    }

                }

            %>

            <div class="footer">

                Sistema de Gestión Gimnasio - FitCimm © 2026

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html>