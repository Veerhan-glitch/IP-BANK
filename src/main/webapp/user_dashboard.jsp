<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
    
    <%
        String accountNumber = (String) session.getAttribute("accountNumber");

        if (accountNumber == null) {
            // User is not logged in, handle accordingly
            response.sendRedirect("./login.jsp");
        }
    %>
</head>
<body>
    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>User Dashboard</h1>
    </div>

    <jsp:include page="side_bar.html" />

    <div class="content">
        <h2>Welcome, User!</h2>
        <p>This is your dashboard where you can manage your account and transactions.</p>
    </div>

    <jsp:include page="footer.html" />

</div>
</body>
</html>
