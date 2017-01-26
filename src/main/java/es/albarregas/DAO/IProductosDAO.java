/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;
import es.albarregas.beans.Productos;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface IProductosDAO {
    
    public ArrayList<Productos> getProductos();
    public Productos getProducto(Integer IdProducto);
    public void updatePrecio(Integer IdProducto, int cantidad);
}
