/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.CreditCards;
import util.EJBLoggerAOPExample;

/**
 *
 * @author Evegen
 */
@Stateless
public class CardDAO {
    
    @PersistenceContext 
    private EntityManager em;

    /**
     * 
     * @param ID_req_int
     * @return 
     */
    @Interceptors(EJBLoggerAOPExample.class)
    public CreditCards getCardByID_asSingleCard(int ID_req_int) {
        List resultList = em.createNamedQuery("CreditCards.findByCardID")
                .setParameter("cardID", ID_req_int)
                .getResultList();
        CreditCards card = new CreditCards();
        if (resultList.size()>0) {
            card = (CreditCards) resultList.get(0);
        }
        return card;
    }
    
    
}
