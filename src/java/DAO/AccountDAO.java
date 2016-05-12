/*
 * Copyright 2016 Evegen.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package DAO;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.BankAccount;
import model.Client;
import model.PaymentsHistory;

/**
 *
 * @author Evegen
 */
@Stateless
public class AccountDAO {

    @PersistenceContext 
    private EntityManager em;
    
    /**
     * 
     * @param ID_req_int
     * @return 
     */
    public BankAccount getAccountByID_asSingleAccount(int ID_req_int) {
        List resultList = em.createNamedQuery("BankAccount.findByAccountID")
                .setParameter("accountID", ID_req_int)
                .getResultList();
        BankAccount ba = new BankAccount();
        if (resultList.size()>0) {
            ba = (BankAccount) resultList.get(0);
        }
        return ba;
    }

    /**
     * 
     * @param bankAccount
     * @param client
     * @param amount 
     */
    public void addMoneyWithHistory(BankAccount bankAccount, Client client, double amount) {
        addMoney(bankAccount);
        writeHistory(bankAccount, bankAccount, client, client, amount);
    }

    private void addMoney(BankAccount bankAccount) {
        BankAccount old_bankAccount = getAccountByID_asSingleAccount(bankAccount.getAccountID());
        double old_amount = old_bankAccount.getCurrentBalance();
        double new_amount = bankAccount.getCurrentBalance();
        bankAccount.setCurrentBalance(old_amount+new_amount);
        em.merge(bankAccount);
        em.flush();
    }

    private void writeHistory(BankAccount bankAccountFrom, BankAccount bankAccountTo, Client clientFrom, Client clientTo, double amount) {
        
        PaymentsHistory ph = new PaymentsHistory(amount, bankAccountFrom, bankAccountTo, clientFrom, clientTo);
        
        int paymentID = 0;
        List resultList = em.createNamedQuery("PaymentsHistory.findAll").getResultList();
        if (resultList.size()>0) {
            PaymentsHistory phOld = (PaymentsHistory) resultList.get(resultList.size()-1);
            paymentID = phOld.getPaymentID();
        }
        ph.setPaymentID(paymentID+1);
        em.persist(ph);
        em.flush();
        
        }

    /**
     * 
     * @param accountID_as_int 
     */
    public void setBlockToAcount(int accountID_as_int) {
        BankAccount bankAccountOld = getAccountByID_asSingleAccount(accountID_as_int);
        bankAccountOld.setStatus(true);
        em.merge(bankAccountOld);
        em.flush();
    }

    /**
     * 
     * @param bankAccountFrom
     * @param bankAccountTo
     * @param client
     * @param beneficiar
     * @param amount 
     */
    public void makePay(BankAccount bankAccountFrom, BankAccount bankAccountTo, Client client, Client beneficiar, double amount) {
        substractionMoney(bankAccountFrom);
        addMoney(bankAccountTo);
        writeHistory(bankAccountFrom, bankAccountTo, client, beneficiar, amount);
    }

    private void substractionMoney(BankAccount bankAccount) {
        BankAccount old_bankAccount = getAccountByID_asSingleAccount(bankAccount.getAccountID());
        double old_amount = old_bankAccount.getCurrentBalance();
        double new_amount = bankAccount.getCurrentBalance();
        bankAccount.setCurrentBalance(old_amount-new_amount);
        em.merge(bankAccount);
        em.flush();
    }

}
