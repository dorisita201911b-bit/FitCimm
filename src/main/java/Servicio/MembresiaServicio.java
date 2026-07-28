package Servicio;

import Dao.MembresiaDao;
import Dao.PlanDao;
import Dao.SocioDao;
import Modelo.EstadoMembresia;
import Modelo.Membresia;
import Modelo.Plan;
import Modelo.Socio;
import java.math.BigDecimal;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class MembresiaServicio {

    private MembresiaDao membresiaDao;
    private PlanDao planDao;
    private SocioDao socioDao;

    public MembresiaServicio() {

        membresiaDao = new MembresiaDao();
        planDao = new PlanDao();
        socioDao = new SocioDao();

    }

    // Vender o renovar membresía
    public String venderMembresia(
            String documento,
            int idPlan,
            Date fechaInicio
    ) {

        // Buscar socio
        Socio socio = socioDao.buscarPorDocumento(documento);

        if (socio == null) {
            return "❌ No existe ningún socio registrado con el documento " + documento + ".";
        }

        // Validar que el socio esté activo
        if (!socio.isActivo()) {
            return "❌ El socio se encuentra inactivo. No es posible vender una membresía.";
        }

        int idSocio = socio.getIdSocio();

        // Buscar plan
        Plan plan = planDao.buscarPorId(idPlan);

        if (plan == null) {
            return "❌ El plan seleccionado no existe.";
        }

        // Validar plan activo
        if (!plan.isActivo()) {
            return "❌ El plan seleccionado está inactivo.";
        }

        // RN-07
        if (plan.getValor().compareTo(BigDecimal.ZERO) <= 0) {
            return "❌ El valor del plan debe ser mayor que cero.";
        }

        if (plan.getDuracionDias() < 1 || plan.getDuracionDias() > 365) {
            return "❌ La duración del plan debe estar entre 1 y 365 días.";
        }

        // Buscar la última membresía
        Membresia anterior = membresiaDao.buscarUltimaMembresia(idSocio);

        LocalDate inicio = fechaInicio.toLocalDate();

        String mensaje = "";

        if (anterior == null) {

            mensaje += "🎉 Primera membresía registrada para el socio.<br><br>";

        } else {

            LocalDate finAnterior = anterior.getFechaFin();

            // RN-03
            if (!finAnterior.isBefore(LocalDate.now())) {

                inicio = finAnterior.plusDays(1);

                mensaje += "ℹ El socio ya tiene una membresía vigente.<br>";
                mensaje += "📅 La membresía actual vence el: <b>" + finAnterior + "</b><br>";
                mensaje += "✅ La nueva membresía comenzará automáticamente el: <b>" + inicio + "</b><br><br>";

            } else {

                mensaje += "⚠ La membresía anterior ya estaba vencida.<br>";
                mensaje += "📅 La nueva membresía iniciará el: <b>" + inicio + "</b><br><br>";

            }

        }

        // RN-02 Calcular la fecha de fin automáticamente
        LocalDate fin = inicio.plusDays(plan.getDuracionDias() - 1);

        Membresia nueva = new Membresia();

        nueva.setIdSocio(idSocio);
        nueva.setIdPlan(idPlan);
        nueva.setFechaInicio(inicio);
        nueva.setFechaFin(fin);
        nueva.setValorPagado(plan.getValor());

        boolean guardado = membresiaDao.registrarMembresia(nueva);

        if (!guardado) {
            return "❌ No fue posible registrar la membresía.";
        }

        // Resumen
        mensaje += "════════════════════════════════════<br>";
        mensaje += "✅ <b>MEMBRESÍA REGISTRADA CORRECTAMENTE</b><br><br>";

        mensaje += "👤 <b>Socio:</b> "
                + socio.getNombres() + " "
                + socio.getApellidos() + "<br>";

        mensaje += "📄 <b>Documento:</b> "
                + socio.getDocumento() + "<br>";

        mensaje += "📋 <b>Plan:</b> "
                + plan.getNombre() + "<br>";

        mensaje += "📅 <b>Fecha de inicio:</b> "
                + inicio + "<br>";

        mensaje += "📅 <b>Fecha de finalización:</b> "
                + fin + "<br>";

        mensaje += "⏳ <b>Duración:</b> "
                + plan.getDuracionDias() + " días<br>";

        mensaje += "💰 <b>Valor pagado:</b> $"
                + String.format("%,.0f", plan.getValor()) + "<br>";

        mensaje += "<br>🎉 Gracias por adquirir tu membresía.";

        return mensaje;
    }

    // Reporte de membresías próximas a vencer
    public ArrayList<Membresia> proximosVencimientos() {

        return membresiaDao.listarProximosVencimientos();

    }
    
    //ANDREA 
     //ESTADO DE LA MEMBRESIA RN-04

    public EstadoMembresia getEstado(Membresia m) { // esta clase va a sevolver un estado membresia
        LocalDate Hoy = LocalDate.now(); // guardamos la fecha actual
        if (m.getFechaFin().isBefore((Hoy))) { //condicio para saber si la fecha fin de la membresia ya paso
            return EstadoMembresia.VENCIDAS; //devuelve el resultado
        }
        long diasRestantes = ChronoUnit.DAYS.between(Hoy, m.getFechaFin()); //ChronoUnit.DAYS para medir el tiempo en dias
        if (diasRestantes <= 5) {
            return EstadoMembresia.POR_VENCER;
        }
        return EstadoMembresia.VIGENTE;

    }
    private MembresiaDao dao = new MembresiaDao();

    public List<Membresia> listar() throws Exception {

        List<Membresia> lista = dao.listar();

        for (Membresia m : lista) {
            m.setEstado(getEstado(m));
        }

        return lista;
    }
}



