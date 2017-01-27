/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Pedido;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface IPedidosDAO {
    
    public void insertPedido(Integer IdCliente);
    public Pedido getPedido(Integer IdCliente);
    public void deletePedido(Integer IdPedido);
    public void updatePedido(Integer IdPedido, String Estado, Double BaseImponible);
    public ArrayList<Pedido> getPedidos(Integer IdCliente);
}
