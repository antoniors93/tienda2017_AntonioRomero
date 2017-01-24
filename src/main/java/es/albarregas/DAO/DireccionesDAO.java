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
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class DireccionesDAO implements IDireccionesDAO {

    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public void insertarDireccion(Direcciones direccion) {
        try {
            sentencia = conexion.getConnection().createStatement();
            System.out.println("insert into Direcciones (IdDireccion,IdCliente,NombreDireccion,Direccion,CodigoPostal,IdPueblo,Telefono)"
                    + " values (" + direccion.getIdDireccion() + ", " + direccion.getIdCliente() + ", '" + direccion.getNombreDireccion() + "','"
                    + direccion.getDireccion() + "','" + direccion.getCodigoPostal() + "', " + direccion.getIdPueblo() + ", '" + direccion.getTelefono() + "')");
            sentencia.executeUpdate("insert into Direcciones (IdDireccion,IdCliente,NombreDireccion,Direccion,CodigoPostal,IdPueblo,Telefono)"
                    + " values (" + direccion.getIdDireccion() + ", " + direccion.getIdCliente() + ", '" + direccion.getNombreDireccion() + "','"
                    + direccion.getDireccion() + "','" + direccion.getCodigoPostal() + "', " + direccion.getIdPueblo() + ", '" + direccion.getTelefono() + "')");
        } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
        }
        ConnectionFactory.closeConnection();
    }

    @Override
    public ArrayList<Direcciones> getDirecciones(Integer IdCliente) {
        ArrayList<Direcciones> direcciones = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from Direcciones where IdCliente=" + IdCliente);
            direcciones=new ArrayList();
            while(resultado.next()){
                Direcciones direccion = new Direcciones();
                direccion.setIdCliente(resultado.getInt("IdCliente"));
                direccion.setIdDireccion(resultado.getInt("IdDireccion"));
                direccion.setNombreDireccion(resultado.getString("NombreDireccion"));
                direccion.setDireccion(resultado.getString("Direccion"));
                direccion.setCodigoPostal(resultado.getString("CodigoPostal"));
                direccion.setIdPueblo(resultado.getInt("IdPueblo"));
                direccion.setTelefono(resultado.getString("Telefono"));
                direcciones.add(direccion);
            }
        } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
        }
        ConnectionFactory.closeConnection();
        return direcciones;
    }

    @Override
    public int getIdDireccion() {
        int idDireccion = 0;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select count('IdDireccion') from direcciones");
            if (resultado.next()) {
                idDireccion = resultado.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
        }
        ConnectionFactory.closeConnection();
        return idDireccion;
    }
}


