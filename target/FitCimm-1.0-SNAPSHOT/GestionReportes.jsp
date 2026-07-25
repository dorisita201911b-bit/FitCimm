<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Reporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reportes Gimnasio</title>
        
        <!-- Bootstrap 5 CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body class="bg-light">
            


        <!-- ENCABEZADO / NAVBAR -->
        <nav class="navbar navbar-dark bg-dark shadow-sm">
            <div class="container">
                <span class="navbar-brand mb-0 h1 fs-3">
                    <i class="bi bi-bar-chart-fill text-primary"></i> Reportes del Gimnasio
                </span>
            </div>
        </nav>

        <div class="container py-5">

            <!-- ============================= -->
            <!-- RF-15 -->
            <!-- ============================= -->
            <div class="card shadow-sm border-0 mb-4 rounded-4">
                <div class="card-body p-4">
                    <h3 class="card-title text-primary mb-4">
                        <i class="bi bi-people-fill"></i> Socios activos con membresía vigente
                    </h3>

                    <form action="ReporteController" method="post" class="mb-4">
                        <input type="hidden" name="accion" value="sociosActivos">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-search"></i> Consultar socios
                        </button>
                    </form>

                    <%
                        ArrayList<Reporte> socios = (ArrayList<Reporte>) request.getAttribute("socios");
                        if (socios != null) {
                    %>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Plan</th>
                                    <th>Vence</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Reporte r : socios) { %>
                                <tr>
                                    <td><%=r.getDocumento()%></td>
                                    <td><%=r.getNombres()%></td>
                                    <td><%=r.getApellidos()%></td>
                                    <td><span class="badge bg-secondary"><%=r.getNombrePlan()%></span></td>
                                    <td><%=r.getFechaFin()%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- ============================= -->
            <!-- RF-16 -->
            <!-- ============================= -->
            <div class="card shadow-sm border-0 mb-4 rounded-4">
                <div class="card-body p-4">
                    <h3 class="card-title text-primary mb-4">
                        <i class="bi bi-cash-stack"></i> Total recaudado por plan
                    </h3>

                    <form action="ReporteController" method="post" class="row g-3 align-items-end mb-4">
                        <input type="hidden" name="accion" value="recaudo">
                        
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Desde:</label>
                            <input type="date" name="inicio" class="form-control" required>
                        </div>
                        
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Hasta:</label>
                            <input type="date" name="fin" class="form-control" required>
                        </div>
                        
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="bi bi-filter"></i> Consultar recaudo
                            </button>
                        </div>
                    </form>

                    <%
                        ArrayList<Reporte> recaudo = (ArrayList<Reporte>) request.getAttribute("recaudo");
                        if (recaudo != null) {
                    %>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>Plan</th>
                                    <th>Total Recaudado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Reporte r : recaudo) { %>
                                <tr>
                                    <td><%=r.getNombrePlan()%></td>
                                    <td class="fw-bold text-success">$ <%=r.getTotal()%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- ============================= -->
            <!-- RF-17 -->
            <!-- ============================= -->
            <div class="card shadow-sm border-0 mb-4 rounded-4">
                <div class="card-body p-4">
                    <h3 class="card-title text-primary mb-4">
                        <i class="bi bi-trophy-fill"></i> Plan más vendido del mes
                    </h3>

                    <form action="ReporteController" method="post" class="mb-4">
                        <input type="hidden" name="accion" value="planVendido">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-award"></i> Ver plan ganador
                        </button>
                    </form>

                    <%
                        Reporte plan = (Reporte) request.getAttribute("planVendido");
                        if (plan != null) {
                    %>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>Plan</th>
                                    <th>Cantidad ventas</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="badge bg-success fs-6"><%=plan.getNombrePlan()%></span></td>
                                    <td><span class="fw-bold"><%=plan.getCantidad()%></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>

        </div>

        <!-- Bootstrap 5 JS Bundle CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>