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
import model.BankAccount;
import model.Client;
import model.CreditCards;
import model.PaymentsHistory;

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

    /**
     * 
     * @param client_id
     * @return 
     */
    public List<BankAccount> getAllAccountsByClientID(int client_id) {
        Client find = em.find(Client.class, client_id);
        return find.getBankAccountList();
    }
    
    /**
     * 
     * @param client_id
     * @return 
     */
    public List<PaymentsHistory> getAllPaymetnsHistoryByClientID(int client_id) {
        Client client = em.find(Client.class, client_id);
        return client.getPaymentsHistoryList();
    }

    /**
     * 
     * @param client_id
     * @return 
     */
    public List<PaymentsHistory> getAllPaymetnsHistoryByBeneficiarID(int client_id) {
        Client client = em.find(Client.class, client_id);
        return client.getPaymentsHistoryList1();
    }
}
