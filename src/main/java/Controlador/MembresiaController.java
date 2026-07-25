package Controlador;

import Dao.PlanDao;
import Modelo.Membresia;
import Modelo.Plan;
import Servicio.MembresiaServicio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "MembresiaController", urlPatterns = {"/MembresiaController"})
public class MembresiaController extends HttpServlet {

    private MembresiaServicio servicio;
    private PlanDao planDao;

    @Override
    public void init() {

        servicio = new MembresiaServicio();
        planDao = new PlanDao();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        cargarDatos(request);

        request.getRequestDispatcher("GestionPlanesyMembresia.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "";
        }

        switch (accion) {

            case "vender":

                String documento = request.getParameter("documento");
                System.out.println("Documento: " + request.getParameter("documento"));
                System.out.println("IdPlan: " + request.getParameter("idPlan"));
                System.out.println("FechaInicio: " + request.getParameter("fechaInicio"));
                System.out.println("Accion: " + request.getParameter("accion"));
                int idPlan = Integer.parseInt(
                        request.getParameter("idPlan")
                );

                Date fechaInicio = Date.valueOf(
                        request.getParameter("fechaInicio")
                );

                String mensaje = servicio.venderMembresia(
                        documento,
                        idPlan,
                        fechaInicio
                );

                request.setAttribute("mensaje", mensaje);

                break;

            case "vencimientos":

                ArrayList<Membresia> lista
                        = servicio.proximosVencimientos();

                request.setAttribute(
                        "listaVencimientos",
                        lista
                );

                break;

            default:
                break;
        }

        cargarDatos(request);

        request.getRequestDispatcher("GestionPlanesyMembresia.jsp")
                .forward(request, response);

    }

    private void cargarDatos(HttpServletRequest request) {

        ArrayList<Plan> planes
                = planDao.listarPlanesActivos();

        request.setAttribute("planes", planes);

    }

}
