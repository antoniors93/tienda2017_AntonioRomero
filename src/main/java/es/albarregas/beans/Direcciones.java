/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

/**
 *
 * @author Antonio
 */
public class Direcciones {
    
    private int IdDireccion;
    private int IdCliente;
    private String NombreDireccion;
    private String Direccion;
    private String Telefono;
    private String CodigoPostal;
    private String Localidad;
    private int IdPueblo;
    private String Provincia;

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public int getIdPueblo() {
        return IdPueblo;
    }

    public void setIdPueblo(int IdPueblo) {
        this.IdPueblo = IdPueblo;
    }

    public int getIdDireccion() {
        return IdDireccion;
    }

    public void setIdDireccion(int IdDireccion) {
        this.IdDireccion = IdDireccion;
    }

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
    }

    public String getNombreDireccion() {
        return NombreDireccion;
    }

    public void setNombreDireccion(String NombreDireccion) {
        this.NombreDireccion = NombreDireccion;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getCodigoPostal() {
        return CodigoPostal;
    }

    public void setCodigoPostal(String CodigoPostal) {
        this.CodigoPostal = CodigoPostal;
    }

    public String getLocalidad() {
        return Localidad;
    }

    public void setLocalidad(String Localidad) {
        this.Localidad = Localidad;
    }

    public String getProvincia() {
        return Provincia;
    }

    public void setProvincia(String Provincia) {
        this.Provincia = Provincia;
    }
}
