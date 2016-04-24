/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
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
        int hash = 0;
        hash += (paymentID != null ? paymentID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentsHistory)) {
            return false;
        }
        PaymentsHistory other = (PaymentsHistory) object;
        if ((this.paymentID == null && other.paymentID != null) || (this.paymentID != null && !this.paymentID.equals(other.paymentID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.PaymentsHistory[ paymentID=" + paymentID + " ]";
    }
    
}
