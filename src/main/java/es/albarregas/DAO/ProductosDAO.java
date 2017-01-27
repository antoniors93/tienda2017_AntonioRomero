/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Productos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public class ProductosDAO implements IProductosDAO {

    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public ArrayList<Productos> getProductos() {
        ArrayList<Productos> productos = null;
        Productos producto = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select IdProducto,Productos.Denominacion,Descripcion,PrecioUnitario,Marcas.Denominacion,Nombre,"
                    + "(select Image from Imagenes where Imagenes.IdProducto=Productos.IdProducto limit 1) as Imagen,Oferta,Stock"
                    + " from Productos inner join Marcas using(IdMarca) inner join Categorias using(IdCategoria)");
            productos = new ArrayList();
            while (resultado.next()) {
                producto = new Productos();
                producto.setIdProducto(resultado.getInt("IdProducto"));
                producto.setDenominacion(resultado.getString("Productos.Denominacion"));
                producto.setDescripcion(resultado.getString("Descripcion"));
                producto.setPrecioUnitario(resultado.getDouble("PrecioUnitario"));
                producto.setMarca(resultado.getString("Marcas.Denominacion"));
                producto.setCategoria(resultado.getString("Nombre"));
                producto.setImagen(resultado.getString("Imagen"));
                producto.setOferta(resultado.getString("Oferta"));
                producto.setStock(resultado.getInt("Stock"));
                productos.add(producto);
            }
        } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
        }
        ConnectionFactory.closeConnection();
        return productos;
    }

    @Override
    public Productos getProducto(Integer IdProducto) {
        Productos producto = null;

        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select IdProducto,Productos.Denominacion,Descripcion,PrecioUnitario,Marcas.Denominacion,"
                    + "Nombre,Oferta,Stock from Productos inner join Marcas using(IdMarca) inner join Categorias using(IdCategoria) "
                    + "where IdProducto="+IdProducto);
            if (resultado.next()) {
                producto = new Productos();
                producto.setIdProducto(resultado.getInt("IdProducto"));
                producto.setDenominacion(resultado.getString("Productos.Denominacion"));
                producto.setDescripcion(resultado.getString("Descripcion"));
                producto.setPrecioUnitario(resultado.getDouble("PrecioUnitario"));
                producto.setMarca(resultado.getString("Marcas.Denominacion"));
                producto.setCategoria(resultado.getString("Nombre"));
                producto.setOferta(resultado.getString("Oferta"));
                producto.setStock(resultado.getInt("Stock"));
            }
        } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
        }
        ConnectionFactory.closeConnection();
        return producto;
    }

    @Override
    public void updateStock(Integer IdProducto, int cantidad) {
       try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("update Productos set stock="+cantidad+" where IdProducto="+IdProducto);
        } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
        }
        ConnectionFactory.closeConnection();
    }

}
