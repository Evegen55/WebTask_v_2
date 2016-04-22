/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
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
    @Column(name = "accountID")
    private Integer accountID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "currentBalance")
    private double currentBalance;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "clientID", referencedColumnName = "clientID")
    @ManyToOne(optional = false)
    private Client clientID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "accountID")
    private Collection<CreditCards> creditCardsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clientAccountID")
    private Collection<PaymentsHistory> paymentsHistoryCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "beneficiarAccountID")
    private Collection<PaymentsHistory> paymentsHistoryCollection1;

    public BankAccount() {
    }

    public BankAccount(Integer accountID) {
        this.accountID = accountID;
    }

    public BankAccount(Integer accountID, double currentBalance) {
        this.accountID = accountID;
        this.currentBalance = currentBalance;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Client getClientID() {
        return clientID;
    }

    public void setClientID(Client clientID) {
        this.clientID = clientID;
    }

    @XmlTransient
    public Collection<CreditCards> getCreditCardsCollection() {
        return creditCardsCollection;
    }

    public void setCreditCardsCollection(Collection<CreditCards> creditCardsCollection) {
        this.creditCardsCollection = creditCardsCollection;
    }

    @XmlTransient
    public Collection<PaymentsHistory> getPaymentsHistoryCollection() {
        return paymentsHistoryCollection;
    }

    public void setPaymentsHistoryCollection(Collection<PaymentsHistory> paymentsHistoryCollection) {
        this.paymentsHistoryCollection = paymentsHistoryCollection;
    }

    @XmlTransient
    public Collection<PaymentsHistory> getPaymentsHistoryCollection1() {
        return paymentsHistoryCollection1;
    }

    public void setPaymentsHistoryCollection1(Collection<PaymentsHistory> paymentsHistoryCollection1) {
        this.paymentsHistoryCollection1 = paymentsHistoryCollection1;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + Objects.hashCode(this.accountID);
        return hash;
    }

    

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BankAccount)) {
            return false;
        }
        BankAccount other = (BankAccount) object;
        if ((this.accountID == null && other.accountID != null) || (this.accountID != null && !this.accountID.equals(other.accountID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BankAccount{" + "accountID=" + accountID + ", currentBalance=" + currentBalance + ", status=" + status + ", clientID=" + clientID + '}';
    }
}
