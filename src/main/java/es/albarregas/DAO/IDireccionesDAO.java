/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Direcciones;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface IDireccionesDAO{
    
    public void insertarDireccion(Direcciones direccion);
    public ArrayList<Direcciones> getDirecciones(Integer IdCliente);
    public int getIdDireccion();
}
