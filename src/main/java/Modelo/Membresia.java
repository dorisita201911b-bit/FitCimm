package Modelo;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;

public class Membresia {

    private int idMembresia;
    private int idSocio;
    private int idPlan;

    private LocalDate fechaInicio;
    private LocalDate fechaFin;

    private BigDecimal valorPagado;
    private EstadoMembresia estado;

    // Para mostrar información en consultas
    private String documento;
    private String nombreSocio;
    private String nombrePlan;
    private Socio socio;
    private Plan plan;

    public Membresia() {
    }

    public Membresia(int idMembresia, int idSocio, int idPlan, LocalDate fechaInicio, LocalDate fechaFin, BigDecimal valorPagado, EstadoMembresia estado, String documento, String nombreSocio, String nombrePlan, Socio socio, Plan plan) {
        this.idMembresia = idMembresia;
        this.idSocio = idSocio;
        this.idPlan = idPlan;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.valorPagado = valorPagado;
        this.estado = estado;
        this.documento = documento;
        this.nombreSocio = nombreSocio;
        this.nombrePlan = nombrePlan;
        this.socio = socio;
        this.plan = plan;
    }
    

    

    

    public int getIdMembresia() {
        return idMembresia;
    }

    public void setIdMembresia(int idMembresia) {
        this.idMembresia = idMembresia;
    }

    public int getIdSocio() {
        return idSocio;
    }

    public void setIdSocio(int idSocio) {
        this.idSocio = idSocio;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public LocalDate getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }

    public BigDecimal getValorPagado() {
        return valorPagado;
    }

    public void setValorPagado(BigDecimal valorPagado) {
        this.valorPagado = valorPagado;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombreSocio() {
        return nombreSocio;
    }

    public void setNombreSocio(String nombreSocio) {
        this.nombreSocio = nombreSocio;
    }

    public String getNombrePlan() {
        return nombrePlan;
    }

    public void setNombrePlan(String nombrePlan) {
        this.nombrePlan = nombrePlan;
    }

    public EstadoMembresia getEstado() {
        return estado;
    }

    public void setEstado(EstadoMembresia estado) {
        this.estado = estado;
    }

    public Socio getSocio() {
        return socio;
    }

    public void setSocio(Socio socio) {
        this.socio = socio;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }
    

}