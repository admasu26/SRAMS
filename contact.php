<?php
session_start(); // Start the session at the very beginning

// --- Database Connection ---
$hostname = "localhost";
$username = "root";
$password = "";
$database = "signup"; // Database name should be 'signup' as per your error message

// Create connection
$conn = new mysqli($hostname, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    // Log the error instead of dying instantly in production
    // error_log("Database connection failed: " . $conn->connect_error);
    // For development, die is okay:
    die("Connection failed: " . $conn->connect_error);
}

// --- Process Form Submission Only if it's a POST request ---
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Get data from POST request, use null coalescing operator for safety
    // and trim whitespace
    $name = trim($_POST['name'] ?? ''); // Use 'name', not 'Name' for consistency
    $email = trim($_POST['email'] ?? '');
    $message = trim($_POST['message'] ?? '');

    // --- Basic Server-Side Validation ---
    if (empty($name) || empty($email) || empty($message)) {
        $_SESSION['error'] = "All fields are required.";
        header("Location: contact_us.php"); // Redirect back to the form
        exit(); // Important: stop script execution after redirection
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['error'] = "Invalid email format.";
        header("Location: contact_us.php"); // Redirect back to the form
        exit(); // Important: stop script execution after redirection
    }

    // --- Use Prepared Statement to Prevent SQL Injection ---
    // Use the 'contact_messages' table and include 'created_at'
    $sql = "INSERT INTO contact_messages (name, email, message, created_at) VALUES (?, ?, ?, NOW())";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        // Bind parameters (s = string)
        // The data types must match the placeholders: name (s), email (s), message (s)
        $stmt->bind_param("sss", $name, $email, $message);

        // Execute the statement
        if ($stmt->execute()) {
            $_SESSION['message'] = "Thank you for your message! We'll get back to you soon.";
        } else {
            // Provide a generic error message to the user
            $_SESSION['error'] = "There was an error submitting your message. Please try again.";
            // Log the detailed error for debugging
            // error_log("Error executing contact message insert: " . $stmt->error);
            // For development, you might show the specific error:
            // $_SESSION['error'] = "Error: " . $stmt->error;
        }
        // Close the statement
        $stmt->close();

    } else {
        // Error preparing the statement
        $_SESSION['error'] = "An internal error occurred. Please try again later.";
        // Log the detailed error
        // error_log("Error preparing contact message insert: " . $conn->error);
         // For development, you might show the specific error:
         // $_SESSION['error'] = "Error preparing statement: " . $conn->error;
    }

    // --- Close Connection ---
    $conn->close();

    // --- Redirect back to the contact form page ---
    header("Location: contact_us.php");
    exit(); // Important: stop script execution after redirection

} else {
    // --- Not a POST request ---
    // Redirect users away if they try to access this script directly
    header("Location: contact_us.php");
    exit();
}

// Note: $conn->close() was moved inside the POST block for clarity,
// as the script exits anyway if it's not a POST request.
?>