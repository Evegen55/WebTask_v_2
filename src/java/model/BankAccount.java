/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Evegen
 */
@Entity
@Table(name = "bankAccount")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BankAccount.findAll", query = "SELECT b FROM BankAccount b"),
    @NamedQuery(name = "BankAccount.findByAccountID", query = "SELECT b FROM BankAccount b WHERE b.accountID = :accountID"),
    @NamedQuery(name = "BankAccount.findByCurrentBalance", query = "SELECT b FROM BankAccount b WHERE b.currentBalance = :currentBalance"),
    @NamedQuery(name = "BankAccount.findByStatus", query = "SELECT b FROM BankAccount b WHERE b.status = :status")})
public class BankAccount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "account_ID")
    private Integer accountID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "currentBalance")
    private double currentBalance;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private boolean status;
    @JoinColumn(name = "client_ID", referencedColumnName = "client_ID")
    @ManyToOne(optional = false)
    private Client clientID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "accountID")
    private List<CreditCards> creditCardsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clientAccountID")
    private List<PaymentsHistory> paymentsHistoryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "beneficiarAccountID")
    private List<PaymentsHistory> paymentsHistoryList1;

    public BankAccount() {
    }

    public BankAccount(Integer accountID) {
        this.accountID = accountID;
    }

    public BankAccount(Integer accountID, double currentBalance, boolean status) {
        this.accountID = accountID;
        this.currentBalance = currentBalance;
        this.status = status;
    }

    public BankAccount(Integer accountID, double currentBalance, boolean status, Client clientID) {
        this.accountID = accountID;
        this.currentBalance = currentBalance;
        this.status = status;
        this.clientID = clientID;
    }
    
    public Integer getAccountID() {
        return accountID;
    }

    public void setAccountID(Integer accountID) {
        this.accountID = accountID;
    }

    public double getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(double currentBalance) {
        this.currentBalance = currentBalance;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Client getClientID() {
        return clientID;
    }

    public void setClientID(Client clientID) {
        this.clientID = clientID;
    }

    @XmlTransient
    public List<CreditCards> getCreditCardsList() {
        return creditCardsList;
    }

    public void setCreditCardsList(List<CreditCards> creditCardsList) {
        this.creditCardsList = creditCardsList;
    }

    @XmlTransient
    public List<PaymentsHistory> getPaymentsHistoryList() {
        return paymentsHistoryList;
    }

    public void setPaymentsHistoryList(List<PaymentsHistory> paymentsHistoryList) {
        this.paymentsHistoryList = paymentsHistoryList;
    }

    @XmlTransient
    public List<PaymentsHistory> getPaymentsHistoryList1() {
        return paymentsHistoryList1;
    }

    public void setPaymentsHistoryList1(List<PaymentsHistory> paymentsHistoryList1) {
        this.paymentsHistoryList1 = paymentsHistoryList1;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + Objects.hashCode(this.accountID);
        hash = 83 * hash + Objects.hashCode(this.clientID);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final BankAccount other = (BankAccount) obj;
        if (!Objects.equals(this.accountID, other.accountID)) {
            return false;
        }
        if (!Objects.equals(this.clientID, other.clientID)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BankAccount{" + "accountID=" + accountID + ", currentBalance=" 
                + currentBalance + ", status=" + status + ", clientID=" + clientID 
                + ", creditCardsList=" + creditCardsList + ", paymentsHistoryList=" 
                + paymentsHistoryList + ", paymentsHistoryList1=" + paymentsHistoryList1 + '}';
    }

   
    
}
