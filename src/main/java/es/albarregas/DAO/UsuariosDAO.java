/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import es.albarregas.beans.Usuarios;

/**
 *
 * @author Antonio
 */
public class UsuariosDAO implements IUsuariosDAO {
    
    Statement sentencia = null;
    ResultSet resultado = null;
    ConnectionFactory conexion = null;

    @Override
    public Usuarios getUsuarios(String UserName) {
        Usuarios usuario=null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from usuarios where UserName='"+UserName+"'");
            if(resultado.next()){
              usuario=new Usuarios();
              usuario.setIdUsuario(resultado.getInt("IdUsuario"));
              usuario.setUserName(resultado.getString("UserName"));
              usuario.setClave(resultado.getString("Clave"));
              usuario.setUltimoAcceso(resultado.getTimestamp("UltimoAcceso"));
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return usuario;
        }

    @Override
    public String insertUsuario(String UserName, String Password) {
        String mensaje = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("insert into Usuarios (UserName,Clave,UltimoAcceso,Tipo) values "
                    + "('"+UserName+"','"+Password+"',now(),'u')");
                mensaje = "SUCCESS";
            } catch (SQLException e) {
                mensaje = "FAILURE";
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return mensaje;
    }
    }
    
