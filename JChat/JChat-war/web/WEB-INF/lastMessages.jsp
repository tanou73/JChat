<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="message" items="${messages}" >

    <p> <small><em>${message.timestampToString} </em></small><strong style="margin-left: 10px"> ${message.author} : </strong>${message.content}</p>
    <hr/>
</c:forEach>

<script type="text/javascript">
        lastMessageID = ${lastId};
</script>