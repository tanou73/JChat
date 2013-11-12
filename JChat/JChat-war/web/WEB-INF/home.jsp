<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                            <tr>
                                <td> 1 </td>
                                <td> Sortie ski </td>
                                <td class="text-center"> 6 </td>
                                <td class="text-center"> <a href="chat?id=1&action=enter" class="btn btn-success" role="button" > Se connecter </a> <a href="chat?id=1&action=delete" class="btn btn-danger" role="button"> &times; </a> </td>
                            </tr>
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