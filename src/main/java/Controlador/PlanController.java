package Controlador;

import Modelo.Plan;
import Servicio.PlanServicio;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/PlanController")

public class PlanController extends HttpServlet {

    private PlanServicio service = new PlanServicio();

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp) throws IOException, ServletException {

        String accion = req.getParameter("accion");

        if ("registrar".equals(accion)) {

            Plan plan = new Plan();
            plan.setNombre(req.getParameter("nombrePlan"));
            plan.setDuracionDias(Integer.parseInt(req.getParameter("duracionDias")));
            plan.setValor(new BigDecimal(req.getParameter("valor")));

            plan.setActivo(true);

            try {

                service.registrar(plan);

                req.setAttribute("mensaje", "¡El plan se registró correctamente!");
                req.getRequestDispatcher("RegistrarPlan.jsp").forward(req, resp);
            } catch (Exception e) {
                req.setAttribute("error", e.getMessage());

                try {
                    req.getRequestDispatcher("RegistrarPlan.jsp").forward(req, resp);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        } //Guardar
        else if ("actualizar".equals(accion)) {

            try {

                Plan plan = new Plan();

                plan.setIdPlan(Integer.parseInt(req.getParameter("id")));
                plan.setNombre(req.getParameter("nombre"));
                plan.setDuracionDias(Integer.parseInt(req.getParameter("duracionDias")));
                plan.setValor(new BigDecimal(req.getParameter("valor")));
                plan.setActivo(true);

                service.actualizar(plan);

                resp.sendRedirect("PlanController?accion=listaPlanes");

            } catch (Exception e) {

                req.setAttribute("error", e.getMessage());

                req.getRequestDispatcher("EditarPlan.jsp").forward(req, resp);

            }

        }
    }
    //listar planes

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String accion = req.getParameter("accion");

        if ("listaPlanes".equals(accion)) {

            try {

                List<Plan> lista = service.listar();

                req.setAttribute("listaPlanes", lista);
                req.getRequestDispatcher("CrudPlan.jsp").forward(req, resp);

            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("error", e.getMessage());
                req.getRequestDispatcher("CrudPlan.jsp").forward(req, resp);
            }
        } //Inactivar plan
        else if ("inactivar".equals(accion)) {

            try {

                int id = Integer.parseInt(req.getParameter("id"));

                service.eliminar(id);

                resp.sendRedirect("PlanController?accion=listaPlanes");

            } catch (Exception e) {

                req.setAttribute("error", "No se puede inactivar el plan porque está asociado a una o más membresías.");

                req.getRequestDispatcher("PlanController?accion=listaPlanes").forward(req, resp);
            }

        } //Ediatar
        else if ("editar".equals(accion)) {

            try {

                int id = Integer.parseInt(req.getParameter("id"));

                Plan plan = service.buscarPorId(id);

                req.setAttribute("plan", plan);

                req.getRequestDispatcher("EditarPlan.jsp").forward(req, resp);

            } catch (Exception e) {
                e.printStackTrace();
                resp.getWriter().println("ERROR: " + e.getMessage());
            }
        }

    }
}
