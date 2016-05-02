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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Evegen
 */
@Entity
@Table(name = "client")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Client.findAll", query = "SELECT c FROM Client c"),
    @NamedQuery(name = "Client.findByClientID", query = "SELECT c FROM Client c WHERE c.clientID = :clientID"),
    @NamedQuery(name = "Client.findByLastname", query = "SELECT c FROM Client c WHERE c.lastname = :lastname"),
    @NamedQuery(name = "Client.findByFirstname", query = "SELECT c FROM Client c WHERE c.firstname = :firstname"),
    @NamedQuery(name = "Client.findByTitleofcourtesy", query = "SELECT c FROM Client c WHERE c.titleofcourtesy = :titleofcourtesy"),
    @NamedQuery(name = "Client.findByPhone", query = "SELECT c FROM Client c WHERE c.phone = :phone"),
    @NamedQuery(name = "Client.findByEmail", query = "SELECT c FROM Client c WHERE c.email = :email"),
    @NamedQuery(name = "Client.findByPassword", query = "SELECT c FROM Client c WHERE c.password = :password"),
    @NamedQuery(name = "Client.findByTypeOfUser", query = "SELECT c FROM Client c WHERE c.typeOfUser = :typeOfUser")})
public class Client implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "client_ID")
    private Integer clientID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "lastname")
    private String lastname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "titleofcourtesy")
    private String titleofcourtesy;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Недопустимый формат номера телефона/факса (должен иметь формат xxx-xxx-xxxx)")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 24)
    @Column(name = "phone")
    private String phone;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Недопустимый адрес электронной почты")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "typeOfUser")
    private String typeOfUser;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clientID")
    private List<BankAccount> bankAccountList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clientID")
    private List<CreditCards> creditCardsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clientID")
    private List<PaymentsHistory> paymentsHistoryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "beneficiarClienstID")
    private List<PaymentsHistory> paymentsHistoryList1;

    public Client() {
    }

    public Client(Integer clientID) {
        this.clientID = clientID;
    }

    public Client(Integer clientID, String lastname, String firstname, 
            String titleofcourtesy, String phone, String email, 
            String password, String typeOfUser) {
        this.clientID = clientID;
        this.lastname = lastname;
        this.firstname = firstname;
        this.titleofcourtesy = titleofcourtesy;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.typeOfUser = typeOfUser;
    }

    public Integer getClientID() {
        return clientID;
    }

    public void setClientID(Integer clientID) {
        this.clientID = clientID;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getTitleofcourtesy() {
        return titleofcourtesy;
    }

    public void setTitleofcourtesy(String titleofcourtesy) {
        this.titleofcourtesy = titleofcourtesy;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTypeOfUser() {
        return typeOfUser;
    }

    public void setTypeOfUser(String typeOfUser) {
        this.typeOfUser = typeOfUser;
    }

    @XmlTransient
    public List<BankAccount> getBankAccountList() {
        return bankAccountList;
    }

    public void setBankAccountList(List<BankAccount> bankAccountList) {
        this.bankAccountList = bankAccountList;
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
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.clientID);
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
        final Client other = (Client) obj;
        if (!Objects.equals(this.lastname, other.lastname)) {
            return false;
        }
        if (!Objects.equals(this.firstname, other.firstname)) {
            return false;
        }
        if (!Objects.equals(this.clientID, other.clientID)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Client{" + "clientID=" + clientID + ", lastname=" + lastname 
                + ", firstname=" + firstname + ", titleofcourtesy=" + titleofcourtesy 
                + ", phone=" + phone + ", email=" + email + ", password=" + password 
                + ", typeOfUser=" + typeOfUser + ", bankAccountList=" + bankAccountList 
                + ", creditCardsList=" + creditCardsList + ", paymentsHistoryList=" 
                + paymentsHistoryList + ", paymentsHistoryList1=" + paymentsHistoryList1 + '}';
    }

    
    
}
