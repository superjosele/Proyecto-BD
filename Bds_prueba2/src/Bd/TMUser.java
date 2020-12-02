/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bd;

import java.util.List;
import javax.swing.table.AbstractTableModel;

public class TMUser extends AbstractTableModel{
    private List<User>lista;
    
    
    public TMUser (List<User>lista){
        this.lista = lista;
    }
    @Override
    public int getRowCount() {
        return lista.size();
    }

    @Override
    public int getColumnCount() {
        return 3;
    }
    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        User a = lista.get(rowIndex);
        
        switch(columnIndex){
            case 0: 
                return a.getRut();
            case 1:
                return a.getNombre();
            default:
                return a.getFono();
        }
    }
    
    public String getColumnName(int column) {
        switch(column){
            case 0: 
                return "Rut";
            case 1:
                return "Nombre";
            default:
                return "Telefono";
            
        }
       
    }
    
}
