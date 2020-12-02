/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author javje
 */
public class Data {
    
    private Conexion con;
    
    public Data() throws SQLException, ClassNotFoundException{
        con = new Conexion("video");
    }
    
    public void agregarUser(User u) throws SQLException{
        String insert =  "INSERT INTO usuario VALUES(NULL,'"+u.getRut()+"','"+u.getNombre()+"','"+u.getFono()+"')";
        //String insert ="INSERT INTO usuario VALUES(NULL,'20.30.24-k','pepe paja cortez',5690203);";
        con.ejecutar(insert);
    }
    public List<User> getUser() throws SQLException{
        
        List<User> lista = new ArrayList<>();
                
        String query = "SELECT * FROM usuario";
       
        ResultSet rs = con.ejecutar(query);        
        
        while(rs.next()){
            
            User a = new User();   
            
            a.setNombre(rs.getString(2));
            a.setRut(rs.getString(3));
            a.setFono(rs.getInt(4));
            
            
                        
            lista.add(a);
        }

        con.close();
       
        return lista;
    }
}
