/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Evegen
 */
@Entity
@Table(name = "creditCards")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CreditCards.findAll", query = "SELECT c FROM CreditCards c"),
    @NamedQuery(name = "CreditCards.findByCardID", query = "SELECT c FROM CreditCards c WHERE c.cardID = :cardID"),
    @NamedQuery(name = "CreditCards.findByPan", query = "SELECT c FROM CreditCards c WHERE c.pan = :pan"),
    @NamedQuery(name = "CreditCards.findBySecureCode", query = "SELECT c FROM CreditCards c WHERE c.secureCode = :secureCode"),
    @NamedQuery(name = "CreditCards.findByValidDate", query = "SELECT c FROM CreditCards c WHERE c.validDate = :validDate"),
    @NamedQuery(name = "CreditCards.findByStatus", query = "SELECT c FROM CreditCards c WHERE c.status = :status")})
public class CreditCards implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "card_ID")
    private Integer cardID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "PAN")
    private String pan;
    @Basic(optional = false)
    @NotNull
    @Column(name = "secureCode")
    private int secureCode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "validDate")
    @Temporal(TemporalType.DATE)
    private Date validDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private boolean status;
    @JoinColumn(name = "account_ID", referencedColumnName = "account_ID")
    @ManyToOne(optional = false)
    private BankAccount accountID;
    @JoinColumn(name = "client_ID", referencedColumnName = "client_ID")
    @ManyToOne(optional = false)
    private Client clientID;

    public CreditCards() {
    }

    public CreditCards(Integer cardID) {
        this.cardID = cardID;
    }

    public CreditCards(Integer cardID, String pan, int secureCode, Date validDate, boolean status) {
        this.cardID = cardID;
        this.pan = pan;
        this.secureCode = secureCode;
        this.validDate = validDate;
        this.status = status;
    }

    public Integer getCardID() {
        return cardID;
    }

    public void setCardID(Integer cardID) {
        this.cardID = cardID;
    }

    public String getPan() {
        return pan;
    }

    public void setPan(String pan) {
        this.pan = pan;
    }

    public int getSecureCode() {
        return secureCode;
    }

    public void setSecureCode(int secureCode) {
        this.secureCode = secureCode;
    }

    public Date getValidDate() {
        return validDate;
    }

    public void setValidDate(Date validDate) {
        this.validDate = validDate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public BankAccount getAccountID() {
        return accountID;
    }

    public void setAccountID(BankAccount accountID) {
        this.accountID = accountID;
    }

    public Client getClientID() {
        return clientID;
    }

    public void setClientID(Client clientID) {
        this.clientID = clientID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cardID != null ? cardID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CreditCards)) {
            return false;
        }
        CreditCards other = (CreditCards) object;
        if ((this.cardID == null && other.cardID != null) || (this.cardID != null && !this.cardID.equals(other.cardID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CreditCards[ cardID=" + cardID + " ]";
    }
    
}
