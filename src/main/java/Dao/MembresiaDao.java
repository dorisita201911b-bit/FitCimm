package Dao;

import Modelo.Membresia;
import Modelo.Plan;
import Modelo.Socio;
import Util.Conexion;
import java.math.BigDecimal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MembresiaDao {

    // Registrar nueva membresía
    public boolean registrarMembresia(Membresia membresia) {

        boolean registrado = false;

        String sql = "INSERT INTO membresia "
                + "(id_socio,id_plan,fecha_inicio,fecha_fin,valor_pagado) "
                + "VALUES (?,?,?,?,?)";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, membresia.getIdSocio());
            ps.setInt(2, membresia.getIdPlan());
            ps.setDate(3, Date.valueOf(membresia.getFechaInicio()));
            ps.setDate(4, Date.valueOf(membresia.getFechaFin()));
            ps.setBigDecimal(5, membresia.getValorPagado());

            registrado = ps.executeUpdate() > 0;

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return registrado;

    }

    // Buscar la última membresía del socio
    public Membresia buscarUltimaMembresia(int idSocio) {

        Membresia membresia = null;

        String sql = "SELECT * "
                + "FROM membresia "
                + "WHERE id_socio=? "
                + "ORDER BY fecha_fin DESC "
                + "LIMIT 1";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, idSocio);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                membresia = new Membresia();

                membresia.setIdMembresia(rs.getInt("id_membresia"));
                membresia.setIdSocio(rs.getInt("id_socio"));
                membresia.setIdPlan(rs.getInt("id_plan"));
                membresia.setFechaInicio(rs.getDate("fecha_inicio").toLocalDate());
                membresia.setFechaFin(rs.getDate("fecha_fin").toLocalDate());
                membresia.setValorPagado(rs.getBigDecimal("valor_pagado"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return membresia;

    }

    // RF-11
    // Listar los socios cuya membresía vence en los próximos 5 días
    public ArrayList<Membresia> listarProximosVencimientos() {

        ArrayList<Membresia> lista = new ArrayList<>();

        String sql
                = "SELECT "
                + "s.documento, "
                + "CONCAT(s.nombres,' ',s.apellidos) AS nombre_socio, "
                + "p.nombre AS nombre_plan, "
                + "m.fecha_inicio, "
                + "m.fecha_fin, "
                + "m.valor_pagado "
                + "FROM membresia m "
                + "INNER JOIN socio s "
                + "ON m.id_socio = s.id_socio "
                + "INNER JOIN plan p "
                + "ON m.id_plan = p.id_plan "
                + "WHERE m.fecha_fin BETWEEN CURDATE() "
                + "AND DATE_ADD(CURDATE(),INTERVAL 5 DAY) "
                + "ORDER BY m.fecha_fin ASC";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Membresia m = new Membresia();

                m.setDocumento(
                        rs.getString("documento")
                );

                m.setNombreSocio(
                        rs.getString("nombre_socio")
                );

                m.setNombrePlan(
                        rs.getString("nombre_plan")
                );

                m.setFechaInicio(
                        rs.getDate("fecha_inicio").toLocalDate()
                );

                m.setFechaFin(
                        rs.getDate("fecha_fin").toLocalDate()
                );

                m.setValorPagado(
                        rs.getBigDecimal("valor_pagado")
                );

                lista.add(m);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return lista;
    }

    // ANDREA 
    public Membresia MtObtenerSocio(int idSocio) throws SQLException {
        Membresia membresia = null;

        String consulta = "SELECT * FROM membresia WHERE id_Socio = ?";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(consulta)) {
            ps.setInt(1, idSocio);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                membresia = new Membresia();
                membresia.setIdMembresia(rs.getInt("id_Membresia"));
                membresia.setIdSocio(rs.getInt("id_Socio"));
                membresia.setIdPlan(rs.getInt("id_Plan"));
                membresia.setFechaInicio(rs.getDate("fecha_Inicio").toLocalDate());
                membresia.setFechaFin(rs.getDate("fecha_Fin").toLocalDate());

            }
        }
        return membresia;
    }
    // Historial de membresias por socio

    public List<Membresia> MtHistorialMembresias(int idSocio) throws SQLException {

        List<Membresia> lista = new ArrayList<>();

        String sql
                = "SELECT m.*, p.nombre "
                + "FROM membresia m "
                + "INNER JOIN plan p ON m.id_plan = p.id_plan "
                + "WHERE m.id_socio = ? "
                + "ORDER BY m.fecha_inicio DESC";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, idSocio);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Membresia m = new Membresia();

                m.setIdMembresia(rs.getInt("id_membresia"));
                m.setIdSocio(rs.getInt("id_socio"));
                m.setIdPlan(rs.getInt("id_plan"));
                m.setFechaInicio(rs.getDate("fecha_inicio").toLocalDate());
                m.setFechaFin(rs.getDate("fecha_fin").toLocalDate());
                m.setValorPagado(rs.getBigDecimal("valor_pagado"));

                Plan p = new Plan();
                p.setNombre(rs.getString("nombre"));
                m.setPlan(p);

                lista.add(m);
            }
        }

        return lista;
    }
    //lista membresia 

    public List<Membresia> listar() throws Exception {

        List<Membresia> lista = new ArrayList<>();

        String sql
                = "SELECT m.*, s.documento, s.nombres, s.apellidos, p.nombre "
                + "FROM membresia m "
                + "INNER JOIN socio s ON m.id_socio = s.id_socio "
                + "INNER JOIN plan p ON m.id_plan = p.id_plan";

        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Membresia m = new Membresia();

                m.setIdMembresia(rs.getInt("id_membresia"));
                m.setIdSocio(rs.getInt("id_socio"));
                m.setIdPlan(rs.getInt("id_plan"));
                m.setFechaInicio(rs.getDate("fecha_inicio").toLocalDate());
                m.setFechaFin(rs.getDate("fecha_fin").toLocalDate());
                m.setValorPagado(rs.getBigDecimal("valor_pagado"));

                // Crear el socio
                Socio s = new Socio();
                s.setDocumento(rs.getString("documento"));
                s.setNombres(rs.getString("nombres"));
                s.setApellidos(rs.getString("apellidos"));

                m.setSocio(s);

                // Crear el plan
                Plan p = new Plan();
                p.setNombre(rs.getString("nombre"));
                m.setPlan(p);

                lista.add(m);
            }

        } catch (Exception e) {
            throw e;
        }

        return lista;
    }
}
