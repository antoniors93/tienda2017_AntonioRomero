/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Provincias;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class ProvinciasDAO implements IProvinciasDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public ArrayList<Provincias> getProvincias() {
        ArrayList<Provincias> provincias = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from Provincias");
            provincias= new ArrayList();
            while(resultado.next()){
                Provincias provincia = new Provincias();
                provincia.setIdProvincia(resultado.getInt("IdProvincia"));
                provincia.setNombreProvincia(resultado.getString("Nombre"));
                provincias.add(provincia);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return provincias;
    }
    
}
