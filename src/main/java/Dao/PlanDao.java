package Dao;

import Modelo.Plan;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PlanDao {

    // Listar planes activos
    public ArrayList<Plan> listarPlanesActivos() {

        ArrayList<Plan> lista = new ArrayList<>();

        String sql = "SELECT id_plan, nombre, duracion_dias, valor, activo "
                + "FROM plan "
                + "WHERE activo = 1 "
                + "ORDER BY nombre";

        try {

            Connection con = Conexion.getConexion();

            if (con == null) {
                System.out.println("No se pudo conectar a la base de datos.");
                return lista;
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Plan plan = new Plan();

                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setNombre(rs.getString("nombre"));
                plan.setDuracionDias(rs.getInt("duracion_dias"));
                plan.setValor(rs.getDouble("valor"));
                plan.setActivo(rs.getBoolean("activo"));

                lista.add(plan);

            }

            System.out.println("Planes encontrados: " + lista.size());

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return lista;

    }

    // Buscar plan por id
    public Plan buscarPorId(int idPlan) {

        Plan plan = null;

        String sql = "SELECT id_plan, nombre, duracion_dias, valor, activo "
                + "FROM plan "
                + "WHERE id_plan = ?";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, idPlan);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                plan = new Plan();

                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setNombre(rs.getString("nombre"));
                plan.setDuracionDias(rs.getInt("duracion_dias"));
                plan.setValor(rs.getDouble("valor"));
                plan.setActivo(rs.getBoolean("activo"));

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return plan;

    }

}