/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.LineaPedido;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface ILineasPedidoDAO {
    
    public void insertLineaPedido(LineaPedido lineapedido);
    public ArrayList<LineaPedido> getLineasPedido(Integer IdPedido);
    public void updateLineaPedido (Integer IdPedido, Integer NumeroLinea, Integer cantidad);
    public void deleteLineaPedido(Integer IdPedido,Integer NumeroLinea);
}
