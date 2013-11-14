/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import ejb.Chat;
import ejb.ChatFacadeLocal;
import ejb.Message;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @EJB
    ChatFacadeLocal chatFacadeLocal;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*    
         //creer un chat
         Chat chat = new Chat();
         chat.setName("the cat niggaaaaaaaa");

         Message message = new Message();
         message.setAuthor("Maxime");
         message.setContent("hey bitsch");
         message.setTimestamp(5154546);

         Message message2 = new Message();
         message2.setAuthor("Maxime");
         message2.setContent("hey wastup");
         message2.setTimestamp(51545484);


         chat.addMessage(message);
         chat.addMessage(message2);
         chatFacadeLocal.create(chat);
        
        
     
        //regarder dans le chat, modifier les message, sauver le tout -> 1 ligne
         List<Chat> chats = chatFacadeLocal.findAll();
         for (Chat chat : chats) {
         System.out.println(chat.toString());
         System.out.println("messages:");
         for (Message message : chat.getMessages()) {
         message.setContent(message.getContent() + "|");
         System.out.println("--" + message.toString());
         }
         chatFacadeLocal.edit(chat);
         }
                */

        this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("login") != null && !request.getParameter("login").equals("")) {
            request.getSession().setAttribute("login", request.getParameter("login"));
            response.sendRedirect(response.encodeRedirectURL("home"));
        }
    }
}
