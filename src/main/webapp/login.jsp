<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="./CSS/login.css">
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="./login_process.jsp" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required><br>
            
            <label for="pin">Password:</label>
            <input type="password" id="pin" name="pin" required><br>
            
            <%
            String Invalid_login = (String) session.getAttribute("Invalid_login");
            if(Invalid_login=="True"){%>
                <font color="red"><p>Invalid Credentials</p></font>
            <%}%>

            <button type="submit">Login</button>
            <p>or</p>
        </form>
        <form action="./register.jsp">
            <button>Register</button>
        </form>
    </div>
</body>
</html>
