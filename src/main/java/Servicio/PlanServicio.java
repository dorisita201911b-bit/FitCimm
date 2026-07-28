package Servicio;

import Dao.PlanDao;
import Modelo.Plan;
import java.math.BigDecimal;
import java.util.List;

public class PlanServicio {

    private PlanDao dao = new PlanDao();

    // Registrar
    public void registrar(Plan plan) throws Exception {
        dao.registrar(plan);
    }

    // Listar
    public List<Plan> listar() throws Exception {
        return dao.listar();
    }

    // Buscar por ID
    public Plan buscarPorId(int id) throws Exception {
        return dao.buscarPorId(id);
    }

    // Actualizar
    public void actualizar(Plan plan) throws Exception {
        
//RN-07
    if (plan.getValor().compareTo(BigDecimal.ZERO) <= 0) {
        throw new Exception("El valor del plan debe ser mayor que cero.");
    }

    if (plan.getDuracionDias() < 1 || plan.getDuracionDias() > 365) {
        throw new Exception("La duración del plan debe estar entre 1 y 365 días.");
    }

    dao.registrar(plan);
}

    // Eliminar
    public void eliminar(int id) throws Exception {
        dao.eliminar(id);
    }

}
