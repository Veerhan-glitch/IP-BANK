<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <link rel="stylesheet" type="text/css" href="./CSS/view_users.css">
</head>
<body>
    <div class="header">
        <a href="./admin_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Admin Dashboard - View Users</h1>
    </div>
    
    <jsp:include page="./admin_sidebar.html" />

    
    <div class="content">
        <h2 align="center">View Users</h2>
        
        <table class="users-table">
            <tr>
                <th>Name</th>
                <th>Account Number</th>
                <th>Father's Name</th>
                <th>Date of Birth</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Nationality</th>
                <th>PAN</th>
                <th>Aadhaar</th>
                <th>PIN</th>
                <th>Balance</th>
                <th>Actions</th>
            </tr>
            
            <% 
                
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; 
                String dbUsername = "root"; 
                String dbPassword = "Prav@bvn1"; 
                
                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
                    
                    
                    String sql = "SELECT * FROM users";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    
                    
                    while (resultSet.next()) {
                    	String name = resultSet.getString("name");
                        String accountNumber = resultSet.getString("account_number");
                        String fatherName = resultSet.getString("father_name");
                        String dob = resultSet.getString("dob");
                        String gender = resultSet.getString("gender");
                        String email = resultSet.getString("email");
                        String mobile = resultSet.getString("mobile");
                        String address = resultSet.getString("address");
                        String nationality = resultSet.getString("nationality");
                        String pan = resultSet.getString("pan");
                        String aadhaar= resultSet.getString("aadhaar");
                        String pin = resultSet.getString("pin");
                        String balance = resultSet.getString("balance");
                        
                        out.println("<tr>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + accountNumber + "</td>");
                        out.println("<td>" + fatherName + "</td>");
                        out.println("<td>" + dob + "</td>");
                        out.println("<td>" + gender + "</td>");
                        out.println("<td>" + email + "</td>");
                        out.println("<td>" + mobile + "</td>");
                        out.println("<td>" + address + "</td>");
                        out.println("<td>" + nationality + "</td>");
                        out.println("<td>" + pan + "</td>");
                        out.println("<td>" + aadhaar + "</td>");
                        out.println("<td>" + pin + "</td>");
                        out.println("<td>" + balance + "</td>");
                        out.println("<td><a href='edit_user.jsp?accountNumber=" + accountNumber + "'>Edit</a> <a href='delete_user.jsp?accountNumber=" + accountNumber + "'>Delete</a></td>");
                        out.println("</tr>");
                    }
                    
                    //Close resources
                    resultSet.close();
                    preparedStatement.close();
                    connection.close();
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
            %>
            
        </table>
    </div>
    
    <jsp:include page="footer.html" />

</body>
</html>
