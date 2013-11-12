<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout title="Login">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">JChat - Connexion</h3>
                    </div>
                    <div class="panel-body">
                        <form method="POST" role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Login" name="login" type="text" autofocus >
                                </div>
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:layout>