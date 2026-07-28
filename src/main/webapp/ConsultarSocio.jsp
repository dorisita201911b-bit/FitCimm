<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Socio"%>
<%@page import="Modelo.Membresia"%>

<%
    Socio socio = (Socio) request.getAttribute("socio");
    List<Membresia> lista = (List<Membresia>) request.getAttribute("listaMembresias");
%>
<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FitCimm | Detalle del Socio</title>

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

            /* Contenedor tipo Tarjeta de la interfaz */
            .fit-card {
                background-color: rgba(10, 25, 47, 0.95);
                border: 1px solid #00A3E0;
                box-shadow: 0 0 15px rgba(0, 163, 224, 0.18);
            }

            /* Botón con el azul cyan neón */
            .btn-cyan {
                background-color: #28A7E0;
                color: #04101e;
                box-shadow: 0 0 12px rgba(40, 167, 224, 0.4);
            }
            .btn-cyan:hover {
                background-color: #00A3E0;
                box-shadow: 0 0 18px rgba(0, 163, 224, 0.65);
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

                <!-- Encabezado de la Sección -->
                <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8 gap-4">
                    <div>
                        <div class="flex items-center gap-2 text-cyan-fit font-semibold text-sm uppercase tracking-widest mb-1">
                            <span class="material-symbols-outlined text-lg">badge</span>
                            Módulo de Usuarios
                        </div>
                        <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                            Historia de membresias del <span class="text-cyan-fit">Socio</span>
                        </h1>
                        <p class="text-slate-300 text-sm mt-1">Consulta la información general y el histórico de membresías del cliente.</p>
                    </div>

                    <div class="flex flex-wrap items-center gap-3">

                        <a href="SocioController?accion=listar" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-xl border border-cyan-fit/40 transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                            <span>Volver a Lista</span>
                        </a>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">

                    <!-- COLUMNA IZQUIERDA: TARJETA DE PERFIL Y DATOS PERSONALES -->
                    <div class="lg:col-span-4">
                        <div class="fit-card rounded-2xl p-6 shadow-2xl sticky top-6">

                            <!-- Header del perfil avatar + estado -->
                            <div class="flex flex-col items-center text-center pb-6 border-b border-cyan-fit/20">
                                <div class="w-24 h-24 rounded-full bg-cyan-fit/10 border-2 border-cyan-fit flex items-center justify-center text-cyan-fit shadow-[0_0_20px_rgba(40,167,224,0.3)] mb-4">
                                    <span class="material-symbols-outlined text-5xl">person</span>
                                </div>

                                <h2 class="text-xl font-bold text-white mb-1">
                                    <%= socio != null ? socio.getNombres() + " " + socio.getApellidos() : "Socio no encontrado"%>
                                </h2>
                                <span class="text-xs font-mono font-medium text-slate-300 bg-[#051322] px-3 py-1 rounded-md border border-cyan-fit/30 mb-4">
                                    ID: #<%= socio != null ? socio.getIdSocio() : "N/A"%>
                                </span>

                                <!-- Tag de Estado Activo / Inactivo -->
                                <% if (socio != null) { %>
                                <% if (socio.isActivo()) { %>
                                <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold bg-emerald-500/20 text-emerald-300 border border-emerald-500/40">
                                    <span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
                                    Estado: Activo
                                </span>
                                <% } else { %>
                                <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-semibold bg-rose-500/20 text-rose-300 border border-rose-500/40">
                                    <span class="w-2 h-2 rounded-full bg-rose-500"></span>
                                    Estado: Inactivo
                                </span>
                                <% } %>
                                <% }%>
                            </div>

                            <!-- Lista de atributos -->
                            <div class="pt-6 space-y-4 text-sm">
                                <div class="flex items-center justify-between p-3 rounded-xl bg-[#051322] border border-cyan-fit/20">
                                    <span class="text-slate-300 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-cyan-fit text-lg">badge</span>
                                        Documento
                                    </span>
                                    <span class="font-semibold text-white">
                                        <%= socio != null ? socio.getDocumento() : "-"%>
                                    </span>
                                </div>

                                <div class="flex items-center justify-between p-3 rounded-xl bg-[#051322] border border-cyan-fit/20">
                                    <span class="text-slate-300 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-cyan-fit text-lg">cake</span>
                                        Nacimiento
                                    </span>
                                    <span class="font-semibold text-white">
                                        <%= socio != null ? socio.getFechaNacimiento() : "-"%>
                                    </span>
                                </div>

                                <div class="flex items-center justify-between p-3 rounded-xl bg-[#051322] border border-cyan-fit/20">
                                    <span class="text-slate-300 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-cyan-fit text-lg">call</span>
                                        Teléfono
                                    </span>
                                    <span class="font-semibold text-white">
                                        <%= socio != null ? socio.getTelefono() : "-"%>
                                    </span>
                                </div>

                                <div class="flex items-center justify-between p-3 rounded-xl bg-[#051322] border border-cyan-fit/20">
                                    <span class="text-slate-300 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-cyan-fit text-lg">mail</span>
                                        Correo
                                    </span>
                                    <span class="font-semibold text-white text-xs truncate max-w-[160px]" title="<%= socio != null ? socio.getCorreo() : ""%>">
                                        <%= socio != null ? socio.getCorreo() : "-"%>
                                    </span>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- COLUMNA DERECHA: HISTORIAL DE MEMBRESÍAS -->
                    <div class="lg:col-span-8">
                        <div class="fit-card rounded-2xl shadow-2xl overflow-hidden">

                            <!-- Encabezado de la Tarjeta -->
                            <div class="px-6 py-5 bg-[#050f1d] border-b border-cyan-fit/30 flex items-center justify-between">
                                <h3 class="text-lg font-bold text-white flex items-center gap-2">
                                    <span class="material-symbols-outlined text-cyan-fit">history</span>
                                    Historial de Membresías
                                </h3>
                                <span class="text-xs text-slate-300 bg-[#051322] px-3 py-1 rounded-full border border-cyan-fit/30">
                                    <%= lista != null ? lista.size() : 0%> registros
                                </span>
                            </div>

                            <!-- Tabla con Tailwind -->
                            <div class="overflow-x-auto">
                                <table class="w-full text-left text-sm text-slate-200">
                                    <thead class="bg-[#051322] text-cyan-fit uppercase text-xs tracking-wider border-b border-cyan-fit/30">
                                        <tr>
                                            <th scope="col" class="px-6 py-4 font-bold">Nombre Plan</th>
                                            <th scope="col" class="px-6 py-4 font-bold">Fecha Inicio</th>
                                            <th scope="col" class="px-6 py-4 font-bold">Fecha Fin</th>
                                            <th scope="col" class="px-6 py-4 font-bold">Valor Pagado</th>
                                            <th scope="col" class="px-6 py-4 font-bold">Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-cyan-fit/10">
                                        <%
                                            if (lista != null && !lista.isEmpty()) {
                                                for (Membresia m : lista) {
                                        %>
                                        <tr class="hover:bg-cyan-fit/5 transition-colors duration-200">
                                            <td class="px-6 py-4 font-semibold text-white whitespace-nowrap">
                                                <div class="flex items-center gap-2">
                                                    <span class="material-symbols-outlined text-cyan-fit text-base">card_membership</span>
                                                    <%= m.getPlan().getNombre()%>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-slate-300">
                                                <%= m.getFechaInicio()%>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-slate-300">
                                                <%= m.getFechaFin()%>
                                            </td>
                                            <td class="px-6 py-4 font-bold text-cyan-fit whitespace-nowrap">
                                                $<%= m.getValorPagado()%>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-semibold bg-cyan-fit/20 text-cyan-fit border border-cyan-fit/30">
                                                    <%= m.getEstado() != null ? m.getEstado() : "N/A"%>
                                                </span>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <tr>
                                            <td colspan="5" class="px-6 py-12 text-center text-slate-400">
                                                <span class="material-symbols-outlined text-4xl mb-2 text-slate-500 block">folder_off</span>
                                                El socio no cuenta con un historial de membresías registrado.
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>

            </main>
        </div>

    </body>
</html>

