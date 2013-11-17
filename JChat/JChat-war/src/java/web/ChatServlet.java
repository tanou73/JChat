/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import ejb.Chat;
import ejb.ChatFacadeLocal;
import java.io.IOException;
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
@WebServlet(name = "ChatServlet", urlPatterns = {"/chat"})
public class ChatServlet extends HttpServlet {

    @EJB
    ChatFacadeLocal chatFacadeLocal;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("login") == null) {
            response.sendRedirect(response.encodeRedirectURL("login"));
        } else {
            long id = Long.valueOf(request.getParameter("id"));
            Chat chat = chatFacadeLocal.find(id);
            switch (request.getParameter("action")) {
                case "enter":
                    request.setAttribute("chat", chat);
                    request.setAttribute("username", request.getSession().getAttribute("login"));
                    this.getServletContext().getRequestDispatcher("/WEB-INF/chat.jsp").forward(request, response);
                    break;
                case "delete":

                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
