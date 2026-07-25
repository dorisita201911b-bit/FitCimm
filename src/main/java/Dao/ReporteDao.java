package Dao;

import Modelo.Reporte;
import Util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReporteDao {

    
    // RF-15
    // Reporte de socios activos con membresía vigente
    
    public ArrayList<Reporte> sociosActivosVigentes() {

        ArrayList<Reporte> lista = new ArrayList<>();

        String sql
                = "SELECT "
                + "s.documento, "
                + "s.nombres, "
                + "s.apellidos, "
                + "p.nombre AS plan, "
                + "m.fecha_fin "
                + "FROM socio s "
                + "INNER JOIN membresia m "
                + "ON s.id_socio = m.id_socio "
                + "INNER JOIN plan p "
                + "ON m.id_plan = p.id_plan "
                + "WHERE s.activo = TRUE "
                + "AND m.fecha_fin >= CURDATE()";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Reporte reporte = new Reporte();

                reporte.setDocumento(
                        rs.getString("documento")
                );

                reporte.setNombres(
                        rs.getString("nombres")
                );

                reporte.setApellidos(
                        rs.getString("apellidos")
                );

                reporte.setNombrePlan(
                        rs.getString("plan")
                );

                reporte.setFechaFin(
                        rs.getString("fecha_fin")
                );

                lista.add(reporte);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return lista;

    }

    
    // RF-16
    // Total recaudado por rango de fechas agrupado por plan
    
    public ArrayList<Reporte> totalRecaudado(String inicio, String fin) {

        ArrayList<Reporte> lista = new ArrayList<>();

        String sql
                = "SELECT "
                + "p.nombre AS plan, "
                + "SUM(m.valor_pagado) AS total "
                + "FROM membresia m "
                + "INNER JOIN plan p "
                + "ON m.id_plan = p.id_plan "
                + "WHERE m.fecha_inicio BETWEEN ? AND ? "
                + "GROUP BY p.nombre";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ps.setString(1, inicio);
            ps.setString(2, fin);

            ResultSet rs
                    = ps.executeQuery();

            while (rs.next()) {

                Reporte reporte = new Reporte();

                reporte.setNombrePlan(
                        rs.getString("plan")
                );

                reporte.setTotal(
                        rs.getDouble("total")
                );

                lista.add(reporte);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return lista;

    }

    // RF-17
    // Plan más vendido del mes
    
    public Reporte planMasVendido() {

        Reporte reporte = null;

        String sql
                = "SELECT "
                + "p.nombre AS plan, "
                + "COUNT(*) AS cantidad "
                + "FROM membresia m "
                + "INNER JOIN plan p "
                + "ON m.id_plan = p.id_plan "
                + "WHERE MONTH(m.fecha_inicio)=MONTH(CURDATE()) "
                + "AND YEAR(m.fecha_inicio)=YEAR(CURDATE()) "
                + "GROUP BY p.nombre "
                + "ORDER BY cantidad DESC "
                + "LIMIT 1";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ResultSet rs
                    = ps.executeQuery();

            if (rs.next()) {

                reporte = new Reporte();

                reporte.setNombrePlan(
                        rs.getString("plan")
                );

                reporte.setCantidad(
                        rs.getInt("cantidad")
                );

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return reporte;

    }

}
