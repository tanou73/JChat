<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    lastMessageID = ${lastId};
</script>
<c:forEach var="message" items="${messages}" >
    <tr>
        <td>${message.timestamp}</td>
        <td>${message.author}</td> 
        <td> : </td>
        <td>${message.content}</td> 
    </tr>	
</c:forEach>