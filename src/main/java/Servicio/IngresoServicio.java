package Servicio;

import Dao.IngresoDao;
import Dao.MembresiaDao;
import Dao.SocioDao;
import Modelo.EstadoMembresia;
import Modelo.Membresia;
import Modelo.Socio;

public class IngresoServicio {

    private SocioDao socioDao;
    private IngresoDao ingresoDao;
    private MembresiaDao membresiaDao = new MembresiaDao();

    private MembresiaServicio mem = new MembresiaServicio();

    public IngresoServicio() {

        socioDao = new SocioDao();
        ingresoDao = new IngresoDao();

    }

    public String registrarIngreso(String documento) {

        // Buscar socio
        Socio socio = socioDao.buscarPorDocumento(documento);

        if (socio == null) {
            return "❌ El socio no existe.";
        }

// SOLO DESPUÉS de comprobar que socio existe
        Membresia membresia = membresiaDao.buscarUltimaMembresia(socio.getIdSocio());

        if (membresia == null) {
            return "❌ El socio no tiene una membresía registrada.";
        }

        EstadoMembresia estado = mem.getEstado(membresia);

        if (estado == EstadoMembresia.VENCIDAS) {
            return "❌ La membresía está vencida.";
        }

        if (socio == null) {

            return "❌ El socio no existe.";

        }

        // RN-05: Socio activo
        if (!socio.isActivo()) {

            return "❌ El socio está inactivo. No puede registrar ingreso.";

        }

        // RN-05: Membresía vigente
        if (socio.getDiasRestantes() < 0) {

            return "❌ La membresía está vencida.";

        }

        // RN-06: Solo un ingreso por día
        if (ingresoDao.ingresoHoy(socio.getIdSocio())) {

            return "⚠ El socio ya registró un ingreso el día de hoy.";

        }

        // Registrar ingreso
        boolean registrado = ingresoDao.registrarIngreso(socio.getIdSocio());

        if (!registrado) {

            return "❌ No fue posible registrar el ingreso.";

        }

        // Construir mensaje
        String mensaje = "";

        mensaje += "✅ Ingreso registrado correctamente.<br><br>";
        mensaje += "<b>Socio:</b> " + socio.getNombres() + " " + socio.getApellidos() + "<br>";
        mensaje += "<b>Documento:</b> " + socio.getDocumento() + "<br>";

        if (socio.getDiasRestantes() == 0) {

            mensaje += "<br>⚠ La membresía vence hoy.";

        } else if (socio.getDiasRestantes() <= 5) {

            mensaje += "<br>⚠ Restan "
                    + socio.getDiasRestantes()
                    + " días para el vencimiento de la membresía.";

        } else {

            mensaje += "<br>✅ Restan "
                    + socio.getDiasRestantes()
                    + " días de vigencia.";

        }

        return mensaje;

    }

}
