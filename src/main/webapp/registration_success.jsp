<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
    <script>
    function togglePinVisibility() {
        var pinElement = document.getElementById("pin");
        var toggleButton = document.getElementById("toggleButton");

        if (pinElement.type === "password") {
            pinElement.type = "text";
            toggleButton.textContent = "Hide";
        } 
        else {
            pinElement.type = "password";
            toggleButton.textContent = "Show";
        }
    }
</script>
    
</head>
<body>
    <div class="content">
        <h1>Registration Successful!</h1>
        <p>Your account has been successfully registered.</p>
        <p>Account Number: <%= session.getAttribute("accountNumber") %></p>
        <p>Full Name: <%= session.getAttribute("name") %></p>
        <p>Email: <%= session.getAttribute("email") %></p>
        <p>Date of Birth: <%= session.getAttribute("dob") %></p>
        <p>PIN:<input type="password" id="pin" value="<%= session.getAttribute("pin") %>" readonly>
        <button id="toggleButton" onclick="togglePinVisibility()">Show</button></p>
        
        <%String Invalid_login = "False";
        session.setAttribute("Invalid_login", Invalid_login);%>
        
        <p>&emsp;&emsp;&emsp;&emsp;&emsp;<a href="./user_dashboard.jsp"><button>Login</button></a></p>
    </div>
</body>
</html>
