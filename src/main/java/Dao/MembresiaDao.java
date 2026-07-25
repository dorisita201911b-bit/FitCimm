package Dao;

import Modelo.Membresia;
import Util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
            ps.setDate(3, membresia.getFechaInicio());
            ps.setDate(4, membresia.getFechaFin());
            ps.setDouble(5, membresia.getValorPagado());

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
                membresia.setFechaInicio(rs.getDate("fecha_inicio"));
                membresia.setFechaFin(rs.getDate("fecha_fin"));
                membresia.setValorPagado(rs.getDouble("valor_pagado"));

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

        String sql =
                "SELECT "
                + "m.id_membresia, "
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

                m.setIdMembresia(
                        rs.getInt("id_membresia")
                );

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
                        rs.getDate("fecha_inicio")
                );

                m.setFechaFin(
                        rs.getDate("fecha_fin")
                );

                m.setValorPagado(
                        rs.getDouble("valor_pagado")
                );

                lista.add(m);

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