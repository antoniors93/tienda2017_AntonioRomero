/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import java.util.ArrayList;
import es.albarregas.beans.Provincias;

/**
 *
 * @author Antonio
 */
public interface IProvinciasDAO {
    
    public ArrayList<Provincias> getProvincias();
    public String getProvincia(Integer IdProvincia);
    
}
