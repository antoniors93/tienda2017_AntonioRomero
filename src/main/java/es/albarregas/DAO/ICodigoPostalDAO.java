/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.CodigoPostal;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface ICodigoPostalDAO {
    
    public ArrayList<CodigoPostal> getCodigosPostales(String nombrePueblo);
    public String getCodigoPostal(Integer idPueblo);
}
