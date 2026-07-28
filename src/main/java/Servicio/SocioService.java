package Servicio;

import Dao.MembresiaDao;
import Dao.SocioDao;
import Modelo.EstadoMembresia;
import Modelo.Membresia;
import Modelo.Socio;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;

public class SocioService {

    private SocioDao dao = new SocioDao();
    private MembresiaDao memdao = new MembresiaDao();
    private MembresiaServicio membresiaService = new MembresiaServicio();

    public void MtRegistrarSocio(Socio socio) throws Exception {

        //No debe haver dos personas con el mismo documento
        if (dao.existeDocumento(socio.getDocumento())) {
            throw new Exception("Ya existe un socio con ese documento");

        }
        //debe ser mayor de 15 años
        int edad = Period.between(socio.getFechaNacimiento(),
                LocalDate.now()).getYears();

        if (edad < 15) {
            throw new Exception("El socio debe ser mayor a 15 años");
        }
        dao.insertar(socio);

    }

    //Socio con membresia 
    public List<Socio> MtListarSocioConMembresia() throws SQLException {
        
        List<Socio> socios = dao.MtListarSocio();
        System.out.println("Cantidad de socios: " + socios.size());
        for (Socio socio : socios) {
            Membresia membresia = memdao.MtObtenerSocio(socio.getIdSocio());

            if (membresia != null) {
                EstadoMembresia estado = membresiaService.getEstado(membresia);
                socio.setEstadoMembresia(estado);
            }

        }
        return socios;
    }

    //Editar datos de socio
    public void MtEditarSocio(Socio so) throws SQLException {
        dao.MtEditarSocio(so);

    }
    public Socio MtBuscarPorId(int id) throws Exception {
    return dao.MtBuscarPorId(id);
}
    //Inactivar socio
    public void MtInactivarSocio(int id) throws Exception {
        dao.MtInactivarSocio(id);

}
    //Consultar socio
    public Socio MtConsultarDetalle(int id) throws Exception {

    Socio socio = dao.MtBuscarPorId(id);
    MembresiaServicio servi = new MembresiaServicio();


    Membresia membresia = memdao.MtObtenerSocio(id);

    if (membresia != null) {

        EstadoMembresia estado = servi.getEstado(membresia);

        socio.setEstadoMembresia(estado);

        // Si tu clase Socio tiene un atributo Membresia
        socio.setMembresia(membresia);
    }

    return socio;
}
 public List<Membresia> MtHistorialMembresias(int idSocio) throws Exception {

    List<Membresia> lista = memdao.MtHistorialMembresias(idSocio);

    for (Membresia m : lista) {

        EstadoMembresia estado = membresiaService.getEstado(m);

        m.setEstado(estado);
    }

    return lista;
}
   //Activar e inactivar cuentas 
    public boolean activar(int idSocio) throws Exception {
        return dao.activar(idSocio);
    }

    public boolean desactivar(int idSocio) throws Exception {
        return dao.desactivar(idSocio);
    }
   
}

    

