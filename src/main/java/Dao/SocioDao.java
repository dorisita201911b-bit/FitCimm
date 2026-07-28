package Dao;

import Modelo.Socio;
import Util.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SocioDao {

    public Socio buscarPorDocumento(String documento) {

        Socio socio = null;

        String sql = "SELECT s.id_socio, "
                + "s.documento, "
                + "s.nombres, "
                + "s.apellidos, "
                + "s.telefono, "
                + "s.correo, "
                + "s.fecha_nacimiento, "
                + "s.activo, "
                + "m.fecha_fin, "
                + "DATEDIFF(m.fecha_fin, CURDATE()) AS dias_restantes "
                + "FROM socio s "
                + "LEFT JOIN membresia m ON s.id_socio = m.id_socio "
                + "WHERE s.documento = ? "
                + "ORDER BY m.fecha_fin DESC "
                + "LIMIT 1";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, documento);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                socio = new Socio();

                socio.setIdSocio(rs.getInt("id_socio"));
                socio.setDocumento(rs.getString("documento"));
                socio.setNombres(rs.getString("nombres"));
                socio.setApellidos(rs.getString("apellidos"));
                socio.setTelefono(rs.getString("telefono"));
                socio.setCorreo(rs.getString("correo"));
                socio.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
                socio.setActivo(rs.getBoolean("activo"));
                socio.setFechaFin(rs.getDate("fecha_fin"));
                socio.setDiasRestantes(rs.getInt("dias_restantes"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return socio;

    }

    // ANDREA 
    //Registrar
    public void insertar(Socio s) throws SQLException {
        String sql = "INSERT INTO socio (documento, nombres, apellidos, "
                + "telefono, correo, fecha_nacimiento, activo) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getDocumento());
            ps.setString(2, s.getNombres());
            ps.setString(3, s.getApellidos());
            ps.setString(4, s.getTelefono());
            ps.setString(5, s.getCorreo());
            ps.setDate(6, Date.valueOf(s.getFechaNacimiento()));
            ps.setBoolean(7, s.isActivo());
            ps.executeUpdate();
        }
    }
    // Listar

    public List<Socio> MtListarSocio() throws SQLException {

        List<Socio> lista = new ArrayList<>();

        String consulta = "SELECT * FROM Socio";

        MembresiaDao membresiaDAO = new MembresiaDao();

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Socio socio = new Socio();

                socio.setIdSocio(rs.getInt("id_Socio"));
                socio.setDocumento(rs.getString("documento"));
                socio.setNombres(rs.getString("nombres"));
                socio.setApellidos(rs.getString("apellidos"));
                socio.setTelefono(rs.getString("telefono"));
                socio.setCorreo(rs.getString("correo"));
                socio.setFechaNacimiento(rs.getDate("fecha_Nacimiento").toLocalDate());
                socio.setActivo(rs.getBoolean("activo"));

                lista.add(socio);
            }

        }

        return lista;
    }
    //RN-01 DOCUMEMTO

    public boolean existeDocumento(String documento) throws SQLException {

        String consulta = "SELECT COUNT(*) FROM socio WHERE documento = ?";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(consulta)) {

            ps.setString(1, documento);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }

        return false;
    }

    //Editar
    public void MtEditarSocio(Socio so) throws SQLException {
        String sql = "UPDATE socio SET nombres = ?, apellidos = ?, telefono = ?, correo = ?, fecha_Nacimiento = ?, activo =? WHERE id_Socio = ?";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, so.getNombres());
            ps.setString(2, so.getApellidos());
            ps.setString(3, so.getTelefono());
            ps.setString(4, so.getCorreo());
            ps.setDate(5, Date.valueOf(so.getFechaNacimiento()));
            ps.setBoolean(6, so.isActivo());
            ps.setInt(7, so.getIdSocio());

            ps.executeUpdate();

        }

    }
//buscar por id

    public Socio MtBuscarPorId(int id) throws SQLException {

        String sql = "SELECT * FROM socio WHERE id_Socio = ?";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Socio socio = new Socio();

                socio.setIdSocio(rs.getInt("id_Socio"));
                socio.setDocumento(rs.getString("documento"));
                socio.setNombres(rs.getString("nombres"));
                socio.setApellidos(rs.getString("apellidos"));
                socio.setTelefono(rs.getString("telefono"));
                socio.setCorreo(rs.getString("correo"));
                socio.setFechaNacimiento(rs.getDate("fecha_Nacimiento").toLocalDate());
                socio.setActivo(rs.getBoolean("activo"));

                return socio;
            }
        }

        return null;
    }

    //Inactivar
    public void MtInactivarSocio(int id) throws SQLException {

        String sql = "UPDATE socio SET activo = ? WHERE id_Socio = ?";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setBoolean(1, false);
            ps.setInt(2, id);

            ps.executeUpdate();
        }
    }
//Activar e inactivar cuentas

    public boolean activar(int idSocio) throws Exception {

        String sql = "UPDATE socio SET activo = ? WHERE id_socio = ?";

        Connection con = Conexion.getConexion();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setBoolean(1, true);
        ps.setInt(2, idSocio);

        return ps.executeUpdate() > 0;
    }

    public boolean desactivar(int idSocio) throws Exception {

        String sql = "UPDATE socio SET activo = ? WHERE id_socio = ?";

        Connection con = Conexion.getConexion();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setBoolean(1, false);
        ps.setInt(2, idSocio);

        return ps.executeUpdate() > 0;
    }

    //Buscar
    public List<Socio> buscarPorDocumentoApellido(String dato) throws Exception {

        List<Socio> lista = new ArrayList<>();

        String sql = "SELECT * FROM socio "
                + "WHERE documento LIKE ? "
                + "OR apellidos LIKE ?";

        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + dato + "%");
            ps.setString(2, "%" + dato + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Socio s = new Socio();

                s.setIdSocio(rs.getInt("id_socio"));
                s.setDocumento(rs.getString("documento"));
                s.setNombres(rs.getString("nombres"));
                s.setApellidos(rs.getString("apellidos"));
                s.setTelefono(rs.getString("telefono"));
                s.setCorreo(rs.getString("correo"));
                s.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
                s.setActivo(rs.getBoolean("activo"));

                lista.add(s);
            }

        }

        return lista;
    }

}
