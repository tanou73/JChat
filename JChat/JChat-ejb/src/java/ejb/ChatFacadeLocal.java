/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author hugo
 */
@Local
public interface ChatFacadeLocal {

    void create(Chat chat);

    void edit(Chat chat);

    void remove(Chat chat);

    Chat find(Object id);

    List<Chat> findAll();

    List<Chat> findRange(int[] range);

    int count();
    
}
