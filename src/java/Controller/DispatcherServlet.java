/*
 * Copyright 2016 Lartsev.
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
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lartsev
 */
@WebServlet(name = "DispatcherServlet", urlPatterns = {"/DispatcherServlet"})
public class DispatcherServlet extends HttpServlet {

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
        try {
            //Servlets
            String operation = request.getParameter("operation");
            String destinationCards = "./AllCards";
            String destinationAccounts = "./AllAccounts";
            String destinationPaymentsHist = "./PaymentsHist";
            String destinationBlockAccount = "./BlockAccount";
            String destinationAllBlockedAcc = "./AllBlockedAcc";
            //Paths
            String destinationAddFunds_path = "/simpleuser/addfunds.jsp";
            String destinationMakePayment_path = "/simpleuser/makepayment.jsp";
            
            if (operation.equalsIgnoreCase("my_cards")) {
                request.getRequestDispatcher(
                        response.encodeRedirectURL(destinationCards))
                        .forward(request, response);
            } else if (operation.equalsIgnoreCase("my bank accounts")) {
                response.sendRedirect(response.encodeRedirectURL(destinationAccounts));
            } else if (operation.equalsIgnoreCase("payments")) {
                response.sendRedirect(response.encodeRedirectURL(destinationPaymentsHist));
            } else if (operation.equalsIgnoreCase("add funds")) {
                //logic for redirect to addfunds.jsp with accountID attribute
                response.setContentType("text/html;charset=UTF-8");
                String accountID = request.getParameter("accountID");
                request.setAttribute("accountID", accountID);
                request.getRequestDispatcher(destinationAddFunds_path).forward(request, response);
            } else if (operation.equalsIgnoreCase("make payment")) {
                //logic for redirect to makepayment.jsp 
                response.setContentType("text/html;charset=UTF-8");
                String accountID = request.getParameter("accountID");
                request.setAttribute("accountID", accountID);
                request.getRequestDispatcher(destinationMakePayment_path).forward(request, response);
            } else if (operation.equalsIgnoreCase("block account")) {
                //logic fo invoke servlet with parameters
                String accountID = request.getParameter("accountID");
                response.sendRedirect(response.encodeRedirectURL(destinationBlockAccount + "?accountID=" + accountID));
            } else if (operation.equalsIgnoreCase("all blocked accounts")) {
                response.sendRedirect(response.encodeRedirectURL(destinationAllBlockedAcc));
            } else {
                response.setContentType("text/html;charset=UTF-8");
            }
        } catch (IOException | ServletException iOException) {
            System.out.println("Error occure DispatcherServlet" + "\t" + iOException);
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
