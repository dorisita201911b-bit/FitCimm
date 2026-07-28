package Dao;

import Modelo.Plan;
import Util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                plan.setValor(rs.getBigDecimal("valor"));
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
                plan.setValor(rs.getBigDecimal("valor"));
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
    //ANDREA 
    //insertar plan 

    public void registrar(Plan plan) throws Exception {

        String sql = "INSERT INTO plan(nombre, duracion_dias, valor, activo) VALUES(?, ?, ?, ?)";

        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, plan.getNombre());
            ps.setInt(2, plan.getDuracionDias());
            ps.setBigDecimal(3, plan.getValor());
            ps.setBoolean(4, plan.isActivo());

            ps.executeUpdate();

        } catch (Exception e) {
            throw e;
        }
    }

    //Listar 
    public List<Plan> listar() throws Exception {

        List<Plan> lista = new ArrayList<>();

        String sql = "SELECT * FROM plan";

        try (Connection cn = Conexion.getConexion(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Plan plan = new Plan();

                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setNombre(rs.getString("nombre"));
                plan.setDuracionDias(rs.getInt("duracion_dias"));
                plan.setValor(rs.getBigDecimal("valor"));
                plan.setActivo(rs.getBoolean("activo"));

                lista.add(plan);
            }
        }

        return lista;
    }

//Actualizar 
    public void actualizar(Plan plan) throws Exception {

        String sql = "UPDATE plan SET nombre = ?, duracion_dias = ?, valor = ?, activo = ? WHERE id_plan = ?";

        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, plan.getNombre());
            ps.setInt(2, plan.getDuracionDias());
            ps.setBigDecimal(3, plan.getValor());
            ps.setBoolean(4, plan.isActivo());
            ps.setInt(5, plan.getIdPlan());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw e;
        }
    }
//Eliminar

    public void eliminar(int id) throws Exception {

        String sql = "DELETE FROM plan WHERE id_plan = ?";

        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
            throw e;
        }
    }
    

//Buscar por Id
    public Plan buscarPlanPorId(int id) throws Exception {

        Plan plan = null;

        String sql = "SELECT * FROM plan WHERE id_plan = ?";

        try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                plan = new Plan();

                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setNombre(rs.getString("nombre"));
                plan.setDuracionDias(rs.getInt("duracion_dias"));
                plan.setValor(rs.getBigDecimal("valor"));
                plan.setActivo(rs.getBoolean("activo"));
            }

        } catch (Exception e) {
            throw e;
        }
        return plan;
    }

}
