/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.CodigoPostal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class CodigoPostalDAO implements ICodigoPostalDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public ArrayList<CodigoPostal> getCodigosPostales(String nombrePueblo) {
    ArrayList<CodigoPostal> codsPostales = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select IdPueblo, CodigoPostal from Pueblos where Nombre='"+nombrePueblo+"'");
            codsPostales= new ArrayList();
            while(resultado.next()){
                CodigoPostal codPostal=new CodigoPostal();
                codPostal.setIdPueblo(resultado.getInt("IdPueblo"));
                codPostal.setCodigoPostal(resultado.getString("CodigoPostal"));
                codsPostales.add(codPostal);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return codsPostales;    
    }

    @Override
    public String getCodigoPostal(Integer idPueblo) {
    String codPostal = "";
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select CodigoPostal from Pueblos where IdPueblo="+idPueblo);
            if(resultado.next()){
                codPostal=resultado.getString(1);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return codPostal;     }
    
}
