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
package servlet;

import DAO.AccountDAO;
import DAO.ClientDAO;
import java.io.IOException;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BankAccount;
import model.Client;
import util.CheckNumeric;

/**
 *
 * @author Evegen
 */
@WebServlet(name = "AddFunds", urlPatterns = {"/AddFunds"})
public class AddFunds extends HttpServlet {

    //@EJB
    @Inject
    private ClientDAO clientDAO;
    //@EJB
    @Inject
    private AccountDAO accountDAO;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String operation = request.getParameter("operation");
        String newBalance = request.getParameter("newBalance");
        String accountID = request.getParameter("accountID");
        
        Client client = clientDAO.getClientByEmail(request.getRemoteUser());
        int accountID_as_int = Integer.parseInt(accountID);
        
        if (CheckNumeric.isDoubleOrFloat(newBalance)) {
            double currentBalance_as_double = Double.parseDouble(newBalance);
            //getting prewious status
            boolean prevStatus = accountDAO.getAccountByID_asSingleAccount(accountID_as_int).getStatus();
        
            //create a new instance of BankAccount for using with EntityManager
            BankAccount bankAccount = new BankAccount(accountID_as_int,currentBalance_as_double, prevStatus, client);
        
            if (operation.equalsIgnoreCase("AddMoney")) {
                accountDAO.addMoneyWithHistory(bankAccount, client, currentBalance_as_double);
            }
            //logic for redirect back to addfunds.jsp 
            request.getRequestDispatcher("/simple_user_pages/addfunds.jsp").forward(request, response);
        } else {
            String flag = "not_digits";
            request.setAttribute("flag", flag);
            //logic for redirect back to addfunds.jsp with massage about trying 
            //add text instead balance 
            request.getRequestDispatcher("/simple_user_pages/addfunds.jsp").forward(request, response);
        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
