<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/LoginCheck" method="post">
		<table>
			<tr><td>User name</td> <td><input type="text" name="uname"> </td></tr>
			<tr><td>Password</td> <td><input type="password" name="password"> </td></tr>
			<tr><td></td> <td><input type="submit" name="login"> </td></tr>
		</table>
	</form>
</body>
</html>