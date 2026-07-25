package Controlador;

import Dao.IngresoDao;
import Modelo.Ingreso;
import Servicio.IngresoServicio;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SocioController", urlPatterns = {"/SocioController"})
public class SocioController extends HttpServlet {

    private IngresoServicio servicio = new IngresoServicio();
    private IngresoDao ingresoDao = new IngresoDao();

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

            case "registrar":

                String documento = request.getParameter("documento");

                String mensaje = servicio.registrarIngreso(documento);

                request.setAttribute("mensaje", mensaje);

                break;

            case "consultar":

                String fecha = request.getParameter("fecha");

                ArrayList<Ingreso> lista = ingresoDao.listarPorFecha(fecha);

                request.setAttribute("lista", lista);

                break;

            default:

                break;

        }

        request.getRequestDispatcher("GestionIngreso.jsp")
               .forward(request, response);

    }

}