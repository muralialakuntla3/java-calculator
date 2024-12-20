<%@ page import="mypackage.Calculator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Murali Web Calculator</title>
</head>
<body>
    <h1>Murali Web Calculator</h1>

    <form action="index.jsp" method="post">
        <label for="num1">Number 1:</label>
        <input type="text" name="num1" id="num1" required><br><br>
        
        <label for="num2">Number 2:</label>
        <input type="text" name="num2" id="num2" required><br><br>

        <label for="operation">Operation:</label>
        <select name="operation" id="operation" required>
            <option value="add">Add</option>
            <option value="subtract">Subtract</option>
            <option value="multiply">Multiply</option>
            <option value="divide">Divide</option>
        </select><br><br>

        <input type="submit" value="Calculate">
    </form>

    <%
        // Retrieve form values
        String num1 = request.getParameter("num1");
        String num2 = request.getParameter("num2");
        String operation = request.getParameter("operation");

        if (num1 != null && num2 != null && operation != null) {
            try {
                // Parse input numbers
                double a = Double.parseDouble(num1);
                double b = Double.parseDouble(num2);

                // Create Calculator object
                Calculator calc = new Calculator();
                double result = 0;

                // Perform the selected operation
                switch (operation) {
                    case "add":
                        result = calc.add(a, b);
                        break;
                    case "subtract":
                        result = calc.subtract(a, b);
                        break;
                    case "multiply":
                        result = calc.multiply(a, b);
                        break;
                    case "divide":
                        if (b != 0) {
                            result = calc.divide(a, b);
                        } else {
                            out.println("<p style='color:red;'>Error: Division by zero is not allowed.</p>");
                            result = Double.NaN;
                        }
                        break;
                    default:
                        out.println("<p style='color:red;'>Invalid operation selected.</p>");
                        break;
                }

                // Display result
                if (!Double.isNaN(result)) {
                    out.println("<h2>Result: " + result + "</h2>");
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter valid numbers.</p>");
            }
        }
    %>
</body>
</html>

