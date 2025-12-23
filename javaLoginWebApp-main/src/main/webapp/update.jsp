<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entity.ProductDAO,entity.Product" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ProductDAO dao = (ProductDAO) application.getAttribute("productDAO");
    Product product = dao.getProductById(id);
%>
<html>
<head><title>Update Product</title></head>
<body>
<h2>Update Product</h2>
<form action="ProductServlet" method="post">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>"/>
    Name: <input type="text" name="product_name" value="<%= product.getProduct_name() %>"/><br/>
    Description: <input type="text" name="product_description" value="<%= product.getProduct_description() %>"/><br/>
    Color: <input type="text" name="product_color" value="<%= product.getProduct_color() %>"/><br/>
    Size: <input type="number" name="product_size" value="<%= product.getProduct_size() %>"/><br/>
    Price: <input type="number" name="product_price" value="<%= product.getProduct_price() %>"/><br/>
    <input type="submit" value="Update"/>
</form>
</body>
</html>