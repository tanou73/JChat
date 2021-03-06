
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="js" fragment="true" %>
<%@attribute name="title"  %>
<html>
    <head>
        <!-- Bootstrap -->
        <meta charset="utf-8">
        <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/app.css" rel="stylesheet" media="screen">
        <title>${title == null ? "JChat" : title} 
        </title>
    </head>
    <body id="body">
        <div id="pageheader">
            <jsp:invoke fragment="header"/>
        </div>
        <div id="body">
            <jsp:doBody/>
        </div>
        <div id="pagefooter">
            <jsp:invoke fragment="footer"/>   
            <div id="footer">
                <div class="container">
                    <p class="muted credit text-center"> Hugo Chiavenuto - Maxime Layat for <a href="http://www.univ-savoie.fr">Univ-savoie</a></p>
                </div>
                <script src="jquery_1.10.2.js"></script>
                <script src="bootstrap/js/bootstrap.js"></script>
                  <jsp:invoke fragment="js"/> 
            </div>
        </div>
    </body>
</html>