/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Client;
import model.CreditCards;

/**
 *
 * @author Evegen
 */
@Stateless
public class ClientDAO {
    
    @PersistenceContext
    private EntityManager em;
    
    /**
     * This method return client by using EntityManager
     * @param email
     * @return 
     */
    public Client getClientByEmail(String email) {
        List<Client> resultList = em.createNamedQuery("Client.findByEmail")
                .setParameter("email", email)
                .getResultList();
        if (resultList.size()>0) {
            return resultList.get(0);
        } else {
            return null;  
        }
    }
    
    /**
     * 
     * @param client_id
     * @return 
     */
    public List<CreditCards> getAllCardsByClientID(int client_id) {
        Client find = em.find(Client.class, client_id);
        return find.getCreditCardsList();
    }
}
