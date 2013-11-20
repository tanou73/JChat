/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import ejb.Chat;
import ejb.ChatFacadeLocal;
import ejb.Message;
import java.io.IOException;
import java.util.Date;
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
                case "refresh":
                    List<Message> lastMessages = chat.getMessages(Long.valueOf(request.getParameter("lastMessageID")));
                    if (lastMessages.size() > 0) {
                        long lastId = lastMessages.get(lastMessages.size() - 1).getId();
                        request.setAttribute("messages", lastMessages);
                        request.setAttribute("lastId", lastId);
                        this.getServletContext().getRequestDispatcher("/WEB-INF/lastMessages.jsp").forward(request, response);
                    }
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long id = Long.valueOf(request.getParameter("chatId"));
        Chat chat = chatFacadeLocal.find(id);
        String content = request.getParameter("messageContent");
        String author = String.valueOf(request.getSession().getAttribute("login"));
        chat.addMessage(new Message(author, new Date().getTime() / 1000l, content, chat));
        chatFacadeLocal.edit(chat);
    }
}
