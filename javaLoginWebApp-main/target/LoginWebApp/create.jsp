<%--
  Created by IntelliJ IDEA.
  User: vlada
  Date: 12/15/2025
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" %>
<html>
<head><title>Create Product</title></head>
<body>
<h2>Create Product</h2>
<form action="ProductServlet" method="post">
    <input type="hidden" name="action" value="create"/>
    Name: <input type="text" name="product_name"/><br/>
    Description: <input type="text" name="product_description"/><br/>
    Color: <input type="text" name="product_color"/><br/>
    Size: <input type="number" name="product_size"/><br/>
    Price: <input type="text" name="product_price"/><br/>
    <input type="submit" value="Add Product"/>
</form>
</body>
</html>
