<%@ page language="java" import="java.sql.*,java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
    <%-- Java code for validation and redirection --%>
    <%
        String adminUsername = "admin"; // Replace with actual admin username
        String adminPassword = "admin123"; // Replace with actual admin password

        String enteredUsername = request.getParameter("accountNumber");
        String enteredPassword = request.getParameter("pin");

        if (enteredUsername.equals(adminUsername) && enteredPassword.equals(adminPassword)) {
            String Invalid_login = "False";
            session.setAttribute("Invalid_login", Invalid_login);
            response.sendRedirect("./admin_dashboard.jsp");
        }

        else {
            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank";
                String dbUsername = "root"; // Update with your database username
                String dbPassword = "Prav@bvn1"; // Update with your database password
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                String query = "SELECT * FROM users WHERE account_number = ? AND pin = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, enteredUsername);
                preparedStatement.setString(2, enteredPassword);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    String accountNumber = resultSet.getString("account_number");
                    session.setAttribute("accountNumber", accountNumber);
                    String Invalid_login = "False";
                    session.setAttribute("Invalid_login", Invalid_login);
                    response.sendRedirect("./user_dashboard.jsp");
                } 
                else {
                    String Invalid_login = "True";
                    session.setAttribute("Invalid_login", Invalid_login);
                    response.sendRedirect("./login.jsp");
                    
                }

                resultSet.close();
                preparedStatement.close();
                connection.close();

            } 
            catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('An error occurred. Please try again later.');</script>");
            }
        }
    %>
</body>
</html>