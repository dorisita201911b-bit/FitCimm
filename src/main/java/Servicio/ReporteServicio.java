package Servicio;

import Dao.ReporteDao;
import Modelo.Reporte;

import java.util.ArrayList;

public class ReporteServicio {

    private ReporteDao reporteDao;

    public ReporteServicio() {

        reporteDao = new ReporteDao();

    }

    
    // RF-15
    // Socios activos con membresía vigente
    
    public ArrayList<Reporte> obtenerSociosActivos() {

        return reporteDao.sociosActivosVigentes();

    }

    // RF-16
    // Total recaudado por rango de fechas
    
    public ArrayList<Reporte> obtenerRecaudo(String fechaInicio, String fechaFin) {

        if (fechaInicio == null || fechaFin == null
                || fechaInicio.isEmpty()
                || fechaFin.isEmpty()) {

            return new ArrayList<>();

        }

        return reporteDao.totalRecaudado(fechaInicio, fechaFin);

    }
    
    // RF-17
    // Plan más vendido del mes
    
    
    public Reporte obtenerPlanMasVendido() {

        return reporteDao.planMasVendido();

    }

}
