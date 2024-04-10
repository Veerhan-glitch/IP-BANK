<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Clear the user/admin session
    session.removeAttribute("user");
    session.removeAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
</head>
<body>
    <script>
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 2000); // Redirect after 2 seconds (can change..)
    </script>
    <div class="content">
        <h1>Logged Out</h1>
        <p>You have been successfully logged out. Redirecting to the home page...</p>
        <p>If you are not automatically redirected, <a href="./index.jsp">click here</a>.</p>
    </div>
</body>
</html>
