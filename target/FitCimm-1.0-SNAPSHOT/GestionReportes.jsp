<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Reporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reportes Gimnasio - FitCimm</title>

        <!-- Bootstrap 5 CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- Google Fonts: Montserrat & Plus Jakarta Sans -->
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <style>
            :root {
                --bg-primary: #070f1a;
                --accent-cyan: #38bdf8;
                --accent-cyan-hover: #0ea5e9;
                --glass-bg: rgba(13, 27, 48, 0.75);
                --glass-border: rgba(56, 189, 248, 0.25);
            }

            body {
                font-family: 'Plus Jakarta Sans', 'Montserrat', sans-serif;
                background-color: var(--bg-primary);
                min-height: 100vh;
                overflow-x: hidden;
                color: #f8fafc;
            }

            /* Fondo con imagen y gradiente envolvente */
            .bg-wrapper {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 0;
            }

            .bg-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transform: scale(1.05);
                filter: brightness(0.4);
            }

            .premium-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: radial-gradient(circle at 50% 20%, rgba(14, 116, 144, 0.25) 0%, rgba(7, 15, 26, 0.95) 80%);
            }

            /* Tarjetas de diseño Glassmorphism avanzado */
            .glass-card {
                background: var(--glass-bg);
                backdrop-filter: blur(20px);
                -webkit-backdrop-filter: blur(20px);
                border: 1px solid var(--glass-border);
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.7), 0 0 30px rgba(56, 189, 248, 0.08);
                border-radius: 1.25rem;
                padding: 2rem;
                margin-bottom: 1.75rem;
                color: #f8fafc;
                transition: transform 0.3s ease, border-color 0.3s ease;
            }

            .glass-card:hover {
                border-color: rgba(56, 189, 248, 0.45);
            }

            /* Inputs y Selects */
            .form-control, .form-select {
                background: rgba(3, 7, 18, 0.85);
                border: 1px solid rgba(56, 189, 248, 0.3);
                color: #ffffff;
                border-radius: 0.75rem;
                padding: 0.85rem 1rem;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            /* Regla para cambiar el icono del calendario a blanco */
            input[type="date"]::-webkit-calendar-picker-indicator {
                filter: invert(1) brightness(2);
                cursor: pointer;
            }

            .form-control:focus, .form-select:focus {
                background: rgba(3, 7, 18, 0.95);
                border-color: var(--accent-cyan);
                color: #ffffff;
                box-shadow: 0 0 0 4px rgba(56, 189, 248, 0.2);
            }

            .form-control::placeholder {
                color: rgba(255, 255, 255, 0.4);
            }

            label {
                font-weight: 600;
                color: #7dd3fc;
                margin-bottom: 0.5rem;
                font-size: 0.9rem;
                letter-spacing: 0.02em;
            }

            /* Botones personalizados */
            .btn-primary-custom {
                background: linear-gradient(135deg, #38bdf8 0%, #0284c7 100%);
                border: none;
                color: #070f1a;
                font-weight: 700;
                padding: 0.8rem 1.75rem;
                border-radius: 0.75rem;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                box-shadow: 0 4px 15px rgba(56, 189, 248, 0.35);
            }

            .btn-primary-custom:hover {
                background: linear-gradient(135deg, #7dd3fc 0%, #0284c7 100%);
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(56, 189, 248, 0.5);
                color: #070f1a;
            }

            .btn-outline-custom {
                background: rgba(15, 23, 42, 0.4);
                border: 1.5px solid rgba(56, 189, 248, 0.4);
                color: #f8fafc;
                font-weight: 600;
                padding: 0.65rem 1.25rem;
                border-radius: 0.75rem;
                transition: all 0.3s ease;
            }

            .btn-outline-custom:hover {
                background: rgba(56, 189, 248, 0.15);
                border-color: var(--accent-cyan);
                color: #ffffff;
                transform: translateY(-2px);
            }

            /* Tablas estilizadas */
            .table-custom-wrapper {
                border-radius: 0.85rem;
                overflow: hidden;
                border: 1px solid rgba(56, 189, 248, 0.2);
                background: rgba(3, 7, 18, 0.6);
            }

            .table-custom {
                color: #f8fafc;
                margin-bottom: 0;
            }

            .table-custom th {
                background: rgba(14, 116, 144, 0.35);
                color: #38bdf8;
                border-color: rgba(56, 189, 248, 0.2);
                font-weight: 700;
                text-align: center;
                padding: 1rem;
                font-size: 0.9rem;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

            .table-custom td {
                background: transparent;
                color: #e2e8f0;
                border-color: rgba(56, 189, 248, 0.1);
                text-align: center;
                padding: 1rem;
                vertical-align: middle;
                font-weight: 500;
            }

            .table-custom tbody tr {
                transition: background-color 0.2s ease;
            }

            .table-custom tbody tr:hover {
                background: rgba(56, 189, 248, 0.08);
            }

            /* Títulos de sección */
            .section-title {
                color: #38bdf8 !important;
                font-weight: 800 !important;
                font-size: 1.25rem;
                letter-spacing: -0.01em;
            }
        </style>
    </head>
    <body>
        <!-- Fondo con overlay -->
        <div class="bg-wrapper">
            <img
                alt="Gym Interior"
                src="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=2000&auto=format&fit=crop">            <div class="premium-overlay"></div>
        </div>

        <main class="position-relative z-10 w-100 max-w-5xl mx-auto px-4 py-5" style="max-width: 1024px;">

            <!-- Barra de navegación superior -->
            <div class="glass-card d-flex justify-content-between align-items-center py-3 px-4 mb-4">
                <a href="menu.jsp" class="btn btn-outline-custom d-inline-flex align-items-center gap-2">
                    <i class="bi bi-arrow-left"></i> Volver al Menú
                </a>
                <div class="d-flex align-items-center gap-2">
                    <div class="bg-info bg-opacity-10 p-2 rounded-3 text-info">
                        <i class="bi bi-bar-chart-fill fs-5"></i>
                    </div>
                    <span class="h4 text-white mb-0 fw-bold fs-5">Reportes del Gimnasio</span>
                </div>
            </div>

            <!-- ============================= -->
            <!-- RF-15: Socios activos -->
            <!-- ============================= -->
            <div class="glass-card">
                <div class="card-body p-0">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
                        <h3 class="section-title mb-0">
                            <i class="bi bi-people-fill me-2 text-info"></i> Socios activos con membresía vigente
                        </h3>
                        <form action="ReporteController" method="post" class="mb-0">
                            <input type="hidden" name="accion" value="sociosActivos">
                            <button type="submit" class="btn btn-primary-custom d-inline-flex align-items-center gap-2">
                                <i class="bi bi-search"></i> Consultar socios
                            </button>
                        </form>
                    </div>

                    <%
                        ArrayList<Reporte> socios = (ArrayList<Reporte>) request.getAttribute("socios");
                        if (socios != null) {
                    %>
                    <div class="table-responsive table-custom-wrapper mt-3">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Plan</th>
                                    <th>Vence</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Reporte r : socios) {%>
                                <tr>
                                    <td class="fw-semibold text-info"><%=r.getDocumento()%></td>
                                    <td class="text-white fw-semibold"><%=r.getNombres()%></td>
                                    <td class="text-white fw-semibold"><%=r.getApellidos()%></td>
                                    <td><span class="badge bg-info bg-opacity-25 text-info border border-info border-opacity-25 fw-semibold px-3 py-1.5 rounded-pill"><%=r.getNombrePlan()%></span></td>
                                    <td class="fw-semibold text-slate-300"><%=r.getFechaFin()%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- ============================= -->
            <!-- RF-16: Total recaudado por plan -->
            <!-- ============================= -->
            <div class="glass-card">
                <div class="card-body p-0">
                    <h3 class="section-title mb-4">
                        <i class="bi bi-cash-stack me-2 text-info"></i> Total recaudado por plan
                    </h3>

                    <form action="ReporteController" method="post" class="row g-3 align-items-end mb-4">
                        <input type="hidden" name="accion" value="recaudo">

                        <div class="col-md-4">
                            <label class="form-label">Desde:</label>
                            <input type="date" name="inicio" class="form-control" required>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Hasta:</label>
                            <input type="date" name="fin" class="form-control" required>
                        </div>

                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary-custom w-100 d-inline-flex align-items-center justify-content-center gap-2">
                                <i class="bi bi-filter"></i> Consultar recaudo
                            </button>
                        </div>
                    </form>

                    <%
                        ArrayList<Reporte> recaudo = (ArrayList<Reporte>) request.getAttribute("recaudo");
                        if (recaudo != null) {
                    %>
                    <div class="table-responsive table-custom-wrapper mt-3">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>
                                    <th>Plan</th>
                                    <th>Total Recaudado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Reporte r : recaudo) {%>
                                <tr>
                                    <td class="text-white fw-semibold"><%=r.getNombrePlan()%></td>
                                    <td class="fw-bold text-success fs-5">$ <%=r.getTotal()%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- ============================= -->
            <!-- RF-17: Plan más vendido del mes -->
            <!-- ============================= -->
            <div class="glass-card mb-0">
                <div class="card-body p-0">
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
                        <h3 class="section-title mb-0">
                            <i class="bi bi-trophy-fill me-2 text-warning"></i> Plan más vendido del mes
                        </h3>
                        <form action="ReporteController" method="post" class="mb-0">
                            <input type="hidden" name="accion" value="planVendido">
                            <button type="submit" class="btn btn-primary-custom d-inline-flex align-items-center gap-2">
                                <i class="bi bi-award"></i> Ver plan ganador
                            </button>
                        </form>
                    </div>

                    <%
                        Reporte plan = (Reporte) request.getAttribute("planVendido");
                        if (plan != null) {
                    %>
                    <div class="table-responsive table-custom-wrapper mt-3">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>
                                    <th>Plan</th>
                                    <th>Cantidad ventas</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-25 fs-6 px-3 py-2 fw-bold rounded-pill"><%=plan.getNombrePlan()%></span></td>
                                    <td><span class="fw-bold text-white fs-5"><%=plan.getCantidad()%></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <% }%>
                </div>
            </div>

            <!-- Footer -->
            <div class="text-center mt-5 text-secondary small fw-semibold">
                Sistema de Gestión Gimnasio FitCimm &copy; 2026
            </div>

        </main>

        <!-- Bootstrap 5 JS Bundle CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>