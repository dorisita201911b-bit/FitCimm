<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Plan"%>

<%
    Plan plan = (Plan) request.getAttribute("plan");
    String mensaje = request.getParameter("mensaje");

    if ("actualizado".equals(mensaje)) {
%>
<script>
    alert("¡El plan se actualizó correctamente!");
</script>
<%
    }
%>
<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FitCimm | Editar Plan</title>

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

        /* Inputs oscuros estilo cápsula neón */
        input.fit-input-dark {
            background-color: #050e1d !important;
            border: 1px solid rgba(100, 116, 139, 0.4) !important;
            color: #ffffff !important;
            border-radius: 9999px !important; /* Totalmente redondeado */
            transition: all 0.3s ease;
        }
        
        input.fit-input-dark::placeholder {
            color: #64748b !important;
        }

        input.fit-input-dark:focus {
            outline: none !important;
            border-color: #00A3E0 !important;
            box-shadow: 0 0 12px rgba(0, 163, 224, 0.35) !important;
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
        <img alt="Gym Background" class="w-full h-full object-cover scale-105" src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2000&auto=format&fit=crop"/>
        <div class="absolute inset-0 overlay-dark"></div>
    </div>

    <!-- Wrapper Principal -->
    <div class="relative z-10 flex flex-col min-h-screen">
        
        <!-- Componente de Encabezado/Navegación Incluido -->

        <!-- Contenido de la Página -->
        <main class="flex-grow w-full max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

            <!-- Encabezado de la Sección -->
            <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8 gap-4">
                <div>
                    <div class="flex items-center gap-2 text-amber-400 font-semibold text-sm uppercase tracking-widest mb-1">
                        <span class="material-symbols-outlined text-lg">edit_note</span>
                        Gestión de Suscripciones
                    </div>
                    <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                        Editar Datos del <span class="text-cyan-fit">Plan</span>
                    </h1>
                    <p class="text-slate-300 text-sm mt-1">Consulta y actualiza la información de las membresías ofrecidas en el establecimiento.</p>
                </div>
                
                <a href="PlanController?accion=listaPlan" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-full border border-cyan-fit/40 transition-all duration-300 text-sm self-start md:self-auto">
                    <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                    <span>Volver a Planes</span>
                </a>
            </div>

            <!-- Búsqueda Rápida de Plan -->
            <div class="fit-card rounded-2xl p-4 mb-8">
                <form action="PlanController" method="GET" class="flex flex-col sm:flex-row gap-3">
                    <input type="hidden" name="accion" value="buscar">
                    <div class="relative flex-grow">
                        <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">search</span>
                        <input type="text" name="criterio" class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" placeholder="Buscar por ID o nombre de plan para cargar datos..." value="<%= plan != null ? plan.getIdPlan() : "" %>"/>
                    </div>
                    <button type="submit" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-cyan-fit font-semibold px-6 py-3 rounded-full border border-cyan-fit/50 transition-all duration-300 text-sm whitespace-nowrap">
                        <span class="material-symbols-outlined text-lg">sync</span>
                        <span>Cargar Plan</span>
                    </button>
                </form>
            </div>

            <!-- Formulario Principal de Edición -->
            <form action="PlanController" method="POST">
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="id" value="<%= plan != null ? plan.getIdPlan() : "" %>">

                <div class="fit-card rounded-2xl p-6 md:p-8 shadow-2xl">
                    
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">

                        <!-- Nombre del Plan -->
                        <div class="md:col-span-3">
                            <label for="nombre" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Nombre del Plan <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">card_membership</span>
                                <input type="text" id="nombre" name="nombre" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" placeholder="Ej. Plan Trimestral VIP" value="<%= plan != null ? plan.getNombre(): "" %>"/>
                            </div>
                        </div>

                        <!-- Duración (Días) -->
                        <div class="md:col-span-1">
                            <label for="duracionDias" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Duración (Días) <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">schedule</span>
                                <input type="number" id="duracionDias" name="duracionDias" min="1" max="365" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" placeholder="30" value="<%= plan != null ? plan.getDuracionDias() : "" %>"/>
                            </div>
                        </div>

                        <!-- Valor / Precio -->
                        <div class="md:col-span-2">
                            <label for="valor" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Valor del Plan ($) <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">payments</span>
                                <input type="number" id="valor" name="valor" min="1" step="0.01" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" placeholder="50000" value="<%= plan != null ? plan.getValor() : "" %>"/>
                            </div>
                        </div>

                    </div>

                    <!-- Botones de Acción -->
                    <div class="flex flex-col sm:flex-row items-center justify-end gap-3 pt-6 border-t border-cyan-fit/20">
                        <a href="PlanController?accion=listaPlan" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-300 px-6 py-3 rounded-full border border-slate-700 transition-all duration-300 text-sm font-semibold">
                            <span class="material-symbols-outlined text-lg">cancel</span>
                            <span>Cancelar</span>
                        </a>
                        <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 btn-cyan px-8 py-3 rounded-full font-bold transition-all duration-300 text-sm">
                            <span class="material-symbols-outlined text-lg">save</span>
                            <span>Guardar Cambios</span>
                        </button>
                    </div>

                </div>
            </form>

        </main>
    </div>

</body>
</html>