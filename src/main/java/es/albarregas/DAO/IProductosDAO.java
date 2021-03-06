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
    public void updateStock(Integer IdProducto, int cantidad);
    public ArrayList<Integer> getMasVendidos();
    public void pedirProductos(Integer Stock);
    public void bloquearProd(String denominacion, String bloqueado);
    public void ofertarProd(String denominacion, String oferta);
    public void cambiarPrecioProd(String denominacion, double precio);
}
