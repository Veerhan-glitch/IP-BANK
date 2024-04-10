<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>FAQ - IP Bank</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
</head>
<body>
    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Welcome to IP Bank</h1>
    </div>

    <jsp:include page="./side_bar.html"/>

    <div class="content">
        <h2>Frequently Asked Questions</h2>
        
        <h3>1. How do I create an account?</h3>
        <p>
            To create an account with IP Bank, visit our nearest branch and provide the required documents for verification. Our staff will guide you through the account creation process.
        </p>
        
        <h3>2. How can I reset my PIN?</h3>
        <p>
            You can reset your PIN by visiting the nearest branch with your valid ID proof. Our staff will assist you in generating a new PIN for your account.
        </p>
        
        <h3>3. Can I transfer money to international accounts?</h3>
        <p>
            Yes, you can transfer money to international accounts using our online banking platform. Ensure that you have the necessary details of the recipient's bank account.
        </p>
        
        <h3>4. How do I update my personal information?</h3>
        <p>
            You can update your personal information by logging into your online banking account and navigating to Support and writing a mail to us. Within 48 hours, all the details you requested will be updated.
        </p>
        
        <h3>5. What should I do if I forget my online banking password?</h3>
        <p>
            If you forget your online banking password, you can click on the "Forgot Password" link on the login page. Follow the instructions to reset your password securely.
        </p>
        
        <h3>6. Is mobile banking available?</h3>
        <p>
            Yes, we offer a mobile banking app that allows you to access your account, make transfers, pay bills, and more from your smartphone or tablet.
        </p>
        
        <h3>7. How can I report a fraudulent transaction?</h3>
        <p>
            If you suspect a fraudulent transaction on your account, please contact our customer support immediately at support@ipbank.com or call us at +91-123-456-7890.
        </p>
    </div>
    
    <jsp:include page="./footer.html" />
    
</body>
</html>
