/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Clientes;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Antonio
 */
public class ClientesDAO implements IClientesDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public Clientes getCliente(Integer IdCliente) {
        
        Clientes cliente=null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from clientes where IdCliente='"+IdCliente+"'");
            if(resultado.next()){
                cliente = new Clientes();
                cliente.setIdCliente(resultado.getInt("IdCliente"));
                cliente.setNombre(resultado.getString("Nombre"));
                cliente.setApellidos(resultado.getString("Apellidos"));
                cliente.setNIF(resultado.getString("NIF"));
                cliente.setFechaNacimiento(resultado.getDate("FechaNacimiento"));
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return cliente;
    }

    @Override
    public void insertCliente(Integer IdCliente) {
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("insert into clientes (IdCliente,Nombre,Apellidos,NIF,FechaAlta) values "
                    + "("+IdCliente+",'vacío','vacío','vacío',now())");
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
    }

    @Override
    public void updateCliente(Clientes cliente) {
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("update clientes set Nombre='"+cliente.getNombre()+"', Apellidos='"+cliente.getApellidos()+"', "
                    +"NIF='"+cliente.getNIF()+"', FechaNacimiento='"+cliente.getFechaNacimiento()+"' where IdCliente="+cliente.getIdCliente());
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
    }
    
}
