<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.*,entity.ProductDAO,entity.Product" %>
<%
    ProductDAO dao = (ProductDAO) application.getAttribute("productDAO");
    List<Product> products = dao.getAllProducts();
%>
<html>
<head><title>Product List</title></head>
<body>
<h2>All Products</h2>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Description</th><th>Color</th><th>Size</th><th>Price</th><th>Actions</th></tr>
    <%
        for(Product p : products){
    %>
    <tr>
        <td><%= p.getProduct_id() %></td>
        <td><%= p.getProduct_name() %></td>
        <td><%= p.getProduct_description() %></td>
        <td><%= p.getProduct_color() %></td>
        <td><%= p.getProduct_size() %></td>
        <td><%= p.getProduct_price() %></td>
        <td>
            <form action="update.jsp" method="post">
                <input type="hidden" name="id" value="<%= p.getProduct_id() %>"/>
                <input type="submit" value="Update"/>
            </form>
            <form action="ProductServlet" method="post">
                <input type="hidden" name="action" value="delete"/>
                <input type="hidden" name="id" value="<%= p.getProduct_id() %>"/>
                <input type="submit" value="Delete"/>
            </form>
        </td>
    </tr>
    <% } %>
</table>
<a href="create.jsp">Add New Product</a>
</body>
</html>