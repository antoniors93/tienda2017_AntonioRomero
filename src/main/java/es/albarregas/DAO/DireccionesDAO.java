/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Direcciones;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Antonio
 */
public class DireccionesDAO implements IDireccionesDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public void insertarDireccion(Direcciones direccion) {
try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("insert into Direcciones (IdDireccion,IdCliente,NombreDireccion,Direccion,CodigoPostal,IdPueblo,Telefono)"
                    + " values ("+direccion.getIdDireccion()+", "+direccion.getIdCliente()+", '"+direccion.getNombreDireccion()+"','"+
            direccion.getDireccion()+"','"+direccion.getCodigoPostal()+"', "+direccion.getIdPueblo()+", '"+direccion.getTelefono()+"')");
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();    }
    
}
