<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Plan"%>
<%@page import="Modelo.Membresia"%>

<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>FitCimm - Planes y Membresías</title>

        <!-- Bootstrap 5.3.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Google Fonts: Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #0c2340;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                overflow-x: hidden;
            }

            .premium-overlay {
                background: linear-gradient(180deg, rgba(2, 6, 23, 0.65) 0%, rgba(2, 6, 23, 0.85) 100%);
            }

            .glass-card {
                background: rgba(12, 35, 64, 0.88);
                backdrop-filter: blur(16px);
                -webkit-backdrop-filter: blur(16px);
                border: 1px solid rgba(56, 189, 248, 0.5);
                box-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.6), 0 0 30px -5px rgba(56, 189, 248, 0.3);
                border-radius: 1rem;
                width: 100%;
            }

            .form-control, .form-select {
                background: rgba(15, 23, 42, 0.9);
                border: 1px solid rgba(56, 189, 248, 0.6);
                color: #ffffff;
                font-weight: 500;
                border-radius: 0.5rem;
                padding: 0.75rem 1rem;
            }

            /* Forzar el icono del calendario a color blanco para que sea visible */
            input[type="date"]::-webkit-calendar-picker-indicator {
                filter: invert(1) brightness(2);
                cursor: pointer;
            }

            .form-control:focus, .form-select:focus {
                background: rgba(15, 23, 42, 1);
                border-color: #38bdf8;
                color: #ffffff;
                box-shadow: 0 0 0 0.25rem rgba(56, 189, 248, 0.35);
            }

            .form-control::placeholder {
                color: rgba(255, 255, 255, 0.6);
            }

            .form-select option {
                background-color: #0f172a;
                color: #ffffff;
            }

            label {
                font-weight: 700;
                color: #ffffff;
                margin-bottom: 0.5rem;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.8);
            }

            .btn-primary-custom {
                background: linear-gradient(135deg, #38bdf8 0%, #0284c7 100%);
                border: none;
                color: #0f172a;
                font-weight: 700;
                padding: 0.75rem 1.5rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(56, 189, 248, 0.4);
            }

            .btn-primary-custom:hover {
                filter: brightness(1.15);
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(56, 189, 248, 0.6);
                color: #0f172a;
            }

            .btn-outline-custom {
                background: rgba(15, 23, 42, 0.5);
                border: 2px solid #38bdf8;
                color: #ffffff;
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.8);
            }

            .btn-outline-custom:hover {
                background: rgba(56, 189, 248, 0.3);
                border-color: #38bdf8;
                color: #ffffff;
                transform: translateY(-2px);
            }

            .table-custom {
                background: rgba(15, 23, 42, 0.85);
                color: #ffffff;
                border-radius: 0.5rem;
                overflow: hidden;
            }

            .table-custom th {
                background: rgba(56, 189, 248, 0.4);
                color: #ffffff;
                border-color: rgba(56, 189, 248, 0.3);
                font-weight: 700;
                text-align: center;
                padding: 1rem;
                text-shadow: 0 1px 3px rgba(0, 0, 0, 0.8);
            }

            .table-custom td {
                background: transparent;
                color: #ffffff;
                border-color: rgba(56, 189, 248, 0.2);
                text-align: center;
                padding: 0.85rem;
                vertical-align: middle;
                font-weight: 500;
            }

            .table-custom tbody tr:hover {
                background: rgba(56, 189, 248, 0.2);
            }

            .mensaje {
                background: rgba(25, 135, 84, 0.35);
                border-left: 5px solid #198754;
                color: #ffffff;
                padding: 1rem;
                border-radius: 0.5rem;
                margin-top: 1rem;
                margin-bottom: 1rem;
                font-weight: 600;
                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.8);
            }

            hr {
                border-color: rgba(56, 189, 248, 0.4);
                margin: 2rem 0;
            }
        </style>
    </head>
    <body>
        <!-- Fondo de pantalla con overlay optimizado -->
        <main class="fixed inset-0 z-0" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 0;">
            <img alt="Gym Interior" class="w-full h-full object-cover scale-105" src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2000&auto=format&fit=crop" style="width: 100%; height: 100%; object-fit: cover;">
            <div class="absolute inset-0 premium-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></div>
        </main>

        <!-- Tarjeta principal con el ancho amplio optimizado -->
        <main class="relative z-10 w-full mx-auto px-4 py-8" style="max-width: 1150px;">
            <div class="glass-card p-4 md:p-5">
                
                <!-- Botón para regresar al menú -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <a href="menu.jsp" class="btn btn-outline-custom d-inline-flex align-items-center gap-2">
                        <i class="bi bi-arrow-left"></i> Volver al Menú
                    </a>                
                </div>

                <h1 class="text-center text-white fw-extrabold mb-4 display-6" style="text-shadow: 0 2px 8px rgba(0,0,0,0.9);">
                    <i class="bi bi-card-checklist text-info"></i> <span class="text-info">Gestión de Planes y Membresías</span>
                </h1>

                <%
                    String mensaje = (String) request.getAttribute("mensaje");
                    if (mensaje != null) {
                %>
                <div class="mensaje">
                    <i class="bi bi-check-circle-fill me-2"></i> <%=mensaje%>
                </div>
                <%
                    }
                %>

                <!-- Sección de Venta / Renovación de Membresía -->
                <div class="mb-4">
                    <h2 class="h5 text-info fw-bold mb-3" style="text-shadow: 0 2px 4px rgba(0,0,0,0.8);">
                        <i class="bi bi-person-plus me-2"></i> Vender / Renovar Membresía
                    </h2>
                    
                    <form action="MembresiaController" method="post">
                        <input type="hidden" name="accion" value="vender">

                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Documento del socio:</label>
                                <input type="text" name="documento" class="form-control" placeholder="Ingrese documento" required>
                            </div>

                            <div class="col-md-4">
                                <label class="form-label">Seleccionar Plan:</label>
                                <select name="idPlan" class="form-select" required>
                                    <option value="">Seleccione un plan</option>
                                    <% 
                                        ArrayList<Plan> planes = (ArrayList<Plan>) request.getAttribute("planes");
                                        if (planes != null) {
                                            for (Plan p : planes) {
                                    %>
                                    <option value="<%=p.getIdPlan()%>">
                                        <%=p.getNombre()%> - <%=p.getDuracionDias()%> días - $<%=p.getValor()%>
                                    </option>
                                    <% 
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label class="form-label">Fecha inicio:</label>
                                <input type="date" name="fechaInicio" class="form-control" required>
                            </div>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary-custom d-flex align-items-center gap-2">
                                <i class="bi bi-check-circle"></i> Guardar Membresía
                            </button>
                        </div>
                    </form>
                </div>

                <hr>

                <!-- Sección de Vencimientos -->
                <div class="mb-4">
                    <h2 class="h5 text-info fw-bold mb-3" style="text-shadow: 0 2px 4px rgba(0,0,0,0.8);">
                        <i class="bi bi-calendar-event me-2"></i> Membresías próximas a vencer
                    </h2>

                    <form action="MembresiaController" method="post" class="mb-3">
                        <input type="hidden" name="accion" value="vencimientos">
                        <button type="submit" class="btn btn-primary-custom d-flex align-items-center gap-2">
                            <i class="bi bi-search"></i> Consultar vencimientos
                        </button>
                    </form>

                    <% 
                        ArrayList<Membresia> lista = (ArrayList<Membresia>) request.getAttribute("listaVencimientos");
                        if (lista != null) {
                            if (lista.size() > 0) {
                    %>
                    <div class="table-responsive mt-3">
                        <table class="table table-custom mb-0">
                            <thead>
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
                                <% for (Membresia m : lista) { %>
                                <tr>
                                    <td><%=m.getIdMembresia()%></td>
                                    <td><%=m.getDocumento()%></td>
                                    <td class="fw-semibold text-white"><%=m.getNombreSocio()%></td>
                                    <td><%=m.getNombrePlan()%></td>
                                    <td><%=m.getFechaInicio()%></td>
                                    <td><%=m.getFechaFin()%></td>
                                    <td class="text-info fw-bold">$ <%=String.format("%,.0f", m.getValorPagado())%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% 
                            } else {
                    %>
                    <div class="alert alert-warning mt-3 border-0 bg-warning text-dark fw-bold shadow">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i> No existen membresías que venzan en los próximos 5 días.
                    </div>
                    <% 
                            }
                        } 
                    %>
                </div>

                <!-- Footer -->
                <div class="text-center mt-4 text-white small fw-semibold" style="text-shadow: 0 1px 3px rgba(0,0,0,0.8);">
                    Sistema de Gestión Gimnasio - FitCimm &copy; 2026
                </div>

            </div>
        </main>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>