<%@ page language="java" import="java.sql.*, java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="./CSS/register.css">

    <%!
        // Function to calculate the date eighteen years ago from today
        public String getEighteenYearsAgo(){
            java.util.Calendar cal = java.util.Calendar.getInstance();
            cal.add(java.util.Calendar.YEAR, -18);
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(cal.getTime());
        }
    %>

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
    <div class="container">
        <h1>User Registration</h1>

        <form action="./register_process.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            
            <label for="fatherName">Father's Name:</label>
            <input type="text" id="fatherName" name="fatherName" required><br>
            
            
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" max="<%= getEighteenYearsAgo() %>" required>
            
            
            <fieldset class="gender">
                <legend>Gender:</legend>
                <div class="gender-inputs">
                    <label for="male">Male</label>
                    <input type="radio" id="male" name="gender" value="Male" required><br>
                    <label for="female">Female</label>
                    <input type="radio" id="female" name="gender" value="Female"><br>
                    <label for="others">Others</label>
                    <input type="radio" id="others" name="gender" value="Others"><br>
                </div>
			</fieldset>
            
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            
            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" required><br>
            
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="3" required></textarea><br>
            
            <label for="nationality">Nationality:</label>
            <select name="nationality" id="nationality">
                <option value="" disabled selected>Select Nationality</option>
                <option value="Indian">Indian</option>
                <option value="NRI">NRI</option>
			</select>
            <label for="pan">PAN Number:</label>
            <input type="text" id="pan" name="pan" required><br>
            
            <label for="aadhaar">Aadhaar Number:</label>
            <input type="text" id="aadhaar" name="aadhaar" required><br>
            
            <label for="pin">PIN:</label>
			<input type="password" id="pin" name="pin" min="4" max="4" required>
			<button id="toggleButton" onclick="togglePinVisibility()">Show</button>

            
            <label for="balance">Initial Balance:</label>
            <input type="number" id="balance" name="balance" min="1000" required><br>
            
            <label class="account-label">
                Account Number: <span class="small-text">&nbsp&nbsp(Please note it down)</span>
			</label>
            <input type="text" id="accountNumber" name="accountNumber" value="<%= generateUniqueAccountNumber() %>" readonly><br>
            
            <button type="submit">Register</button>
        </form>
    </div>

    <%!
        // Function to generate a random 9-digit account number
        public String generateUniqueAccountNumber() {
            String accountNumber = "";
            
            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; // Update with your database URL
                String dbUsername = "root"; // Update with your database username
                String dbPassword = "Prav@bvn1"; // Update with your database password
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
                
                int maxAttempts = 10;
                for (int i = 0; i < maxAttempts; i++) {
                    accountNumber = String.valueOf((int) (Math.random() * 900_000_000) + 100_000_000);
                    
                    // Check if the account number already exists in the database
                    String checkQuery = "SELECT COUNT(*) AS count FROM users WHERE account_number = ?";
                    PreparedStatement checkStatement = connection.prepareStatement(checkQuery);
                    checkStatement.setString(1, accountNumber);
                    ResultSet checkResult = checkStatement.executeQuery();
                    
                    checkResult.next();
                    int count = checkResult.getInt("count");
                    checkResult.close();
                    checkStatement.close();
                    
                    if (count == 0) {
                        break; // Unique account number found
                    }
                }

                connection.close();
            }
            catch (Exception e) {
                e.printStackTrace();
                accountNumber = "Error";
            }

            return accountNumber;
        }
    %>  
</body>
</html>