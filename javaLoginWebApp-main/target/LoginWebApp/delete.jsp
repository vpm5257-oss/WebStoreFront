<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" %>
<html>
<head><title>Delete Product</title></head>
<body>
<h2>Delete Product</h2>
<form action="ProductServlet" method="post">
    <input type="hidden" name="action" value="delete"/>
    Product ID: <input type="text" name="id"/><br/>
    <input type="submit" value="Delete"/>
</form>
</body>
</html>
