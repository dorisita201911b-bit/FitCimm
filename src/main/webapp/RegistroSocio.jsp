<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<script>
    alert("<%= error %>");
</script>
<%
}
%>

<%
String mensaje = (String) request.getAttribute("mensaje");
if (mensaje != null) {
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
    <title>FitCimm | Registrar Nuevo Socio</title>

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

        /* Botón con el azul cyan neón exacto */
        .btn-cyan {
            background-color: #28A7E0;
            color: #04101e;
            box-shadow: 0 0 12px rgba(40, 167, 224, 0.4);
        }
        .btn-cyan:hover {
            background-color: #00A3E0;
            box-shadow: 0 0 18px rgba(0, 163, 224, 0.65);
        }

        /* Estilo de los Inputs completamente oscuros */
        .input-fit {
            background-color: #051322 !important;
            border: 1px solid rgba(40, 167, 224, 0.4);
            color: #ffffff !important;
        }
        .input-fit:focus {
            background-color: #051322 !important;
            border-color: #28A7E0;
            box-shadow: 0 0 8px rgba(40, 167, 224, 0.3);
            outline: none;
            color: #ffffff !important;
        }
        /* Mantiene el fondo oscuro incluso si el navegador autocompleta el campo */
        .input-fit:-webkit-autofill,
        .input-fit:-webkit-autofill:hover, 
        .input-fit:-webkit-autofill:focus {
            -webkit-text-fill-color: #ffffff !important;
            -webkit-box-shadow: 0 0 0px 1000px #051322 inset !important;
            transition: background-color 5000s ease-in-out 0s;
        }
        /* Color claro para la marca de tiempo en el campo date */
        .input-fit::-webkit-calendar-picker-indicator {
            filter: invert(1);
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

        <!-- Contenido Principal -->
        <main class="flex-grow w-full max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

            <!-- Encabezado de la Sección -->
            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-8 gap-4">
                <div>
                    <div class="flex items-center gap-2 text-cyan-fit font-semibold text-sm uppercase tracking-widest mb-1">
                        <span class="material-symbols-outlined text-lg">person_add</span>
                        Módulo de Socios
                    </div>
                    <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                        Registrar Nuevo <span class="text-cyan-fit">Socio</span>
                    </h1>
                    <p class="text-slate-300 text-sm mt-1">Completa la información personal del usuario para darlo de alta en el sistema.</p>
                </div>
                
                <div>
                    <a href="SocioController?accion=listar" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-xl border border-cyan-fit/40 transition-all duration-300 text-sm">
                        <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                        <span>Volver a inicio</span>
                    </a>
                </div>
            </div>

            <!-- Tarjeta del Formulario -->
            <div class="fit-card rounded-2xl shadow-2xl overflow-hidden">
                
                <!-- Card Header -->
                <div class="px-6 py-5 bg-[#050f1d] border-b border-cyan-fit/30 flex items-center justify-between">
                    <h2 class="text-lg font-bold text-white flex items-center gap-2">
                        <span class="material-symbols-outlined text-cyan-fit">badge</span>
                        Datos Personales
                    </h2>
                    <span class="text-xs text-slate-300 bg-[#051322] px-3 py-1 rounded-full border border-cyan-fit/30">
                        Los campos con <span class="text-rose-400 font-bold">*</span> son obligatorios
                    </span>
                </div>

                <!-- Formulario -->
                <div class="p-6 sm:p-8">
                    <form action="SocioController" method="POST">
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            
                            <!-- Documento de Identidad -->
                            <div>
                                <label for="documento" class="block text-sm font-semibold text-slate-200 mb-2">
                                    Número de Documento / Cédula <span class="text-rose-400">*</span>
                                </label>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-cyan-fit text-xl">badge</span>
                                    <input type="text" 
                                           id="documento" 
                                           name="documento" 
                                           placeholder="Ej: 1012345678" 
                                           required 
                                           class="w-full input-fit rounded-xl pl-11 pr-4 py-3 text-sm placeholder-slate-400 transition-all">
                                </div>
                            </div>

                            <!-- Fecha de Nacimiento -->
                            <div>
                                <label for="fechaNacimiento" class="block text-sm font-semibold text-slate-200 mb-2">
                                    Fecha de Nacimiento <span class="text-rose-400">*</span>
                                </label>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-cyan-fit text-xl">calendar_today</span>
                                    <input type="date" 
                                           id="fechaNacimiento" 
                                           name="fechanacimiento" 
                                           required 
                                           class="w-full input-fit rounded-xl pl-11 pr-4 py-3 text-sm placeholder-slate-400 transition-all">
                                </div>
                            </div>

                            <!-- Nombre -->
                            <div>
                                <label for="nombre" class="block text-sm font-semibold text-slate-200 mb-2">
                                    Nombre <span class="text-rose-400">*</span>
                                </label>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-cyan-fit text-xl">person</span>
                                    <input type="text" 
                                           id="nombre" 
                                           name="nombre" 
                                           placeholder="Ej: Carlos" 
                                           required 
                                           class="w-full input-fit rounded-xl pl-11 pr-4 py-3 text-sm placeholder-slate-400 transition-all">
                                </div>
                            </div>

                            <!-- Apellido -->
                            <div>
                                <label for="apellido" class="block text-sm font-semibold text-slate-200 mb-2">
                                    Apellido <span class="text-rose-400">*</span>
                                </label>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-cyan-fit text-xl">person</span>
                                    <input type="text" 
                                           id="apellido" 
                                           name="apellido" 
                                           placeholder="Ej: Rodríguez" 
                                           required 
                                           class="w-full input-fit rounded-xl pl-11 pr-4 py-3 text-sm placeholder-slate-400 transition-all">
                                </div>
                            </div>

                            <!-- Teléfono -->
                            <div>
                                <label for="telefono" class="block text-sm font-semibold text-slate-200 mb-2">
                                    Teléfono / Celular <span class="text-rose-400">*</span>
                                </label>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-cyan-fit text-xl">call</span>
                                    <input type="tel" 
                                           id="telefono" 
                                           name="telefono" 
                                           placeholder="Ej: 3001234567" 
                                           required 
                                           class="w-full input-fit rounded-xl pl-11 pr-4 py-3 text-sm placeholder-slate-400 transition-all">
                                </div>
                            </div>

                            <!-- Correo Electrónico -->
                            <div>
                                <label for="correo" class="block text-sm font-semibold text-slate-200 mb-2">
                                    Correo Electrónico <span class="text-rose-400">*</span>
                                </label>
                                <div class="relative">
                                    <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-cyan-fit text-xl">mail</span>
                                    <input type="email" 
                                           id="correo" 
                                           name="correo" 
                                           placeholder="ejemplo@correo.com" 
                                           required 
                                           class="w-full input-fit rounded-xl pl-11 pr-4 py-3 text-sm placeholder-slate-400 transition-all">
                                </div>
                            </div>

                        </div>

                        <!-- Botones de Acción -->
                        <div class="flex flex-col-reverse sm:flex-row items-center justify-end gap-3 mt-8 pt-6 border-t border-cyan-fit/20">
                            <a href="SocioController?accion=listar" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-300 font-semibold py-3 px-6 rounded-xl border border-slate-700 transition-all duration-300 text-sm">
                                <span class="material-symbols-outlined text-lg">cancel</span>
                                <span>Cancelar</span>
                            </a>
                            <button type="submit" 
                                    name="accion" 
                                    value="registrar" 
                                    class="w-full sm:w-auto inline-flex items-center justify-center gap-2 btn-cyan font-bold py-3 px-8 rounded-xl transition-all duration-300 text-sm">
                                <span class="material-symbols-outlined text-xl">check_circle</span>
                                <span>Guardar Socio</span>
                            </button>
                        </div>

                    </form>
                </div>
            </div>

        </main>
    </div>

</body>
</html>
