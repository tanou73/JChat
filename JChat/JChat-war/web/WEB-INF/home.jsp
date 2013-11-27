<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout title="Login">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">JChat - Chat'Manager</h3>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped table-hover table-condensed">
                            <tr>
                                <th> # </th>
                                <th> Nom </th>
                                <th class="text-center"> Nombre de messages </th>
                                <th>  </th>
                            </tr>

                            <c:forEach var="chat" items="${chats}" >
                                <tr>
                                    <td>${chat.id}</td>
                                    <td>${chat.name}</td> 
                                    <td>${fn:length(chat.messages)}</td> 
                                    <td class="text-center"> 
                                        <a href="chat?id=${chat.id}&action=enter" class="btn ${chat.state eq 'CLOSED' ? "disabled" : ""} btn-mg btn-success glyphicon glyphicon-log-in" role="button" > </a> 
                                        <c:if test="${chat.state eq 'OPEN'}">
                                            <a href="home?id=${chat.id}&action=lock" class="btn ${user eq chat.owner ? "" : "disabled"} btn-mg btn-warning glyphicon glyphicon-ban-circle" role="button"> </a> 
                                        </c:if>
                                        <c:if test="${chat.state eq 'CLOSED'}">
                                            <a href="home?id=${chat.id}&action=unlock" class="btn btn-mg btn-primary glyphicon glyphicon-ok-sign" role="button"> </a> 
                                        </c:if>
                                        <a href="home?id=${chat.id}&action=delete" class="btn ${user eq chat.owner ? "" : "disabled"} btn-mg btn-danger glyphicon glyphicon-remove-circle" role="button"> </a>                                             
                                    </td>
                                </tr>	
                            </c:forEach>
                        </table>

                        <hr>
                        <div class="row">
                            <form class="form-inline" method="POST" role="form">
                                <div class="form-group col-md-10 ">
                                    <label class="sr-only" for="chatName">Nom</label>
                                    <input type="text" class="form-control" id="chatName" name="chatName" placeholder="mon chat">
                                </div>
                                <button type="submit" name class="btn btn-info col-md-1">Créer</button>
                            </form>
                        </div>

                        <c:if test="${isPost}">
                            <div class="row" style="margin-top: 20px;">                            
                                <c:if test="${success}">
                                    <div class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <strong>Félicitation!</strong> Le chat a été créé.
                                    </div>
                                </c:if>

                                <c:if test="${!success}">
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <strong>Attention!</strong> Le chat n'a pas pu être créé (le nom doit possèder 3 caractères minimum).
                                    </div>
                                </c:if>
                            </div>
                        </c:if>

                    </div>

                </div>
            </div>
        </div>
    </div>
</t:layout>