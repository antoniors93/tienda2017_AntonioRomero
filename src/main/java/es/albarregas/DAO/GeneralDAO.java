/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.General;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Antonio
 */
public class GeneralDAO implements IGeneralDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public General getGeneral() {
        General general=null;
       try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from General");
            if(resultado.next()){
                general = new General();
                general.setGastosEnvio(resultado.getDouble("GastosEnvio"));
                general.setIva(resultado.getDouble("Iva"));
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return general;    
    }
    
}
