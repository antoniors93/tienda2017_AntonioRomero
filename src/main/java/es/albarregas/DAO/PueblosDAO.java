/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Pueblos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class PueblosDAO implements IPueblosDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;
    
    @Override
    public ArrayList<Pueblos> getPueblos(Integer IdProvincia) {
        ArrayList<Pueblos> pueblos = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select distinct Nombre from Pueblos where IdProvincia="+IdProvincia+" order by 1");
            pueblos= new ArrayList();
            while(resultado.next()){
                Pueblos pueblo= new Pueblos();
                pueblo.setNombrePueblo(resultado.getString("Nombre"));
                pueblos.add(pueblo);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return pueblos;
    }
    
}
