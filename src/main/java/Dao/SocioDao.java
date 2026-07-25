package Dao;

import Modelo.Socio;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
                + "INNER JOIN membresia m ON s.id_socio = m.id_socio "
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
                socio.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
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

}