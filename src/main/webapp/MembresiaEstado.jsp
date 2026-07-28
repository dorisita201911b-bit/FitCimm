<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Membresia"%>
<%@page import="Modelo.EstadoMembresia"%>

<%
String error = (String) request.getAttribute("error");
if(error != null){
%>
<script>
    alert("<%= error %>");
</script>
<%
}
%>

<%
String mensaje = (String) request.getAttribute("mensaje");
if(mensaje != null){
%>
<script>
    alert("<%= mensaje %>");
</script>
<%
}
%>

<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FitCimm | Gestión de Membresías</title>

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

            /* Contenedor tipo Tarjeta de FitCimm */
            .fit-card {
                background-color: rgba(10, 25, 47, 0.95);
                border: 1px solid #00A3E0;
                box-shadow: 0 0 15px rgba(0, 163, 224, 0.18);
            }

            /* Tabla oscura estilizada */
            .fit-table th {
                background-color: #051322;
                color: #28A7E0;
                border-bottom: 2px solid rgba(0, 163, 224, 0.3);
                text-transform: uppercase;
                font-size: 0.75rem;
                letter-spacing: 0.05em;
            }

            .fit-table td {
                border-bottom: 1px solid rgba(0, 163, 224, 0.1);
            }

            .fit-table tr:hover td {
                background-color: rgba(40, 167, 224, 0.05);
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
            <img alt="Gym Background" class="w-full h-full object-cover scale-105" src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2000&auto=format&fit=crop"/>
            <div class="absolute inset-0 overlay-dark"></div>
        </div>

        <!-- Wrapper Principal -->
        <div class="relative z-10 flex flex-col min-h-screen">


            <!-- ÁREA DE CONTENIDO -->
            <main class="flex-grow w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

                <!-- Encabezado de la Sección -->
                <div class="flex flex-col sm:flex-row sm:items-center justify-between mb-8 gap-4">
                    <div>
                        <div class="flex items-center gap-2 text-cyan-fit font-semibold text-sm uppercase tracking-widest mb-1">
                            <span class="material-symbols-outlined text-lg">card_membership</span>
                            Módulo Administrativo
                        </div>
                        <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                            Gestión de <span class="text-cyan-fit">Membresías</span>
                        </h1>
                        <p class="text-slate-300 text-sm mt-1">Control de vigencias, estados de pago y suscripciones activas.</p>
                    </div>
                    <div>
                        <a href="PlanController?accion=listaPlanes" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-xl border border-cyan-fit/40 transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                            <span>Volver a inicio</span>
                        </a>
                    </div>
                </div>

                <!-- Contenedor Principal / Tabla -->
                <div class="fit-card rounded-2xl overflow-hidden shadow-2xl">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse fit-table">
                            <thead>
                                <tr>
                                    <th class="py-4 px-6 font-bold">ID Membresía</th>
                                    <th class="py-4 px-6 font-bold">Socio</th>
                                    <th class="py-4 px-6 font-bold">Plan</th>
                                    <th class="py-4 px-6 font-bold">Fecha Inicio</th>
                                    <th class="py-4 px-6 font-bold">Fecha Fin</th>
                                    <th class="py-4 px-6 font-bold">Valor Pagado</th>
                                    <th class="py-4 px-6 font-bold text-center">Estado</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-cyan-fit/10 text-sm">

                                <%
                                    List<Membresia> lista = (List<Membresia>) request.getAttribute("listaMembresias");

                                    if(lista != null && !lista.isEmpty()){
                                        for(Membresia m : lista){
                                %>

                                <tr class="transition-colors duration-150">
                                    <td class="py-4 px-6 font-mono font-bold text-cyan-fit">
                                        #<%= m.getIdMembresia()%>
                                    </td>

                                    <td class="py-4 px-6 font-medium text-slate-200">
                                        <div class="flex items-center gap-2">
                                            <span class="material-symbols-outlined text-slate-400 text-base">person</span>
                                            <span><%= m.getIdSocio() %></span>
                                        </div>
                                    </td>

                                    <td class="py-4 px-6 font-medium text-slate-200">
                                        <div class="flex items-center gap-2">
                                            <span class="material-symbols-outlined text-slate-400 text-base">fitness_center</span>
                                            <span><%= m.getIdPlan() %></span>
                                        </div>
                                    </td>

                                    <td class="py-4 px-6 text-slate-300 whitespace-nowrap">
                                        <%= m.getFechaInicio() %>
                                    </td>

                                    <td class="py-4 px-6 text-slate-300 whitespace-nowrap">
                                        <%= m.getFechaFin() %>
                                    </td>

                                    <td class="py-4 px-6 font-semibold text-emerald-400 whitespace-nowrap">
                                        $ <%= m.getValorPagado() %>
                                    </td>

                                    <td class="py-4 px-6 text-center whitespace-nowrap">
                                        <%
                                            if(m.getEstado() == EstadoMembresia.VIGENTE){
                                        %>
                                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-emerald-500/10 text-emerald-400 border border-emerald-500/30">
                                            <span class="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
                                            VIGENTE
                                        </span>
                                        <%
                                            } else if(m.getEstado() == EstadoMembresia.POR_VENCER){
                                        %>
                                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-amber-500/10 text-amber-400 border border-amber-500/30">
                                            <span class="w-1.5 h-1.5 rounded-full bg-amber-400"></span>
                                            POR VENCER
                                        </span>
                                        <%
                                            } else {
                                        %>
                                        <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-rose-500/10 text-rose-400 border border-rose-500/30">
                                            <span class="w-1.5 h-1.5 rounded-full bg-rose-400"></span>
                                            VENCIDA
                                        </span>
                                        <%
                                            }
                                        %>
                                    </td>
                                </tr>

                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="7" class="py-12 text-center text-slate-400">
                                        <div class="flex flex-col items-center justify-center gap-2">
                                            <span class="material-symbols-outlined text-4xl text-slate-500">folder_open</span>
                                            <p class="text-base font-medium">No hay membresías registradas actualmente.</p>
                                        </div>
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