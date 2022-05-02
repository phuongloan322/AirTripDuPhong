<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<body>
<p>Xin chào ${sessionScope.khLogin.getHoten() }</p>
<c:choose>
  <c:when test="${sessionScope.tam!=null}">
		Gia tri cua Session: <br>
		${sessionScope.tam}
		<br>Ds ho ten <br>
		<c:forEach items="${dsht}" var="ht">
		    ${ht}
		</c:forEach>
		    <h1>${haha}</h1>
</c:when>
    <c:otherwise>
	    <form action="hello" method="post">
	       <input type="submit" name="but1" value ="Thu 1 ty">
	    </form>
    </c:otherwise>
    </c:choose>
</body>
</html>