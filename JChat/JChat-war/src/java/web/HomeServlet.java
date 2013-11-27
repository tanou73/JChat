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
            if (request.getParameter("action") != null) {
                long id = Long.valueOf(request.getParameter("id"));
                Chat chat = chatFacadeLocal.find(id);

                switch (request.getParameter("action")) {
                    case "lock":
                        if (request.getSession().getAttribute("login").equals(chat.getOwner())) {
                            chat.setState(Chat.State.CLOSED);
                            chatFacadeLocal.edit(chat);
                        }
                        break;
                    case "unlock":
                        if (request.getSession().getAttribute("login").equals(chat.getOwner())) {
                            chat.setState(Chat.State.OPEN);
                            chatFacadeLocal.edit(chat);
                        }
                        break;
                    case "delete":
                        if (request.getSession().getAttribute("login").equals(chat.getOwner())) {
                            chatFacadeLocal.remove(chat);
                        }
                        break;
                }
            }

            List<Chat> chats = chatFacadeLocal.findAll();
            request.setAttribute("chats", chats);
            request.setAttribute("states", Chat.State.values());
            request.setAttribute("user", request.getSession().getAttribute("login"));
            this.getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("isPost", true);

        if (request.getParameter("chatName") != null && request.getParameter("chatName").length() >= 3) {
            request.setAttribute("success", true);
            Chat chat = new Chat(request.getParameter("chatName"), String.valueOf(request.getSession().getAttribute("login")));
            chatFacadeLocal.create(chat);
        } else {
            request.setAttribute("success", false);
        }
        List<Chat> chats = chatFacadeLocal.findAll();
        request.setAttribute("chats", chats);
        request.setAttribute("states", Chat.State.values());
        request.setAttribute("user", request.getSession().getAttribute("login"));
        this.getServletContext().getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
    }
}
