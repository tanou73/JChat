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
                        <h3 class="panel-title">JChat - chatchat</h3>
                    </div>

                    <div class="panel-body">
                        <h4> Vous êtes connecté en tant que: Joe </h4>                        
                        <hr/>

                        <div class="messages">
                            <table  class="table table-striped table-hover table-condensed">
                                <tbody>
                                    <tr>
                                        <td> 10:32:45 </td>
                                        <td> Albert </td>
                                        <td> : </td>
                                        <td> Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classiqu </td>
                                    </tr>
                                    <tr>
                                        <td> 10:32:45 </td>
                                        <td> Albert </td>
                                        <td> : </td>
                                        <td> Le Lorem Ipsum ainsi obtenu ne contient aucune répétition, ni ne contient des mots farfelus, ou des touches d'humour. </td>
                                    </tr>
                                    <tr>
                                        <td> 10:32:45 </td>
                                        <td> Albert </td>
                                        <td> : </td>
                                        <td> Si vous voulez utiliser un passage du Lorem Ipsum, vous devez être sûr qu'il n'y a rien d'embarrassant caché dans le texte. Tous les générateurs de Lorem Ipsum sur Internet tendent à reproduire le même extrait sans fin. </td>
                                    </tr>
                                    <tr>
                                        <td> 10:32:45 </td>
                                        <td> Albert </td>
                                        <td> : </td>
                                        <td> On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <hr/>
                        <div>
                            <form class="form" method="POST" role="form" onsubmit="return false;">
                                <div class="form-group ">
                                    <label class="sr-only" for="chatName">Message</label>
                                    <textarea class="form-control" rows="4" id="content" name="content" placeholder="Votre message..."></textarea>
                                </div>
                                <button type="submit" name class="btn btn-info ">Envoyer</button>
                            </form>
                        </div>   
                    </div>
                </div>
            </div>
        </div>
    </div> 
</t:layout>