<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Plan"%>
<%@page import="java.util.List"%>

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
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>FitCimm | Gestión de Planes</title>

        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

        <!-- Google Fonts: Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>

        <!-- Material Symbols Outlined -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #0c2340;
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24;
            }
            .premium-overlay {
                background: linear-gradient(180deg, rgba(2, 6, 23, 0.40) 0%, rgba(2, 6, 23, 0.75) 100%);
            }
            .glass-card {
                background: rgba(56, 189, 248, 0.08);
                backdrop-filter: blur(14px);
                -webkit-backdrop-filter: blur(14px);
                border: 1px solid rgba(56, 189, 248, 0.3);
            }
            .glass-input {
                background: rgba(15, 23, 42, 0.6);
                border: 1px solid rgba(56, 189, 248, 0.3);
                color: #ffffff;
            }
            .glass-input:focus {
                border-color: #38bdf8;
                outline: none;
                box-shadow: 0 0 10px rgba(56, 189, 248, 0.4);
            }
        </style>

        <script id="tailwind-config">
    tailwind.config = {
        darkMode: "class",
        theme: {
            extend: {
                colors: {
                    "primary": "#38bdf8",
                    "secondary": "#0284c7",
                    "charcoal": "#0c2340"
                }
            }
        }
    }
        </script>
    </head>
    <body class="min-h-screen relative overflow-x-hidden text-slate-100 selection:bg-primary selection:text-slate-950">

        <!-- Fondo de pantalla con overlay -->
        <div class="fixed inset-0 z-0">
            <img alt="Gym Interior"
                 class="w-full h-full object-cover opacity-100 scale-105"
                 src="https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=2000&auto=format&fit=crop"/>
            <div class="absolute inset-0 premium-overlay"></div>
        </div>

        <!-- Layout Wrapper -->
        <div class="relative z-10 flex flex-col min-h-screen">

            <!-- Navbar / Header dinámico (si In.jsp incluye la barra superior) -->

            <!-- Contenido Principal -->
            <main class="flex-grow w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

                <!-- Encabezado de la página -->
                <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8 gap-4">
                    <div>
                        <div class="flex items-center gap-2 text-primary font-semibold text-sm uppercase tracking-widest mb-1">
                            <span class="material-symbols-outlined text-lg">credit_card</span>
                            Módulo de Administración
                        </div>
                        <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                            Gestión de <span class="text-primary">Planes</span>
                        </h1>
                    </div>

                    <button onclick="window.location.href = 'RegistrarPlan.jsp'" 
                            class="inline-flex items-center justify-center gap-2 bg-primary hover:bg-secondary text-slate-950 hover:text-white font-bold py-3 px-6 rounded-xl transition-all duration-300 shadow-[0_0_20px_rgba(56,189,248,0.4)]">
                        <span class="material-symbols-outlined">add_circle</span>
                        <span>Nuevo Plan</span>
                    </button>
                    <button onclick="window.location.href = 'MembresiasController?accion=listaMembresias'" 
                            class="inline-flex items-center justify-center gap-2 bg-primary hover:bg-secondary text-slate-950 hover:text-white font-bold py-3 px-6 rounded-xl transition-all duration-300 shadow-[0_0_20px_rgba(56,189,248,0.4)]">
                        <span class="material-symbols-outlined">add_circle</span>
                        <span>Membresias</span>
                    </button>
                    <div>
                        <a href="menu.jsp" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-xl border border-cyan-fit/40 transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                            <span>Volver a inicio</span>
                        </a>
                    </div>
                </div>

                <!-- Buscador -->
                <div class="glass-card rounded-2xl p-4 mb-6 shadow-xl">
                    <form action="PlanController" method="GET" class="flex flex-col sm:flex-row gap-3">
                        <div class="relative flex-grow">
                            <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                            <input type="text" 
                                   name="txtBuscar"
                                   class="glass-input w-full pl-11 pr-4 py-3 rounded-xl text-sm placeholder-slate-400 transition-all"
                                   placeholder="Buscar plan por nombre o código..."/>
                        </div>
                        <button type="submit" 
                                class="bg-secondary/80 hover:bg-secondary text-white font-semibold px-6 py-3 rounded-xl transition-all duration-300 flex items-center justify-center gap-2 border border-primary/30">
                            <span class="material-symbols-outlined text-sm">search</span>
                            <span>Buscar</span>
                        </button>
                    </form>
                </div>

                <!-- Tabla de Planes -->
                <div class="glass-card rounded-2xl shadow-2xl overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left text-sm text-slate-200">
                            <thead class="bg-slate-900/80 text-primary uppercase text-xs tracking-wider border-b border-primary/20">
                                <tr>
                                    <th scope="col" class="px-6 py-4 font-bold">Nombre del Plan</th>
                                    <th scope="col" class="px-6 py-4 font-bold">Duración (Días)</th>
                                    <th scope="col" class="px-6 py-4 font-bold">Valor</th>
                                    <th scope="col" class="px-6 py-4 font-bold text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-700/50">
                                <%
                                    List<Plan> lista = (List<Plan>) request.getAttribute("listaPlanes");

                                    if (lista != null && !lista.isEmpty()) {
                                        for (Plan plan : lista) {
                                %>
                                <tr class="hover:bg-primary/10 transition-colors duration-200">
                                    <td class="px-6 py-4 font-semibold text-white whitespace-nowrap">
                                        <div class="flex items-center gap-3">
                                            <div class="w-8 h-8 rounded-lg bg-primary/20 border border-primary/40 flex items-center justify-center text-primary">
                                                <span class="material-symbols-outlined text-base">fitness_center</span>
                                            </div>
                                            <%= plan.getNombre()%>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-slate-800 text-slate-300 border border-slate-700">
                                            <%= plan.getDuracionDias()%> días
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 font-bold text-primary whitespace-nowrap">
                                        <%=plan.getValor()%>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-center">
                                        <div class="flex items-center justify-center gap-2">
                                            <!-- Editar -->
                                            <a href="PlanController?accion=editar&id=<%= plan.getIdPlan()%>"
                                               title="Editar Plan"
                                               class="p-2 rounded-lg bg-sky-500/10 text-primary border border-primary/30 hover:bg-primary hover:text-slate-950 transition-all duration-200">
                                                <span class="material-symbols-outlined text-lg block">edit</span>
                                            </a>

                                            <!-- Inactivar -->
                                            <a href="PlanController?accion=inactivar&id=<%= plan.getIdPlan()%>"
                                               title="Inactivar Plan"
                                               onclick="return confirm('¿Desea inactivar este plan?');"
                                               class="p-2 rounded-lg bg-rose-500/10 text-rose-400 border border-rose-500/30 hover:bg-rose-600 hover:text-white transition-all duration-200">
                                                <span class="material-symbols-outlined text-lg block">block</span>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="4" class="px-6 py-12 text-center text-slate-400 font-medium">
                                        <span class="material-symbols-outlined text-4xl mb-2 text-slate-500 block">inbox</span>
                                        No hay planes registrados o disponibles actualmente.
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