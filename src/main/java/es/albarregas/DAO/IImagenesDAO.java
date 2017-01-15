/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface IImagenesDAO {
    
    public ArrayList<String> getImagenes (Integer IdProducto);
}
