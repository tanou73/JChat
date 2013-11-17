/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import ejb.Chat;
import ejb.ChatFacadeLocal;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hugo
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {


    @EJB
    ChatFacadeLocal chatFacadeLocal;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("isPost", false);
        if (request.getSession().getAttribute("login") == null) {
            response.sendRedirect(response.encodeRedirectURL("login"));
        } else {
            List<Chat> chats = chatFacadeLocal.findAll();
            request.setAttribute("chats", chats);
            this.getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("isPost", true);
        
        if (request.getParameter("chatName") != null && request.getParameter("chatName").length() >= 3) {
            request.setAttribute("success", true);
            // créer un chat
        } else {
            request.setAttribute("success", false);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
    }

}
