package Modelo;

import java.sql.Date;
import java.time.LocalDate;

public class Socio {

    private int idSocio;
    private String documento;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String correo;
    private LocalDate fechaNacimiento;
    private boolean activo;
    private Date fechaFin;
    private int diasRestantes;
    private EstadoMembresia estadoMembresia;
    private Membresia membresia;

    public Socio() {
    }

    public Socio(int idSocio, String documento, String nombres, String apellidos, String telefono, String correo, LocalDate fechaNacimiento, boolean activo, Date fechaFin, int diasRestantes, EstadoMembresia estadoMembresia, Membresia membresia) {
        this.idSocio = idSocio;
        this.documento = documento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.correo = correo;
        this.fechaNacimiento = fechaNacimiento;
        this.activo = activo;
        this.fechaFin = fechaFin;
        this.diasRestantes = diasRestantes;
        this.estadoMembresia = estadoMembresia;
        this.membresia = membresia;
    }
    
    

    public int getIdSocio() {
        return idSocio;
    }

    public void setIdSocio(int idSocio) {
        this.idSocio = idSocio;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public int getDiasRestantes() {
        return diasRestantes;
    }

    public void setDiasRestantes(int diasRestantes) {
        this.diasRestantes = diasRestantes;
    }

    public EstadoMembresia getEstadoMembresia() {
        return estadoMembresia;
    }

    public void setEstadoMembresia(EstadoMembresia estadoMembresia) {
        this.estadoMembresia = estadoMembresia;
    }

    public Membresia getMembresia() {
        return membresia;
    }

    public void setMembresia(Membresia membresia) {
        this.membresia = membresia;
    }
    

}
