package Servicio;

import Dao.PlanDao;
import Modelo.Plan;
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
        dao.actualizar(plan);
    }

    // Eliminar
    public void eliminar(int id) throws Exception {
        dao.eliminar(id);
    }
    
}
