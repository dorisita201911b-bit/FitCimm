<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Socio"%>

<%
    Socio socio = (Socio) request.getAttribute("socio");
    String mensaje = request.getParameter("mensaje");

    if ("actualizado".equals(mensaje)) {
%>
<script>
    alert("¡El socio se actualizó correctamente!");
</script>
<%
    }
%>
<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FitCimm | Editar Socio</title>

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
        
        /* Contenedor tipo Tarjeta del ecosistema FitCimm */
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

        /* Inputs deshabilitados / Lectura únicamente */
        input.fit-input-readonly {
            background-color: #040b14 !important;
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            color: #94a3b8 !important;
            border-radius: 9999px !important;
            cursor: not-allowed;
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
        <main class="flex-grow w-full max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

            <!-- Encabezado de la Sección -->
            <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8 gap-4">
                <div>
                    <div class="flex items-center gap-2 text-amber-400 font-semibold text-sm uppercase tracking-widest mb-1">
                        <span class="material-symbols-outlined text-lg">edit_note</span>
                        Gestión de Usuarios
                    </div>
                    <h1 class="text-3xl md:text-4xl font-extrabold text-white tracking-tight drop-shadow-md">
                        Editar Datos del <span class="text-cyan-fit">Socio</span>
                    </h1>
                    <p class="text-slate-300 text-sm mt-1">Consulta y actualiza la información registrada del socio en el sistema.</p>
                </div>
                
                <a href="SocioController?accion=listar" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-200 font-semibold py-2.5 px-5 rounded-full border border-cyan-fit/40 transition-all duration-300 text-sm self-start md:self-auto">
                    <span class="material-symbols-outlined text-lg text-cyan-fit">arrow_back</span>
                    <span>Volver a Socios</span>
                </a>
            </div>

            <!-- Búsqueda Rápida de Socio -->
            <div class="fit-card rounded-2xl p-4 mb-8">
                <form action="SocioController" method="GET" class="flex flex-col sm:flex-row gap-3">
                    <input type="hidden" name="accion" value="buscar">
                    <div class="relative flex-grow">
                        <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">search</span>
                        <input type="text" name="criterio" class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" placeholder="Buscar por número de documento o ID para cargar datos..." value="<%= socio != null ? socio.getDocumento() : "" %>"/>
                    </div>
                    <button type="submit" class="inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-cyan-fit font-semibold px-6 py-3 rounded-full border border-cyan-fit/50 transition-all duration-300 text-sm whitespace-nowrap">
                        <span class="material-symbols-outlined text-lg">sync</span>
                        <span>Cargar Socio</span>
                    </button>
                </form>
            </div>

            <!-- Formulario Principal de Edición -->
            <form action="SocioController" method="POST">
                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="id" value="<%= socio != null ? socio.getIdSocio() : "" %>">
                <input type="hidden" name="activo" value="<%= socio != null ? socio.isActivo() : "true" %>">

                <div class="fit-card rounded-2xl p-6 md:p-8 shadow-2xl">
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <!-- Documento de Identidad (Sólo lectura) -->
                        <div>
                            <label for="documento" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Número de Documento / Cédula
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">badge</span>
                                <input type="text" id="documento" name="documento" readonly class="w-full fit-input-readonly pl-12 pr-4 py-3 text-sm font-semibold" value="<%= socio != null ? socio.getDocumento() : "" %>"/>
                            </div>
                            <p class="text-xs text-slate-400 mt-1 flex items-center gap-1 pl-2">
                                <span class="material-symbols-outlined text-xs">info</span>
                                El número de documento no se puede modificar.
                            </p>
                        </div>

                        <!-- Fecha de Nacimiento -->
                        <div>
                            <label for="fechaNacimiento" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Fecha de Nacimiento <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">calendar_today</span>
                                <input type="date" id="fechaNacimiento" name="fechanacimiento" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" value="<%= socio != null ? socio.getFechaNacimiento() : "" %>"/>
                            </div>
                        </div>

                        <!-- Nombre -->
                        <div>
                            <label for="nombre" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Nombres <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">person</span>
                                <input type="text" id="nombre" name="nombre" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" value="<%= socio != null ? socio.getNombres() : "" %>"/>
                            </div>
                        </div>

                        <!-- Apellidos -->
                        <div>
                            <label for="apellido" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Apellidos <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">person</span>
                                <input type="text" id="apellido" name="apellido" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" value="<%= socio != null ? socio.getApellidos() : "" %>"/>
                            </div>
                        </div>

                        <!-- Teléfono -->
                        <div>
                            <label for="telefono" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Teléfono / Celular <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">call</span>
                                <input type="tel" id="telefono" name="telefono" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" value="<%= socio != null ? socio.getTelefono() : "" %>"/>
                            </div>
                        </div>

                        <!-- Correo Electrónico -->
                        <div>
                            <label for="correo" class="block text-xs font-bold uppercase tracking-wider text-slate-300 mb-2">
                                Correo Electrónico <span class="text-rose-400">*</span>
                            </label>
                            <div class="relative">
                                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-cyan-fit">mail</span>
                                <input type="email" id="correo" name="correo" required class="w-full fit-input-dark pl-12 pr-4 py-3 text-sm" value="<%= socio != null ? socio.getCorreo() : "" %>"/>
                            </div>
                        </div>

                    </div>

                    <!-- Botones de Acción -->
                    <div class="flex flex-col sm:flex-row items-center justify-between gap-4 mt-8 pt-6 border-t border-cyan-fit/20">
                        <a href="SocioController?accion=desactivar&id=<%= socio != null ? socio.getIdSocio() : "" %>" onclick="return confirm('¿Está seguro de cambiar el estado de este socio?');" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 bg-rose-500/10 hover:bg-rose-500/20 text-rose-400 border border-rose-500/30 px-5 py-3 rounded-full transition-all duration-300 text-sm font-semibold">
                            <span class="material-symbols-outlined text-lg">person_off</span>
                            <span>Inactivar Socio</span>
                        </a>

                        <div class="flex items-center gap-3 w-full sm:w-auto">
                            <a href="SocioController?accion=listar" class="flex-1 sm:flex-none inline-flex items-center justify-center gap-2 bg-[#051322] hover:bg-slate-800 text-slate-300 px-6 py-3 rounded-full border border-slate-700 transition-all duration-300 text-sm font-semibold">
                                <span class="material-symbols-outlined text-lg">cancel</span>
                                <span>Cancelar</span>
                            </a>
                            <button type="submit" class="flex-1 sm:flex-none inline-flex items-center justify-center gap-2 btn-cyan px-8 py-3 rounded-full font-bold transition-all duration-300 text-sm">
                                <span class="material-symbols-outlined text-lg">save</span>
                                <span>Guardar Cambios</span>
                            </button>
                        </div>
                    </div>

                </div>
            </form>

        </main>
    </div>

</body>
</html>