<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FitCimm - Sistema de Gestión</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f8f9fa;
        }

        /* HEADER */
        .header-custom {
            height: 60px;
            background-color: #212529;
            color: #fff;
            z-index: 1030;
        }

        /* CONTENEDOR PRINCIPAL (SIDEBAR + CONTENIDO) */
        .main-wrapper {
            display: flex;
            flex: 1;
        }

        /* SIDEBAR / MENÚ LATERAL */
        .sidebar {
            width: 250px;
            background-color: #343a40;
            min-height: calc(100vh - 60px);
            transition: all 0.3s;
        }

        .sidebar .nav-link {
            color: #adb5bd;
            padding: 12px 20px;
            font-weight: 500;
            border-radius: 6px;
            margin: 4px 8px;
        }

        .sidebar .nav-link:hover, 
        .sidebar .nav-link.active {
            color: #fff;
            background-color: #0d6efd;
        }

        .sidebar .nav-link i {
            margin-right: 10px;
            font-size: 1.1rem;
        }

        /* ÁREA DE CONTENIDO */
        .content-area {
            flex: 1;
            padding: 25px;
            background-color: #f8f9fa;
        }

        /* Responsive: Ocultar sidebar en pantallas pequeñas */
        @media (max-width: 768px) {
            .main-wrapper {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                min-height: auto;
            }
        }
    </style>
</head>
<body>

    <!-- ========================================== -->
    <!-- 1. HEADER                                  -->
    <!-- ========================================== -->
    <header class="header-custom d-flex align-items-center justify-content-between px-3 shadow-sm">
        <div class="d-flex align-items-center">
            <i class="bi bi-person-arms-up fs-3 text-primary me-2"></i>
            <span class="fs-5 fw-bold text-uppercase tracking-wide">FitCimm</span>
        </div>
        
        <div class="d-flex align-items-center gap-3">
            <span class="d-none d-sm-inline badge bg-success me-2"><i class="bi bi-circle-fill me-1"></i> Sistema Activo</span>
            <div class="dropdown">
                <button class="btn btn-outline-light btn-sm dropdown-toggle d-flex align-items-center gap-2" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-person-circle fs-5"></i> Admin
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i> Configuración</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-box-arrow-right me-2"></i> Cerrar Sesión</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- CONTENEDOR CENTRAL -->
    <div class="main-wrapper">

        <!-- ========================================== -->
        <!-- 2. MENÚ LATERAL (SIDEBAR)                  -->
        <!-- ========================================== -->
        <aside class="sidebar py-3">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a href="menu.jsp?contenido=GestionSocios.jsp" class="nav-link">
                        <i class="bi bi-people-fill"></i> Gestión de Socios
                    </a>
                </li>
                <li class="nav-item">
                    <a href="menu.jsp?contenido=GestionPlanesyMembresia.jsp" class="nav-link">
                        <i class="bi bi-card-checklist"></i> Gestión de Planes y Membresía
                    </a>
                </li>
                <li class="nav-item">
                    <a href="menu.jsp?contenido=GestionIngreso.jsp" class="nav-link">
                        <i class="bi bi-door-open-fill"></i> Gestión de Ingreso
                    </a>
                </li>
                <li class="nav-item">
                    <a href="menu.jsp?contenido=GestionReportes.jsp" class="nav-link">
                        <i class="bi bi-bar-chart-line-fill"></i> Gestión de Reportes
                    </a>
                </li>
            </ul>
        </aside>

        <!-- ========================================== -->
        <!-- 3. ÁREA DE CONTENIDO DINÁMICO              -->
        <!-- ========================================== -->
        <main class="content-area">
            <div class="container-fluid">
                <%
                    String contenido = request.getParameter("contenido");
                    if (contenido != null && !contenido.isEmpty()) {
                %>
                        <jsp:include page="<%= contenido %>" />
                <%
                    } else {
                %>
                        <div class="p-5 mb-4 bg-white rounded-4 shadow-sm border">
                            <div class="container-fluid py-3">
                                <h1 class="display-5 fw-bold text-primary">Bienvenido a FitCimm</h1>
                                <p class="col-md-8 fs-4 text-muted">Selecciona una opción en el menú lateral para gestionar el sistema del gimnasio.</p>
                            </div>
                        </div>
                <%
                    }
                %>
            </div>
        </main>

    </div>

    <!-- Bootstrap 5 JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>