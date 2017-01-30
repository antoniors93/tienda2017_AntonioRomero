/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;
import es.albarregas.beans.Usuarios;
import java.util.ArrayList;

/**
 *
 * @author Antonio
 */
public interface IUsuariosDAO {
    
    public Usuarios getUsuarios(String UserName, String Password);
    public String insertUsuario(String UserName, String Password);
    public String updatePassword(Integer IdUsuario, String Password);
    public ArrayList<Usuarios> getAllUsers();

}
