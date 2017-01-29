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
    public Usuarios getUsuarios(String Email, String Password) {
        Usuarios usuario=null;
        try {
            sentencia = conexion.getConnection().createStatement();
            resultado = sentencia.executeQuery("select * from usuarios where Email='"+Email+"' and clave=PASSWORD('"+Password+"')");
            if(resultado.next()){
              usuario=new Usuarios();
              usuario.setIdUsuario(resultado.getInt("IdUsuario"));
              usuario.setEmail(resultado.getString("Email"));
              usuario.setClave(resultado.getString("Clave"));
              usuario.setTipo(resultado.getString("Tipo").charAt(0));
              usuario.setBloqueado(resultado.getString("Bloqueado").charAt(0));
            }
            } catch (SQLException e) {
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return usuario;
        }

    @Override
    public String insertUsuario(String Email, String Password) {
        String mensaje = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("insert into Usuarios (Email,Clave,UltimoAcceso,Tipo) values "
                    + "('"+Email+"', PASSWORD('"+Password+"'),now(),'u')");
                mensaje = "SUCCESS";
            } catch (SQLException e) {
                mensaje = "FAILURE";
            System.out.println("Problemas al visualizar");
            e.printStackTrace();
            }
        ConnectionFactory.closeConnection();
        return mensaje;
    }

    @Override
    public String updatePassword(Integer IdUsuario, String Password) {
        String mensaje = null;
        try {
            sentencia = conexion.getConnection().createStatement();
            sentencia.executeUpdate("update Usuarios set clave=PASSWORD('"+Password+"') where IdUsuario="+IdUsuario);
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
    
