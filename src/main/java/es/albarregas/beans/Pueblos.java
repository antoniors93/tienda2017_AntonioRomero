/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

import java.io.Serializable;

/**
 *
 * @author Antonio
 */
public class Pueblos implements Serializable{
    
    private int IdPueblo;
    private int IdProvincia;
    private String CodigoPostal;
    private String NombrePueblo;

    public int getIdPueblo() {
        return IdPueblo;
    }

    public void setIdPueblo(int IdPueblo) {
        this.IdPueblo = IdPueblo;
    }

    public String getCodigoPostal() {
        return CodigoPostal;
    }

    public void setCodigoPostal(String CodigoPostal) {
        this.CodigoPostal = CodigoPostal;
    }

    public int getIdProvincia() {
        return IdProvincia;
    }

    public void setIdProvincia(int IdProvincia) {
        this.IdProvincia = IdProvincia;
    }

    public String getNombrePueblo() {
        return NombrePueblo;
    }

    public void setNombrePueblo(String NombrePueblo) {
        this.NombrePueblo = NombrePueblo;
    }
}
