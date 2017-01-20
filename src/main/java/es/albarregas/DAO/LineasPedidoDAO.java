/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.LineaPedido;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class LineasPedidoDAO implements ILineasPedidoDAO{

    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;
    
    @Override
    public void insertLineaPedido(LineaPedido lineapedido) {
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("insert into LineasPedidos (IdPedido,NumeroLinea,IdProducto,Cantidad) values "
                    + "("+lineapedido.getIdPedido()+","+lineapedido.getNumeroLinea()+","+lineapedido.getIdProducto()+",1)");
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
    }

    @Override
    public ArrayList<LineaPedido> getLineasPedido(Integer IdPedido) {
        LineaPedido lineaPedido = null;
        ArrayList<LineaPedido> lineasPedido = new ArrayList();
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from lineaspedidos where IdPedido="+IdPedido);
            while(resultado.next()){
                lineaPedido=new LineaPedido();
                lineaPedido.setIdPedido(resultado.getInt("IdPedido"));
                lineaPedido.setNumeroLinea(resultado.getInt("NumeroLinea"));
                lineaPedido.setIdProducto(resultado.getInt("IdProducto"));
                lineaPedido.setCantidad(resultado.getInt("Cantidad"));
                lineasPedido.add(lineaPedido);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return lineasPedido;
    }
    
}
