/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Clientes;

/**
 *
 * @author Antonio
 */
public interface IClientesDAO {
    public Clientes getCliente(Integer IdCliente);
    public void insertCliente(Integer IdCliente);
    public void updateCliente(Clientes cliente);
}
