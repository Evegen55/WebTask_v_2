/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Evegen
 */
@Entity
@Table(name = "paymentsHistory")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaymentsHistory.findAll", query = "SELECT p FROM PaymentsHistory p"),
    @NamedQuery(name = "PaymentsHistory.findByPaymentID", query = "SELECT p FROM PaymentsHistory p WHERE p.paymentID = :paymentID"),
    @NamedQuery(name = "PaymentsHistory.findByAmount", query = "SELECT p FROM PaymentsHistory p WHERE p.amount = :amount")})
public class PaymentsHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "payment_ID")
    private Integer paymentID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private double amount;
    @JoinColumn(name = "clientAccount_ID", referencedColumnName = "account_ID")
    @ManyToOne(optional = false)
    private BankAccount clientAccountID;
    @JoinColumn(name = "beneficiarAccount_ID", referencedColumnName = "account_ID")
    @ManyToOne(optional = false)
    private BankAccount beneficiarAccountID;
    @JoinColumn(name = "client_ID", referencedColumnName = "client_ID")
    @ManyToOne(optional = false)
    private Client clientID;
    @JoinColumn(name = "beneficiarClienst_ID", referencedColumnName = "client_ID")
    @ManyToOne(optional = false)
    private Client beneficiarClienstID;

    public PaymentsHistory() {
    }

    public PaymentsHistory(Integer paymentID) {
        this.paymentID = paymentID;
    }

    public PaymentsHistory(Integer paymentID, double amount) {
        this.paymentID = paymentID;
        this.amount = amount;
    }

    public PaymentsHistory(double amount, BankAccount clientAccountID, 
            BankAccount beneficiarAccountID, Client clientID, Client beneficiarClienstID) {
        this.amount = amount;
        this.clientAccountID = clientAccountID;
        this.beneficiarAccountID = beneficiarAccountID;
        this.clientID = clientID;
        this.beneficiarClienstID = beneficiarClienstID;
    }

    
    public Integer getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(Integer paymentID) {
        this.paymentID = paymentID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public BankAccount getClientAccountID() {
        return clientAccountID;
    }

    public void setClientAccountID(BankAccount clientAccountID) {
        this.clientAccountID = clientAccountID;
    }

    public BankAccount getBeneficiarAccountID() {
        return beneficiarAccountID;
    }

    public void setBeneficiarAccountID(BankAccount beneficiarAccountID) {
        this.beneficiarAccountID = beneficiarAccountID;
    }

    public Client getClientID() {
        return clientID;
    }

    public void setClientID(Client clientID) {
        this.clientID = clientID;
    }

    public Client getBeneficiarClienstID() {
        return beneficiarClienstID;
    }

    public void setBeneficiarClienstID(Client beneficiarClienstID) {
        this.beneficiarClienstID = beneficiarClienstID;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + Objects.hashCode(this.paymentID);
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
        final PaymentsHistory other = (PaymentsHistory) obj;
        if (Double.doubleToLongBits(this.amount) != Double.doubleToLongBits(other.amount)) {
            return false;
        }
        if (!Objects.equals(this.paymentID, other.paymentID)) {
            return false;
        }
        if (!Objects.equals(this.clientAccountID, other.clientAccountID)) {
            return false;
        }
        if (!Objects.equals(this.beneficiarAccountID, other.beneficiarAccountID)) {
            return false;
        }
        if (!Objects.equals(this.clientID, other.clientID)) {
            return false;
        }
        if (!Objects.equals(this.beneficiarClienstID, other.beneficiarClienstID)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "PaymentsHistory{" + "paymentID=" + paymentID + ", amount=" + amount 
                + ", clientAccountID=" + clientAccountID + ", beneficiarAccountID=" 
                + beneficiarAccountID + ", clientID=" + clientID + ", beneficiarClienstID=" 
                + beneficiarClienstID + '}';
    }
    
    
}
