/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class ImagenesDAO implements IImagenesDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public ArrayList<String> getImagenes(Integer IdProducto) {
        ArrayList<String> imagenes = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select Image from Imagenes where IdProducto="+IdProducto);
            imagenes= new ArrayList();
            while(resultado.next()){
              imagenes.add(resultado.getString("Image"));
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return imagenes;
    }
    
}
