<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.Random" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Processing</title>
</head>
<body>
    <div class="container">
        <h1>Registration Processing</h1>
        <%
            String name = request.getParameter("name");
            String fatherName = request.getParameter("fatherName");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String nationality = request.getParameter("nationality");
            String pan = request.getParameter("pan");
            String aadhaar = request.getParameter("aadhaar");
            String pin = request.getParameter("pin");
            double balance = Double.parseDouble(request.getParameter("balance"));
            String accountNumber = request.getParameter("accountNumber");
        
            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; // Update with your database URL
                String dbUsername = "root"; // Update with your database username
                String dbPassword = "Prav@bvn1"; // Update with your database password
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
                
                String insertQuery = "INSERT INTO users (name, father_name, dob, gender, email, mobile, address, nationality, pan, aadhaar, pin, balance, account_number) " +
                                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, fatherName);
                preparedStatement.setString(3, dob);
                preparedStatement.setString(4, gender);
                preparedStatement.setString(5, email);
                preparedStatement.setString(6, mobile);
                preparedStatement.setString(7, address);
                preparedStatement.setString(8, nationality);
                preparedStatement.setString(9, pan);
                preparedStatement.setString(10, aadhaar);
                preparedStatement.setString(11, pin);
                preparedStatement.setDouble(12, balance);
                preparedStatement.setString(13, accountNumber);
                preparedStatement.executeUpdate();
                
                preparedStatement.close();
                connection.close();
                
                session.setAttribute("name", name);
                session.setAttribute("accountNumber", accountNumber);
                session.setAttribute("email", email);
                session.setAttribute("dob", dob);
                session.setAttribute("pin", pin);

                response.sendRedirect("./registration_success.jsp");
            } 
            catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </div>
</body>
</html>