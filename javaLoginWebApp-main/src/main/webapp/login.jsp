<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login Page</h2>

<form action="login" method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br><br>

    <label>Password:</label>
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>
<%
    String error = request.getParameter("error");

    if ("1".equals(error)) {
%>
<p style="color:red;">Invalid username or password</p>
<%
    } else if (error != null) {
        // Only redirect if "error" param exists AND it's not 1
        response.sendRedirect("customers.jsp");
    }
%>

</body>
</html>
