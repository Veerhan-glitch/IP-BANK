<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="./CSS/admin_dashboard.css">
</head>
<body>
    <div class="admin-header">
        <a href="./admin_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Admin Dashboard</h1>
    </div>
    <jsp:include page="admin_sidebar.html" />

    <div class="content">
        <h2>Welcome, Admin!</h2>
        <p>This is the admin dashboard where you can manage users and transactions.</p>
    </div>
    <jsp:include page="footer.html" />
</body>
</html>
