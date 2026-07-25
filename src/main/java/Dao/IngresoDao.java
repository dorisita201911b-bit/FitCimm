package Dao;

import Modelo.Ingreso;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class IngresoDao {

    // Verificar si el socio ya registró ingreso hoy
    public boolean ingresoHoy(int idSocio) {

        String sql = "SELECT COUNT(*) "
                   + "FROM ingreso "
                   + "WHERE id_socio = ? "
                   + "AND fecha_ingreso = CURDATE()";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, idSocio);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                boolean existe = rs.getInt(1) > 0;

                rs.close();
                ps.close();
                con.close();

                return existe;

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;

    }

    // Registrar ingreso
    public boolean registrarIngreso(int idSocio) {

        String sql = "INSERT INTO ingreso "
                   + "(id_socio, fecha_ingreso, hora_ingreso) "
                   + "VALUES (?, CURDATE(), CURTIME())";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, idSocio);

            boolean registrado = ps.executeUpdate() > 0;

            ps.close();
            con.close();

            return registrado;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;

    }

    // Consultar ingresos por fecha
    public ArrayList<Ingreso> listarPorFecha(String fecha) {

        ArrayList<Ingreso> lista = new ArrayList<>();

        String sql = "SELECT i.id_ingreso, "
                   + "i.id_socio, "
                   + "i.fecha_ingreso, "
                   + "i.hora_ingreso, "
                   + "s.nombres, "
                   + "s.apellidos "
                   + "FROM ingreso i "
                   + "INNER JOIN socio s "
                   + "ON i.id_socio = s.id_socio "
                   + "WHERE i.fecha_ingreso = ? "
                   + "ORDER BY i.hora_ingreso";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, fecha);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Ingreso ingreso = new Ingreso();

                ingreso.setIdIngreso(rs.getInt("id_ingreso"));
                ingreso.setIdSocio(rs.getInt("id_socio"));
                ingreso.setFechaIngreso(rs.getDate("fecha_ingreso"));
                ingreso.setHoraIngreso(rs.getTime("hora_ingreso"));
                ingreso.setNombreSocio(
                        rs.getString("nombres") + " "
                        + rs.getString("apellidos"));

                lista.add(ingreso);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return lista;

    }

}