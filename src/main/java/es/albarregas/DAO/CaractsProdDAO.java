/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.CaractsProd;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class CaractsProdDAO implements ICaractsProdDAO{
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public ArrayList<CaractsProd> getCaractsProd(Integer IdProducto) {
        
        ArrayList<CaractsProd> caractsProd = null;
        CaractsProd caractProd= null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select Descripcion,Nombre from CaractProds inner join Caracteristicas using(IdCaracteristica) where IdProducto="+IdProducto);
            caractsProd= new ArrayList();
            while(resultado.next()){
              caractProd=new CaractsProd();
              caractProd.setNombre(resultado.getString("Nombre"));
              caractProd.setDescripcion(resultado.getString("Descripcion"));
              caractsProd.add(caractProd);
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return caractsProd;
    }
    
}
