<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Plan"%>
<%@page import="Modelo.Membresia"%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>
            FitCimm - Planes y Membresías
        </title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">


        <style>


            body{

                background:#eef3f8;
                font-family:'Segoe UI',Arial,sans-serif;

            }



            .contenedor{

                width:950px;
                margin:40px auto;
                background:white;
                padding:35px;
                border-radius:18px;
                box-shadow:0 0 20px rgba(0,0,0,.15);

            }



            .titulo{

                text-align:center;
                color:#0b5394;
                font-weight:bold;
                margin-bottom:35px;

            }



            .card{

                border-radius:15px;
                padding:25px;
                margin-bottom:30px;
                box-shadow:0 5px 15px rgba(0,0,0,.1);

            }



            .card h3{

                color:#0b5394;
                margin-bottom:20px;

            }



            label{

                font-weight:bold;

            }



            .btn-primary{

                background:#0b5394;
                border:none;

            }



            .btn-primary:hover{

                background:#073763;

            }



            .mensaje{

                padding:15px;
                border-radius:10px;
                background:#dff5e1;
                color:#176b22;
                font-weight:bold;
                margin-bottom:25px;

            }



            table{

                width:100%;
                border-collapse:collapse;

            }



            th{

                background:#0b5394;
                color:white;
                padding:12px;

            }



            td{

                padding:10px;
                border:1px solid #ddd;
                text-align:center;

            }



            tr:nth-child(even){

                background:#f7f7f7;

            }



            .icono{

                font-size:35px;
                color:#0b5394;

            }



            .footer{

                text-align:center;
                margin-top:30px;
                color:#777;

            }


        </style>


    </head>


    <body>



        <div class="contenedor">



            <h1 class="titulo">

                <i class="bi bi-card-checklist"></i>

                Gestión de Planes y Membresías

            </h1>





            <%

                String mensaje = (String) request.getAttribute("mensaje");

                if (mensaje != null) {

            %>


            <div class="mensaje">

                <%=mensaje%>

            </div>


            <%

                }

            %>







            <div class="card">


                <h3>

                    <i class="bi bi-person-plus"></i>

                    Vender / Renovar Membresía

                </h3>



                <form action="MembresiaController" method="post">


                    <input type="hidden" 
                           name="accion"
                           value="vender">



                    <div class="row">



                        <div class="col-md-4">


                            <label>
                                Documento del socio
                            </label>


                            <input type="text"
                                   name="documento"
                                   class="form-control"
                                   placeholder="Ingrese documento"
                                   required>


                        </div>





                        <div class="col-md-4">


                            <label>
                                Seleccionar Plan
                            </label>


                            <select name="idPlan"
                                    class="form-control"
                                    required>



                                <option value="">
                                    Seleccione
                                </option>



                                <%    ArrayList<Plan> planes
                                            = (ArrayList<Plan>) request.getAttribute("planes");

                                    if (planes != null) {

                                        for (Plan p : planes) {


                                %>



                                <option value="<%=p.getIdPlan()%>">

                                    <%=p.getNombre()%>
                                    -
                                    <%=p.getDuracionDias()%> días
                                    -
                                    $<%=p.getValor()%>

                                </option>



                                <%

                                        }

                                    }

                                %>



                            </select>


                        </div>







                        <div class="col-md-4">


                            <label>
                                Fecha inicio
                            </label>


                            <input type="date"
                                   name="fechaInicio"
                                   class="form-control"
                                   required>


                        </div>



                    </div>



                    <br>



                    <button class="btn btn-primary">

                        <i class="bi bi-check-circle"></i>

                        Guardar Membresía

                    </button>



                </form>


            </div>









            <div class="card">


                <h3>

                    <i class="bi bi-calendar-event"></i>

                    Membresías próximas a vencer

                </h3>




                <form action="MembresiaController" method="post">


                    <input type="hidden"
                           name="accion"
                           value="vencimientos">



                    <button class="btn btn-primary">

                        Consultar vencimientos

                    </button>



                </form>



                <%    ArrayList<Membresia> lista
                            = (ArrayList<Membresia>) request.getAttribute("listaVencimientos");

                    if (lista != null) {

                %>

                <br>

                <table class="table table-bordered table-hover">

                    <thead class="table-primary">

                        <tr>

                            <th>ID</th>
                            <th>Documento</th>
                            <th>Socio</th>
                            <th>Plan</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Valor Pagado</th>

                        </tr>

                    </thead>

                    <tbody>

                        <%        for (Membresia m : lista) {

                        %>

                        <tr>

                            <td><%=m.getIdMembresia()%></td>

                            <td><%=m.getDocumento()%></td>

                            <td><%=m.getNombreSocio()%></td>

                            <td><%=m.getNombrePlan()%></td>

                            <td><%=m.getFechaInicio()%></td>

                            <td><%=m.getFechaFin()%></td>

                            <td>$ <%=String.format("%,.0f", m.getValorPagado())%></td>

                        </tr>

                        <%

                            }

                        %>

                    </tbody>

                </table>

                <%} else {

                %>

                <div class="alert alert-warning mt-3">

                    No existen membresías que venzan en los próximos 5 días.

                </div>

                <%    }

                %>




            </div>






            <div class="footer">

                Sistema de Gestión Gimnasio FitCimm © 2026

            </div>



        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>

</html>