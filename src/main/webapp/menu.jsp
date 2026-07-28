<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="scroll-smooth" lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>FitCimm | Gestión Deportiva SENA</title>
        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <!-- Google Fonts: Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
        <!-- Material Symbols -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #0c2340;
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 24;
            }
            /* Overlay muy sutil y claro para que la nueva imagen de fondo luzca completamente nítida */
            .premium-overlay {
                background: linear-gradient(180deg, rgba(2, 6, 23, 0.15) 0%, rgba(2, 6, 23, 0.35) 100%);
            }
            /* Tarjetas con el mismo tono azul clarito elegante en todas */
            .glass-card {
                background: rgba(56, 189, 248, 0.12);
                backdrop-filter: blur(14px);
                -webkit-backdrop-filter: blur(14px);
                border: 1px solid rgba(56, 189, 248, 0.4);
                transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            }
            .hover-card-trigger:hover .glass-card {
                transform: translateY(-8px) scale(1.01);
                background: rgba(56, 189, 248, 0.22);
                border-color: rgba(56, 189, 248, 0.9);
                box-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.3), 0 0 30px -5px rgba(56, 189, 248, 0.5);
            }
            .bg-kinetic-gradient {
                background: linear-gradient(135deg, #38bdf8 0%, #0284c7 100%);
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
                            "charcoal": "#0c2340",
                            "surface": "#f9f9f9",
                            "on-surface": "#1a1c1c",
                            "on-primary": "#0f172a"
                        },
                        borderRadius: {
                            "DEFAULT": "0.125rem",
                            "lg": "0.25rem",
                            "xl": "1rem",
                            "2xl": "2rem"
                        }
                    }
                }
            }
        </script>
    </head>
    <body class="min-h-screen relative flex items-center justify-center overflow-x-hidden selection:bg-primary selection:text-slate-950">
        <!-- Full-screen Background (Nueva imagen de gimnasio moderno y amplio) -->
        <div class="fixed inset-0 z-0">
            <img alt="Gym Interior" class="w-full h-full object-cover opacity-100 scale-105" src="https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2000&auto=format&fit=crop"/>
            <div class="absolute inset-0 premium-overlay"></div>
        </div>

        <main class="relative z-10 w-full max-w-7xl mx-auto px-6 py-12 flex flex-col items-center justify-center min-h-screen">
            <!-- Header Section -->
            <header class="mb-20 text-center animate-fade-in" style="opacity: 0; transform: translateY(30px); transition: all 1.2s cubic-bezier(0.22, 1, 0.36, 1);">
                <h1 class="text-6xl md:text-8xl font-extrabold text-white mb-4 tracking-[-0.04em] drop-shadow-[0_4px_16px_rgba(0,0,0,0.9)]">
                    Fit<span class="text-primary">Cimm</span>
                </h1>
                <div class="flex items-center justify-center gap-4 mb-3">
                    <div class="h-[1px] w-10 bg-primary/80"></div>
                    <h2 class="text-sm md:text-lg font-bold text-primary uppercase tracking-[0.3em] drop-shadow-[0_2px_10px_rgba(0,0,0,0.9)]">
                        Gestión Deportiva • SENA
                    </h2>
                    <div class="h-[1px] w-10 bg-primary/80"></div>
                </div>
                <p class="text-white max-w-lg mx-auto font-medium text-sm md:text-base mt-6 leading-relaxed drop-shadow-[0_2px_10px_rgba(0,0,0,0.9)]">
                    Plataforma administrativa para el control integral de usuarios, planes y rendimiento deportivo en los centros de formación SENA.
                </p>
            </header>

            <!-- Module Cards Grid -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 w-full max-w-6xl items-stretch">

                <!-- Card 1: GestionIngreso.jsp -->
                <div class="hover-card-trigger group cursor-pointer h-full" onclick="location.href = 'GestionIngreso.jsp'">
                    <div class="glass-card h-full w-full p-10 flex flex-col items-center text-center rounded-2xl shadow-xl">
                        <div class="w-20 h-20 mb-10 rounded-full flex items-center justify-center border border-primary/50 bg-primary/20 group-hover:bg-primary/30 transition-all duration-500 shadow-[0_0_20px_rgba(56,189,248,0.3)]">
                            <span class="material-symbols-outlined text-primary text-4xl">sensor_door</span>
                        </div>
                        <h3 class="text-2xl font-bold text-white mb-4 drop-shadow-[0_2px_8px_rgba(0,0,0,0.9)]">
                            Gestion Ingreso
                        </h3>
                        <p class="text-white mb-12 flex-grow text-sm leading-relaxed font-medium drop-shadow-[0_2px_6px_rgba(0,0,0,0.9)]">
                            Registro y visualización en tiempo real de entradas y salidas de usuarios a las instalaciones deportivas.
                        </p>
                        <button class="w-full py-4 px-8 bg-transparent border-2 border-primary hover:bg-primary/25 text-white font-bold text-xs uppercase tracking-[0.15em] rounded-lg transition-all duration-300 flex items-center justify-center gap-3 group-hover:shadow-[0_5px_20px_-5px_rgba(56,189,248,0.6)]">
                            <span>INGRESAR</span>
                            <span class="material-symbols-outlined text-sm transition-transform group-hover:translate-x-1">arrow_forward</span>
                        </button>
                    </div>
                </div>

                <!-- Card 2: GestionPlanesyMembresia.jsp -->
                <div class="hover-card-trigger group cursor-pointer h-full" onclick="location.href = 'GestionPlanesyMembresia.jsp'">
                    <div class="glass-card h-full w-full p-10 flex flex-col items-center text-center rounded-2xl shadow-xl">
                        <div class="w-20 h-20 mb-10 rounded-full flex items-center justify-center border border-primary/50 bg-primary/20 group-hover:bg-primary/30 transition-all duration-500 shadow-[0_0_20px_rgba(56,189,248,0.3)]">
                            <span class="material-symbols-outlined text-primary text-4xl">credit_card</span>
                        </div>
                        <h3 class="text-2xl font-bold text-white mb-4 drop-shadow-[0_2px_8px_rgba(0,0,0,0.9)]">
                            Gestion de Planes y Membresias
                        </h3>
                        <p class="text-white mb-12 flex-grow text-sm leading-relaxed font-medium drop-shadow-[0_2px_6px_rgba(0,0,0,0.9)]">
                            Administración completa de membresías, pagos, renovaciones y facturación digital para usuarios.
                        </p>
                        <button class="w-full py-4 px-8 bg-transparent border-2 border-primary hover:bg-primary/25 text-white font-bold text-xs uppercase tracking-[0.15em] rounded-lg transition-all duration-300 flex items-center justify-center gap-3 group-hover:shadow-[0_5px_20px_-5px_rgba(56,189,248,0.6)]">
                            <span>VENTA PLAN Y MEMBRESIA</span>
                            <span class="material-symbols-outlined text-sm transition-transform group-hover:translate-x-1">arrow_forward</span>
                        </button>
                    </div>
                </div>

                <!-- Card 3: GestionReportes.jsp -->
                <div class="hover-card-trigger group cursor-pointer h-full" onclick="location.href = 'GestionReportes.jsp'">
                    <div class="glass-card h-full w-full p-10 flex flex-col items-center text-center rounded-2xl shadow-xl">
                        <div class="w-20 h-20 mb-10 rounded-full flex items-center justify-center border border-primary/50 bg-primary/20 group-hover:bg-primary/30 transition-all duration-500 shadow-[0_0_20px_rgba(56,189,248,0.3)]">
                            <span class="material-symbols-outlined text-primary text-4xl">bar_chart</span>
                        </div>
                        <h3 class="text-2xl font-bold text-white mb-4 drop-shadow-[0_2px_8px_rgba(0,0,0,0.9)]">
                            Gestion Reportes
                        </h3>
                        <p class="text-white mb-12 flex-grow text-sm leading-relaxed font-medium drop-shadow-[0_2px_6px_rgba(0,0,0,0.9)]">
                            Visualización de KPIs, métricas de asistencia y estadísticas de rendimiento para la toma de decisiones.
                        </p>
                        <button class="w-full py-4 px-8 bg-transparent border-2 border-primary hover:bg-primary/25 text-white font-bold text-xs uppercase tracking-[0.15em] rounded-lg transition-all duration-300 flex items-center justify-center gap-3 group-hover:shadow-[0_5px_20px_-5px_rgba(56,189,248,0.6)]">
                            <span>ANALIZAR</span>
                            <span class="material-symbols-outlined text-sm transition-transform group-hover:translate-x-1">arrow_forward</span>
                        </button>
                    </div>
                </div>

            </div>

        </main>

        <script>
            // Entrance animation trigger
            window.addEventListener('DOMContentLoaded', () => {
                const header = document.querySelector('header');
                if (header) {
                    setTimeout(() => {
                        header.style.opacity = '1';
                        header.style.transform = 'translateY(0)';
                    }, 100);
                }
            });

            // Background Parallax Effect
            document.addEventListener('mousemove', (e) => {
                const x = (window.innerWidth / 2 - e.pageX) / 90;
                const y = (window.innerHeight / 2 - e.pageY) / 90;
                const bg = document.querySelector('.fixed img');
                if (bg) {
                    bg.style.transition = 'transform 0.2s ease-out';
                    bg.style.transform = `scale(1.08) translate(${x}px, ${y}px)`;
                }
            });
        </script>
    </body>
</html>