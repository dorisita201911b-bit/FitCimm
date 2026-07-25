package Controlador;

import Modelo.Reporte;
import Servicio.ReporteServicio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ReporteController", urlPatterns = {"/ReporteController"})
public class ReporteController extends HttpServlet {

    private ReporteServicio servicio = new ReporteServicio();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {

            accion = "";

        }

        switch (accion) {

           
            // RF-15
            // Socios activos con membresía vigente
            
            case "sociosActivos":

                ArrayList<Reporte> socios
                        = servicio.obtenerSociosActivos();

                request.setAttribute(
                        "socios",
                        socios
                );

                break;

            
            // RF-16
            // Total recaudado por fechas
                
            case "recaudo":

                String inicio
                        = request.getParameter("inicio");

                String fin
                        = request.getParameter("fin");

                ArrayList<Reporte> recaudo
                        = servicio.obtenerRecaudo(inicio, fin);

                request.setAttribute(
                        "recaudo",
                        recaudo
                );

                break;

          
            // RF-17
            // Plan más vendido
          
            case "planVendido":

                Reporte plan
                        = servicio.obtenerPlanMasVendido();

                request.setAttribute(
                        "planVendido",
                        plan
                );

                break;

            default:

                break;

        }

        request.getRequestDispatcher("GestionReportes.jsp")
                .forward(request, response);

    }

}
