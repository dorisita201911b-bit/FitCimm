<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.Socio"%>
<%@page import="java.util.List"%>
<h1>ENTRÓ A GESTION SOCIOS</h1>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<script>
    alert("<%= error%>");
</script>
<%
    }
%>

<%
    String mensaje = (String) request.getAttribute("mensaje");
    if (mensaje != null) {
%>
<script>
    alert("<%= mensaje%>");
</script>
<%
    }
%>
<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FitCimm | Gestión de Socios</title>

        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

        <!-- Google Fonts: Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>

        <!-- Material Symbols Outlined -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #08111e;
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24;
            }
            .overlay-dark {
                background: rgba(8, 17, 30, 0.85);
            }

            /* Contenedor tipo Tarjeta de la imagen */
            .fit-card {
                background-color: rgba(10, 25, 47, 0.92);
                border: 1px solid #00A3E0;
                box-shadow: 0 0 15px rgba(0, 163, 224, 0.15);
            }

            /* Botón estilo Azul Cyan de la imagen */
            .btn-cyan {
                background-color: #28A7E0;
                color: #04101e;
                box-shadow: 0 0 12px rgba(40, 167, 224, 0.4);
            }
            .btn-cyan:hover {
                background-color: #00A3E0;
                box-shadow: 0 0 18px rgba(0, 163, 224, 0.6);
            }

            /* Estilos de la Tabla Oscura */
            .table-fit {
                background-color: #0a1829;
                border: 1px solid rgba(40, 167, 224, 0.4);
            }
        </style>

        <script id="tailwind-config">
    tailwind.config = {
        darkMode: "class",
        theme: {
            extend: {
                colors: {
                    "cyan-fit": "#28A7E0",
                    "cyan-glow": "#00A3E0",
                    "navy-dark": "#08111e",
                    "card-bg": "#0a192f"
                }
            }
        }
    }
        </script>
    </head>
    <body class="min-h-screen relative overflow-x-hidden text-slate-100 selection:bg-cyan-fit selection:text-slate-950">

        <!-- Fondo de pantalla con overlay -->
        <div class="fixed inset-0 z-0">
            <img alt="Gym Interior"
                 class="w-full h-full object-cover opacity-100 scale-105"
                 src="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=2000&auto=format&fit=crop"/>
            <div class="absolute inset-0 premium-overlay"></div>
        </div>

        <!-- Wrapper Principal -->
        <div class="relative z-10 flex flex-col min-h-screen">

            <!-- Componente de Encabezado/Navegación Incluido -->

            <!-- Contenido de la Página -->
            <main class="flex-grow w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

                <!-- Encabezado de la Sección y Botón Agregar -->
                <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-8 gap-4">
                    <div>
                        <div class="flex items-center gap-2 text-cyan-fit font-semibold text-sm uppercase tracking-widest mb-1">
                            <span class="material-symbols-outlined text-lg">group</span>
                            Módulo de Administración
                        </div>
                        <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                            Gestión de <span class="text-cyan-fit">Socios</span>
                        </h1>
                        <p class="text-slate-300 text-sm mt-1">Administra las cuentas, membresías e información de tus miembros.</p>
                    </div>

                    <div>
                        <a href="RegistroSocio.jsp" class="inline-flex items-center justify-center gap-2 btn-cyan font-bold py-3 px-6 rounded-xl transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-xl">person_add</span>
                            <span>Nuevo Socio</span>
                        </a>
                    </div>
                    <div>
                        <a href="menu.jsp" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-xl border border-cyan-fit/40 transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                            <span>Volver a inicio</span>
                        </a>
                    </div>
                </div>

                <!-- Buscador -->
                <div class="fit-card rounded-2xl p-4 sm:p-6 mb-8">
                    <form action="SocioController" method="get" class="flex flex-col sm:flex-row gap-3">

                        <input type="hidden" name="accion" value="buscar">

                        <div class="relative flex-grow">
                            <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">
                                search
                            </span>

                            <input
                                type="text"
                                name="buscar"
                                placeholder="Buscar por documento o apellido..."
                                class="w-full bg-[#051322] border border-cyan-fit/40 focus:border-cyan-fit focus:ring-1 focus:ring-cyan-fit rounded-xl pl-11 pr-4 py-3 text-sm text-white placeholder-slate-400 transition-all"
                                required>
                        </div>

                        <button type="submit"
                                class="inline-flex items-center justify-center gap-2 btn-cyan font-bold py-3 px-6 rounded-xl transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-lg">search</span>
                            <span>Buscar</span>
                        </button>

                    </form>
                </div>

                <!-- Métricas rápidas / Indicador de Registros -->
                <%
                    List<Socio> lista = (List<Socio>) request.getAttribute("listaSocios");
                %>
                <div class="flex items-center justify-between mb-4 px-1 text-xs sm:text-sm text-slate-300">
                    <% if (lista == null) { %>
                    <span class="inline-flex items-center gap-2 bg-rose-500/20 text-rose-300 border border-rose-500/40 px-3 py-1.5 rounded-lg font-medium">
                        <span class="material-symbols-outlined text-sm">warning</span> La lista devuelta es NULL
                    </span>
                    <% } else {%>
                    <span class="inline-flex items-center gap-2 bg-[#0a192f] text-slate-200 border border-cyan-fit/30 px-3.5 py-1.5 rounded-lg shadow-sm">
                        <span class="material-symbols-outlined text-sm text-cyan-fit">groups</span>
                    </span>
                    <% } %>
                </div>

                <!-- Tabla de Socios con el color azul claro idéntico a la imagen -->
                <div class="table-fit rounded-2xl shadow-2xl overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left text-sm text-slate-200">
                            <thead class="bg-[#050f1d] text-cyan-fit uppercase text-xs tracking-wider border-b border-cyan-fit/30">
                                <tr>
                                    <th scope="col" class="px-6 py-4 font-bold">Nombre</th>
                                    <th scope="col" class="px-6 py-4 font-bold">Documento</th>
                                    <th scope="col" class="px-6 py-4 font-bold">Teléfono</th>
                                    <th scope="col" class="px-6 py-4 font-bold">Estado</th>
                                    <th scope="col" class="px-6 py-4 font-bold">Membresía</th>
                                    <th scope="col" class="px-6 py-4 font-bold text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-cyan-fit/15 bg-[#0a1829]">
                                <%
                                    if (lista != null && !lista.isEmpty()) {
                                        for (Socio socio : lista) {
                                %>
                                <tr class="hover:bg-cyan-fit/10 transition-colors duration-150">
                                    <!-- Nombre -->
                                    <td class="px-6 py-4 font-medium text-white whitespace-nowrap">
                                        <div class="flex items-center gap-3">
                                            <div class="w-9 h-9 rounded-full bg-cyan-fit/20 border border-cyan-fit/50 flex items-center justify-center text-cyan-fit font-bold text-xs shrink-0">
                                                <%= socio.getNombres() != null && !socio.getNombres().isEmpty() ? socio.getNombres().substring(0, 1).toUpperCase() : "S"%>
                                            </div>
                                            <div>
                                                <div class="font-bold text-white"><%= socio.getNombres()%> <%= socio.getApellidos()%></div>
                                            </div>
                                        </div>
                                    </td>

                                    <!-- Documento -->
                                    <td class="px-6 py-4 whitespace-nowrap font-mono text-slate-300">
                                        <%= socio.getDocumento()%>
                                    </td>

                                    <!-- Teléfono -->
                                    <td class="px-6 py-4 whitespace-nowrap text-slate-300">
                                        <%= socio.getTelefono()%>
                                    </td>

                                    <!-- Estado Activo/Inactivo -->
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <% if (socio.isActivo()) { %>
                                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-emerald-950 text-emerald-300 border border-emerald-500/50">
                                            <span class="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
                                            Activo
                                        </span>
                                        <% } else { %>
                                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-rose-950 text-rose-300 border border-rose-500/50">
                                            <span class="w-1.5 h-1.5 rounded-full bg-rose-500"></span>
                                            Inactivo
                                        </span>
                                        <% } %>
                                    </td>

                                    <!-- Estado Membresía -->
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <% if (socio.getEstadoMembresia() != null) {%>
                                        <span class="inline-flex items-center gap-1 px-3 py-1 rounded-md text-xs font-semibold bg-cyan-fit/15 text-cyan-fit border border-cyan-fit/40">
                                            <span class="material-symbols-outlined text-sm">card_membership</span>
                                            <%= socio.getEstadoMembresia()%>
                                        </span>
                                        <% } else { %>
                                        <span class="inline-flex items-center gap-1 px-3 py-1 rounded-md text-xs font-medium bg-[#050f1d] text-slate-400 border border-slate-700">
                                            Sin membresía
                                        </span>
                                        <% }%>
                                    </td>

                                    <!-- Acciones -->
                                    <td class="px-6 py-4 whitespace-nowrap text-center">
                                        <div class="flex items-center justify-center gap-2">
                                            <!-- Editar -->
                                            <a href="SocioController?accion=editar&id=<%= socio.getIdSocio()%>"
                                               title="Editar socio"
                                               class="p-2 rounded-lg bg-amber-500/20 text-amber-300 hover:bg-amber-500 hover:text-slate-950 border border-amber-500/40 transition-all">
                                                <span class="material-symbols-outlined text-lg block">edit</span>
                                            </a>


                                            <!-- Inactivar -->
                                            <% if (socio.isActivo()) {%>
                                            <a href="SocioController?accion=inactivar&id=<%= socio.getIdSocio()%>"
                                               title="Inactivar socio"
                                               onclick="return confirm('¿Desea inactivar este socio?');"
                                               class="p-2 rounded-lg bg-rose-500/20 text-rose-300 hover:bg-rose-500 hover:text-white border border-rose-500/40 transition-all">
                                                <span class="material-symbols-outlined text-lg block">person_off</span>
                                            </a>



                                            <% } else {%>
                                            <a href="SocioController?accion=activar&id=<%= socio.getIdSocio()%>"
                                               title="Activar socio"
                                               onclick="return confirm('¿Desea activar este socio?');"
                                               class="p-2 rounded-lg bg-emerald-500/20 text-emerald-300 hover:bg-emerald-500 hover:text-white border border-emerald-500/40 transition-all">
                                                <span class="material-symbols-outlined text-lg block">person_check</span>
                                            </a>



                                            <% }%>







                                            <!-- Botón ver -->
                                            <a href="SocioController?accion=detalle&id=<%= socio.getIdSocio()%>"
                                               class="btn btn-primary">
                                                <i class="fa-solid fa-eye"></i>
                                            </a>

                                            <!-- Ver Perfil -->
                                            <a href="SocioController?accion=ver&id=<%= socio.getIdSocio()%>"
                                               title="Ver detalles"
                                               class="p-2 rounded-lg bg-cyan-fit/20 text-cyan-fit hover:bg-cyan-fit hover:text-slate-950 border border-cyan-fit/40 transition-all">
                                                <span class="material-symbols-outlined text-lg block">visibility</span>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6" class="px-6 py-12 text-center text-slate-400 bg-[#0a1829]">
                                        <span class="material-symbols-outlined text-4xl mb-2 text-slate-500 block">group_off</span>
                                        No se encontraron socios registrados en el sistema.
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>

    </body>
</html>

