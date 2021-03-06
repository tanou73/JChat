<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>



<t:layout title="Chat">
    <jsp:attribute name="js">
        <script type="text/javascript">

            lastMessageID = 0;

            $('#message-form').submit(function(event) {
                var contentField = $('#content-field');
                $.ajax({
                    data: {
                        messageContent: contentField.val(),
                        chatId: ${chat.id}
                    },
                    url: 'chat',
                    type: 'POST',
                    success: function() {
                        contentField.val("");
                        refreshFunction();
                    },
                    error: function() {
                    }
                });
                event.preventDefault();
                return false;
            });



            var refreshFunction = function() {
                $.ajax({
                    data: {
                        action: "refresh",
                        lastMessageID: lastMessageID,
                        id: ${chat.id}
                    },
                    url: 'chat',
                    type: 'GET',
                    success: function(data) {
                        $('#messages-list').append(data);
                        if (data !== "")
                            $('.messages').scrollTop($('.messages')[0].scrollHeight);
                    },
                    error: function() {
                    }
                });
            };

            $(function() {
                setInterval(refreshFunction, 1000);

                $('#content-field').keydown(function(e) {
                    if (e.keyCode === 13) {
                        $('#message-form').submit();
                    }
                });
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title row">
                                <span class="col-md-2 margin-box-10 glyphicon glyphicon-bullhorn" > <strong> JChat </strong> </span> 
                                <span class="col-md-6 margin-box-10 text-center" > ${chat.name} </span>
                                <a href="home" type="button" class="margin-box-10 pull-right btn btn-default btn glyphicon glyphicon-circle-arrow-left"> Retour </a>
                            </h3>
                        </div>

                        <div class="panel-body">
                            <h4> Vous êtes connecté en tant que: ${username} </h4>                        
                            <hr/>

                            <div class="messages">
                                <!--  <table  class="table table-striped table-hover table-condensed">
                                      <tbody id="messages-list">
  
                                      </tbody>
                                  </table> -->
                                <div id="messages-list">

                                </div>
                            </div>
                            <hr/>
                            <div>
                                <form class="form" method="POST" role="form" id="message-form">
                                    <div class="form-group ">
                                        <label class="sr-only" for="chatName">Message</label>
                                        <textarea class="form-control" rows="4" id="content-field" name="content" placeholder="Votre message..."></textarea>
                                    </div>
                                    <button type="submit" name class="btn btn-info ">Envoyer</button>
                                </form>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </jsp:body>
</t:layout>