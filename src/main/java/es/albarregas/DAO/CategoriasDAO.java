/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;
import es.albarregas.beans.Categorias;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class CategoriasDAO implements ICategoriasDAO{

    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;
    
    @Override
    public ArrayList<Categorias> getCategorias() {
        ArrayList<Categorias> categorias = null;
        Categorias categoria = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from Categorias");
            categorias= new ArrayList();
            while(resultado.next()){
              categoria=new Categorias();
              categoria.setNombre(resultado.getString("Nombre"));
              categorias.add(categoria);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return categorias;
    }

}
