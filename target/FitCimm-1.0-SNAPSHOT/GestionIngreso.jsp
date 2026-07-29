<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Ingreso"%>

<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>FitCimm - Gestión de Ingresos</title>

        <!-- Bootstrap 5.3.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <!-- Google Fonts: Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <!-- Material Symbols -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

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

            /* Tarjeta principal con mayor amplitud forzada */
            .glass-card {
                background: rgba(12, 35, 64, 0.88);
                backdrop-filter: blur(16px);
                -webkit-backdrop-filter: blur(16px);
                border: 1px solid rgba(56, 189, 248, 0.5);
                box-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.6), 0 0 30px -5px rgba(56, 189, 248, 0.3);
                border-radius: 1rem;
                width: 100%;
            }

            .form-control {
                background: rgba(15, 23, 42, 0.9);
                border: 1px solid rgba(56, 189, 248, 0.6);
                color: #ffffff;
                font-weight: 500;
                border-radius: 0.5rem;
                padding: 0.75rem 1rem;
            }

            /* >>> PEGA ESTO AQUÍ MISMO <<< */
            input[type="date"]::-webkit-calendar-picker-indicator {
                filter: invert(1) brightness(2);
                cursor: pointer;
            }


            .form-control:focus {
                background: rgba(15, 23, 42, 1);
                border-color: #38bdf8;
                color: #ffffff;
                box-shadow: 0 0 0 0.25rem rgba(56, 189, 248, 0.35);
            }

            .form-control::placeholder {
                color: rgba(255, 255, 255, 0.6);
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
        <div class="fixed inset-0 z-0" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 0;">
            <img alt="Gym Interior"
                 src="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=2000&auto=format&fit=crop">            <div class="premium-overlay"></div>
            <div class="absolute inset-0 premium-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></div>
        </div>

        <!-- Se amplió el ancho máximo usando max-w-7xl y un style personalizado de 950px -->
        <main class="relative z-10 w-full max-w-7xl mx-auto px-4 py-8" style="max-width: 950px;">
            <div class="glass-card p-4 md:p-5">

                <!-- Botón para regresar al menú -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <a href="menu.jsp" class="btn btn-outline-custom d-inline-flex align-items-center gap-2">
                        <i class="bi bi-arrow-left"></i> Volver al Menú
                    </a>                
                </div>

                <h1 class="text-center text-white fw-extrabold mb-4 display-6" style="text-shadow: 0 2px 8px rgba(0,0,0,0.9);">
                    <span class="text-info">Gestión de Ingresos</span>
                </h1>

                <!-- Formulario de Registro -->
                <div class="mb-4">
                    <h2 class="h5 text-info fw-bold mb-3" style="text-shadow: 0 2px 4px rgba(0,0,0,0.8);">Registrar ingreso</h2>
                    <form action="SocioController" method="post" class="row g-3 align-items-end">
                        <input type="hidden" name="accion" value="ingreso">

                        <div class="col-md-8">
                            <label class="form-label">Documento:</label>
                            <input type="text" 
                                   class="form-control" 
                                   name="documento" 
                                   maxlength="10" 
                                   placeholder="Ingrese número de documento" 
                                   required>
                        </div>

                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary-custom w-100">
                                Registrar Ingreso
                            </button>
                        </div>
                    </form>

                    <%
                        if (request.getAttribute("mensaje") != null) {
                    %>
                    <div class="mensaje">
                        <i class="bi bi-check-circle-fill me-2"></i> <%=request.getAttribute("mensaje")%>
                    </div>
                    <%
                        }
                    %>
                </div>

                <hr>

                <!-- Formulario de Consulta por Fecha -->
                <div class="mb-4">
                    <h2 class="h5 text-info fw-bold mb-3" style="text-shadow: 0 2px 4px rgba(0,0,0,0.8);">Consultar ingresos por fecha</h2>
                    <form action="SocioController" method="post" class="row g-3 align-items-end">
                        <input type="hidden" name="accion" value="consultar">
                        <div class="col-md-8">
                            <label class="form-label">Fecha:</label>
                            <input type="date" class="form-control" name="fecha" required>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary-custom w-100 d-flex align-items-center justify-content-center gap-2">
                                <i class="bi bi-search"></i> Consultar
                            </button>
                        </div>
                    </form>

                    <%
                        ArrayList<Ingreso> lista = (ArrayList<Ingreso>) request.getAttribute("lista");

                        if (lista != null) {
                            if (lista.size() > 0) {
                    %>
                    <div class="table-responsive mt-4">
                        <table class="table table-custom mb-0">
                            <thead>
                                <tr>                                  
                                    <th>Socio</th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Ingreso i : lista) {
                                %>
                                <tr>                                   
                                    <td class="fw-semibold text-white"><%=i.getNombreSocio()%></td>
                                    <td><%=i.getFechaIngreso()%></td>
                                    <td><%=i.getHoraIngreso()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="alert alert-warning mt-3 border-0 bg-warning text-dark fw-bold shadow">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i> No existen ingresos registrados para la fecha seleccionada.
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