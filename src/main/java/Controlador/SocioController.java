package Controlador;

import Dao.IngresoDao;
import Modelo.Ingreso;
import Modelo.Membresia;
import Modelo.Socio;
import Servicio.IngresoServicio;
import Servicio.SocioService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SocioController")
public class SocioController extends HttpServlet {

    private IngresoServicio servicio = new IngresoServicio();
    private IngresoDao ingresoDao = new IngresoDao();
    private SocioService service = new SocioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ANDREA 
        String accion = request.getParameter("accion");
        if ("listar".equals(accion)) {

            try {

                List<Socio> lista = service.MtListarSocioConMembresia();

                request.setAttribute("listaSocios", lista);
                request.getRequestDispatcher("GestionSocio.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("GestionSocio.jsp").forward(request, response);
            }
        } //Inactivar Socio
        else if ("inactivar".equals(accion)) {

            try {

                int id = Integer.parseInt(request.getParameter("id"));

                service.MtInactivarSocio(id);

                response.sendRedirect("SocioController?accion=listar");

            } catch (Exception e) {
                e.printStackTrace();
            }
        } // Activar Socio
        else if ("activar".equals(accion)) {

            try {

                int id = Integer.parseInt(request.getParameter("id"));

                service.activar(id);

                response.sendRedirect("SocioController?accion=listar");

            } catch (Exception e) {
                e.printStackTrace();
            }

        } //editar socio
        else if ("editar".equals(accion)) {

            try {

                int id = Integer.parseInt(request.getParameter("id"));

                Socio socio = service.MtBuscarPorId(id);

                request.setAttribute("socio", socio);

                request.getRequestDispatcher("EditarSocio.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } //Historial membresias
        else if ("ver".equals(accion)) {

            try {

                int id = Integer.parseInt(request.getParameter("id"));

                Socio socio = service.MtBuscarPorId(id);
                Membresia mem = new Membresia();

                List<Membresia> listaMembresias = service.MtHistorialMembresias(id);

                request.setAttribute("socio", socio);
                request.setAttribute("listaMembresias", listaMembresias);

                request.getRequestDispatcher("ConsultarSocio.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } //Buscar Socio
        else if ("buscar".equals(accion)) {

            try {

                String dato = request.getParameter("buscar");

                List<Socio> lista = service.buscarPorDocumentoApellido(dato);

                request.setAttribute("listaSocios", lista);

                request.getRequestDispatcher("GestionSocio.jsp")
                        .forward(request, response);

            } catch (Exception e) {

                request.setAttribute("error", e.getMessage());

                request.getRequestDispatcher("GestionSocio.jsp")
                        .forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        // REGISTRAR SOCIO
        if ("registrar".equals(accion)) {

            try {

                Socio socio = new Socio();

                socio.setDocumento(request.getParameter("documento"));
                socio.setNombres(request.getParameter("nombre"));
                socio.setApellidos(request.getParameter("apellido"));
                socio.setTelefono(request.getParameter("telefono"));
                socio.setCorreo(request.getParameter("correo"));

                socio.setFechaNacimiento(
                        LocalDate.parse(request.getParameter("fechanacimiento"))
                );

                socio.setActivo(true);

                service.MtRegistrarSocio(socio);

                request.setAttribute("mensaje",
                        "¡El socio se registró correctamente!");

                request.getRequestDispatcher("RegistroSocio.jsp")
                        .forward(request, response);

            } catch (Exception e) {

                request.setAttribute("error", e.getMessage());

                request.getRequestDispatcher("RegistroSocio.jsp")
                        .forward(request, response);
            }

            // REGISTRAR INGRESO
        } else if ("ingreso".equals(accion)) {

            String documento = request.getParameter("documento");

            String mensaje = servicio.registrarIngreso(documento);

            request.setAttribute("mensaje", mensaje);

            request.getRequestDispatcher("GestionIngreso.jsp")
                    .forward(request, response);

            // CONSULTAR INGRESOS
        } else if ("consultar".equals(accion)) {

            String fecha = request.getParameter("fecha");

            ArrayList<Ingreso> lista = ingresoDao.listarPorFecha(fecha);

            request.setAttribute("lista", lista);

            request.getRequestDispatcher("GestionIngreso.jsp")
                    .forward(request, response);

            // ACTUALIZAR SOCIO
        } else if ("actualizar".equals(accion)) {

            try {

                Socio socio = new Socio();

                socio.setIdSocio(
                        Integer.parseInt(request.getParameter("id"))
                );

                socio.setNombres(request.getParameter("nombre"));
                socio.setApellidos(request.getParameter("apellido"));
                socio.setTelefono(request.getParameter("telefono"));
                socio.setCorreo(request.getParameter("correo"));

                socio.setFechaNacimiento(
                        LocalDate.parse(request.getParameter("fechanacimiento"))
                );

                socio.setActivo(
                        Boolean.parseBoolean(request.getParameter("activo"))
                );

                service.MtEditarSocio(socio);

                response.sendRedirect(
                        "SocioController?accion=listar&mensaje=actualizado"
                );

            } catch (Exception e) {

                e.printStackTrace();

                response.getWriter()
                        .println("ERROR: " + e.getMessage());
            }

        } else {

            response.sendRedirect("menu.jsp");

        }
    }

}
