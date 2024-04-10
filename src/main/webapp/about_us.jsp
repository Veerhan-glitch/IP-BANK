<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>About Us - IP Bank</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
</head>
<body>
    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>About Us</h1>
    </div>

    <jsp:include page="./side_bar.html"/>

    <div class="content">
        <h2>Welcome to IP Bank</h2>
        <p>
            IP Bank is a leading banking institution located in the heart of Chandigarh, India. With a prime address in Sector 26, we are proud to be a trusted name in the banking sector. Our primary focus is on delivering top-notch net banking services to our valued customers, enabling them to access their accounts and perform transactions with ease and convenience.
        </p><br>

        <h3>Our Vision</h3>
        <p>
            At IP Bank, our vision is to redefine the digital banking experience for our customers. We strive to be the preferred choice for individuals and businesses seeking secure and efficient net banking solutions. With our user-friendly online platform, we empower our customers to manage their finances from anywhere, at any time.
        </p><br>

        <h3>Our Location</h3>
        <p>
            You can find us at:
            <br> 
            IP Bank, Sector 26, Chandigarh, India. <br>
            We are conveniently situated in one of the city's most vibrant sectors, making it easy for you to visit us and access our range of services.
        </p><br>
        
        <h3>Our Commitment</h3>
        <p>
            At IP Bank, we are committed to providing secure and reliable net banking services. Our dedicated team of professionals works tirelessly to ensure that your online banking experience is smooth, efficient, and secure. We understand the importance of safeguarding your financial information, and we employ the latest security measures to keep your data protected.
        </p>
    </div>
    
    <jsp:include page="./footer.html" />
    
</body>
</html>
