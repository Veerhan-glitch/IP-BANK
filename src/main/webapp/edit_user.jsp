<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User Details</title>
    <link rel="stylesheet" type="text/css" href="./edit_user.css">
    
    <script>
function togglePinVisibility(event) {
    event.preventDefault(); // Prevent the default form submission behavior
    
    var pinElement = document.getElementById("pin");
    var toggleButton = document.getElementById("toggleButton");

    if (pinElement.type === "password") {
        pinElement.type = "text";
        toggleButton.textContent = "Hide";
    } else {
        pinElement.type = "password";
        toggleButton.textContent = "Show";
    }
}
</script>
    
    <%!
    // Function to calculate the date eighteen years ago from today
    public String getEighteenYearsAgo() {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.add(java.util.Calendar.YEAR, -18);
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(cal.getTime());
    }
%>
    
</head>

<body>
    <div class="edit-user-container">
        <h1>Edit User Details</h1>
        <form action="./edit_user_process.jsp" method="post">
            <% 
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; 
                String dbUsername = "root"; 
                String dbPassword = "Prav@bvn1"; 
                String accountNumber = request.getParameter("accountNumber");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                    String sql = "SELECT * FROM users WHERE account_number=?";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, accountNumber);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        String name = resultSet.getString("name");
                        String fatherName = resultSet.getString("father_name");
                        String dob = resultSet.getString("dob");
                        String gender = resultSet.getString("gender");
                        String email = resultSet.getString("email");
                        String mobile = resultSet.getString("mobile");
                        String nationality = resultSet.getString("nationality");
                        String pan = resultSet.getString("pan");
                        String aadhaar = resultSet.getString("aadhaar");
                        String pin = resultSet.getString("pin");
                        String balance = resultSet.getString("balance");
            %>
           	<input type="hidden" name="accountNumber" value="<%= request.getParameter("accountNumber") %>">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" value="<%= accountNumber %>" readonly><br>
           
           
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" value="<%= name %>" required><br>
            
            <label for="fatherName">Father's Name:</label>
            <input type="text" id="fatherName" name="fatherName" value="<%= fatherName %>" required><br>
            
            <label>Gender:</label>
			<label><input type="radio" name="gender" value="Male" <%= "Male".equals(gender) ? "checked" : "" %>> Male</label>
			<label><input type="radio" name="gender" value="Female" <%= "Female".equals(gender) ? "checked" : "" %>> Female</label>
			<label><input type="radio" name="gender" value="Others" <%= "Others".equals(gender) ? "checked" : "" %>> Others</label><br>

			
			<label for="dob">Date of Birth:</label>
			<input type="date" id="dob" name="dob" max="<%= getEighteenYearsAgo() %>" value="<%= dob %>" required><br>
			
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required><br>
            
            <label for="mobile">Phone Number:</label>
            <input type="tel" id="mobile" name="mobile" min="10"max="10" value="<%= mobile %>" required><br>
            
            <label for="nationality">Nationality:</label>
            <input type="text" id="nationality" name="nationality" value="<%=nationality %>" required><br>
            
            <label for="pan">PAN Number:</label>
            <input type="text" id="pan" name="pan" value="<%= pan %>" required><br>
            
            <label for="aadhaar">Aadhaar Number:</label>
            <input type="text" id="aadhaar" name="aadhaar" value="<%= aadhaar %>" required><br>
            
            <label for="pin">PIN:</label>
            <input type="password" id="pin" name="pin" min="4" max="4" value="<%= pin %>" required>
            <button id="toggleButton" onclick="togglePinVisibility(event)">Show</button><br>
            
            <label for="balance">Balance:</label>
            <input type="text" id="balance" name="balance" value="<%= balance %>" required><br>
            
            <button type="submit">Update User</button>
            <% 
                    } 
                    resultSet.close();
                    preparedStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </form>
    </div>
</body>
</html>