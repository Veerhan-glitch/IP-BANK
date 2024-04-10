<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Support - IP Bank</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
</head>
<body>
    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Support</h1>
    </div>

    <jsp:include page="./side_bar.html"/>

    <div class="content">
        <h2>Support</h2>

        <p>If you need assistance or have any questions, please feel free to contact our support team.</p>
        <p>You can reach us via email or phone:</p>
        
        <p>Email: <a href="./mailto:support@ipbank.com">support@ipbank.com</a> </p>
        <p>Phone: +91-172-XXX-XXXX</p>
    </div>
    
    <jsp:include page="./footer.html" />
    
</body>
</html>
