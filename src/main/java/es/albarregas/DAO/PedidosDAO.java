/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Pedido;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Antonio
 */
public class PedidosDAO implements IPedidosDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public void insertPedido(Integer IdCliente) {
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("insert into pedidos (Fecha,Estado,IdCliente) values "
                    + "(now(),'n',"+IdCliente+")");
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
    }

    @Override
    public Pedido getPedido(Integer IdCliente) {
        Pedido pedido = null;
        
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from pedidos where IdCliente="+IdCliente+" and Estado='n'");
            if(resultado.next()){
                pedido=new Pedido();
                pedido.setIdPedido(resultado.getInt("IdPedido"));
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return pedido;
    }

    @Override
    public void deletePedido(Integer IdPedido) {
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("delete from pedidos where IdPedido="+IdPedido);
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
    }
    
    public void updatePedido(Integer IdPedido, String Estado ,Double BaseImponible){
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("update pedidos set Estado='"+Estado+"', BaseImponible="+BaseImponible+" where IdPedido="+IdPedido);
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
    }

    
}
