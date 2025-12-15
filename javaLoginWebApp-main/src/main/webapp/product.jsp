<%--
  Created by IntelliJ IDEA.
  User: vlada
  Date: 12/3/2025
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>

<h2>Sneaker Product Page</h2>

<img src="sneaker.jpg" width="250"/>

<p><strong>Product:</strong> UltraBoost Sneaker</p>
<p><strong>Description:</strong> High-performance running sneaker with breathable knit.</p>
<p><strong>Price:</strong> $120.00 per pair</p>

<hr/>

<form action="product" method="post">
    Enter quantity: <input type="number" name="qty" min="1" required>
    <button type="submit">Calculate</button>
</form>

<%
    String result = (String) request.getAttribute("result");
    if (result != null) {
%>
<hr/>
<h3>Result:</h3>
<p><%= result %></p>
<% } %>

</body>
</html>

</body>
</html>
