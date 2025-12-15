<%--
  Created by IntelliJ IDEA.
  User: vlada
  Date: 12/15/2025
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
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
