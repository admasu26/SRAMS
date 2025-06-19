<?php
session_start();

// Database connection (No changes needed here - Identical to original)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "signup";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    // In production, log error instead of die()
    // error_log("Connection failed: " . $conn->connect_error);
    die("Connection failed: " . $conn->connect_error);
}

// Process contact form submission (No changes needed here - Identical to original)
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit_contact'])) {
    // Get and sanitize input
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $message = isset($_POST['message']) ? trim($_POST['message']) : '';

    // Validate input
    if (empty($name) || empty($email) || empty($message)) {
        $_SESSION['error'] = "All fields are required!";
        header("Location: " . basename(__FILE__));
        exit();
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['error'] = "Invalid email format!";
        header("Location: " . basename(__FILE__));
        exit();
    }

    // Insert contact message into database using prepared statement
    $stmt = $conn->prepare("INSERT INTO contact_messages (name, email, message, created_at) VALUES (?, ?, ?, NOW())");

    // Check if prepare() failed
    if ($stmt === false) {
         $_SESSION['error'] = "Error preparing statement: " . htmlspecialchars($conn->error);
         error_log("Prepare failed: (" . $conn->errno . ") " . $conn->error);
         header("Location: " . basename(__FILE__));
         exit();
    }

    $bind = $stmt->bind_param("sss", $name, $email, $message);

     // Check if bind_param() failed
    if ($bind === false) {
         $_SESSION['error'] = "Error binding parameters: " . htmlspecialchars($stmt->error);
         error_log("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
         $stmt->close();
         header("Location: " . basename(__FILE__));
         exit();
    }

    if ($stmt->execute()) {
        $_SESSION['message'] = "Thank you for your message! We'll get back to you soon.";
    } else {
        $_SESSION['error'] = "There was an error submitting your message. Please try again.";
         error_log("Execute failed: (" . $stmt->errno . ") " . $stmt->error);
    }
    $stmt->close();

    header("Location: " . basename(__FILE__));
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - AMU SRAMS</title>
    <link rel="icon" href="logo.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* --- Simplified Styles --- */
        :root {
            --primary-color: #1e3a8a;
            --secondary-color: #152c5e;
            --accent-color: #4f46e5;
            --light-color: #f8f9fa;
            --dark-color: #1f2937;
            --highlight-color: #f59e0b;
            --bs-primary-rgb: 30, 58, 138;
            --bs-secondary-rgb: 21, 44, 94;
            --bs-success-rgb: 22, 163, 74;
            --bs-danger-rgb: 220, 38, 38;
        }
        body { font-family: 'Poppins', sans-serif; background-color: #f0f4f8; color: var(--dark-color); overflow-x: hidden; }
        .navbar-custom { background-color: rgba(255, 255, 255, 0.9); backdrop-filter: blur(8px); box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05); padding: 0.8rem 1rem; position: sticky; top: 0; z-index: 1030; }
        .navbar-custom .navbar-brand { display: flex; align-items: center; font-family: 'Montserrat', sans-serif; font-weight: 700; color: var(--primary-color); }
        .navbar-custom .logo { height: 40px; margin-right: 10px; }
        .navbar-custom .nav-link { color: var(--secondary-color); font-weight: 500; padding: 0.5rem 1rem; transition: color 0.3s ease; margin: 0 5px; }
        .navbar-custom .nav-link:hover, .navbar-custom .nav-link.active { color: var(--accent-color); }
        .contact-hero { background: linear-gradient(140deg, var(--primary-color) 0%, var(--accent-color) 100%); color: white; padding: 80px 0 50px; margin-bottom: 50px; position: relative; text-align: center; }
        .contact-hero::before { content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: url('https://www.amu.edu.et/wp-content/uploads/2020/05/AMU-Campus.jpg') no-repeat center center; background-size: cover; opacity: 0.15; z-index: 0; }
        .contact-hero .container { position: relative; z-index: 1; }
        .contact-hero h1 { font-family: 'Montserrat', sans-serif; font-weight: 700; font-size: 2.8rem; margin-bottom: 15px; text-shadow: 0 2px 4px rgba(0,0,0,0.2); }
        .contact-hero p { font-size: 1.1rem; opacity: 0.9; max-width: 700px; margin: 0 auto; line-height: 1.6; }
        .contact-container { background: white; border-radius: 15px; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06); overflow: hidden; margin-bottom: 30px; border: 1px solid #e5e7eb; }
        .contact-form-container, .contact-info-container { padding: 35px 30px; }
        .form-control { border-radius: 8px; border: 1px solid #d1d5db; padding: 12px 15px; transition: border-color 0.3s ease, box-shadow 0.3s ease; font-size: 0.95rem; background-color: #f9fafb; }
        .form-control:focus { border-color: var(--accent-color); box-shadow: 0 0 0 0.2rem rgba(79, 70, 229, 0.15); background-color: white; }
        textarea.form-control { min-height: 140px; resize: vertical; }
        .btn-primary { background-color: var(--primary-color); border: none; padding: 10px 25px; border-radius: 8px; font-weight: 600; transition: background-color 0.3s ease, transform 0.2s ease; font-size: 0.95rem; color: white; }
        .btn-primary:hover { background-color: var(--accent-color); transform: translateY(-2px); }
        .contact-info-container { background: linear-gradient(135deg, var(--secondary-color), var(--primary-color)); color: white; }
        .section-title { margin-bottom: 25px; padding-bottom: 10px; font-weight: 700; font-family: 'Montserrat', sans-serif; color: var(--primary-color); font-size: 1.6rem; position: relative; border-bottom: 3px solid var(--highlight-color); display: inline-block; }
        .contact-info-container .section-title { color: white; border-bottom-color: var(--highlight-color); }
        .contact-info-item { display: flex; align-items: center; margin-bottom: 25px; }
        .contact-info-icon { font-size: 20px; color: var(--highlight-color); background: white; width: 45px; height: 45px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 20px; flex-shrink: 0; box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1); transition: transform 0.3s ease; }
        .contact-info-item:hover .contact-info-icon { transform: scale(1.1); }
        .contact-info-content h4 { margin-bottom: 5px; font-weight: 600; font-size: 1.1rem; color: #fff; }
        .contact-info-content p { margin-bottom: 3px; opacity: 0.85; line-height: 1.5; font-size: 0.9rem; }
        .contact-info-content p a { color: inherit; text-decoration: none; transition: color 0.3s; }
        .contact-info-content p a:hover { color: var(--highlight-color); }
        .social-links { margin-top: 20px; padding-top: 15px; border-top: 1px solid rgba(255, 255, 255, 0.1); text-align: center; }
        .social-links a { display: inline-flex; align-items: center; justify-content: center; width: 38px; height: 38px; background: rgba(255, 255, 255, 0.15); color: white; border-radius: 50%; margin: 0 6px; transition: background-color 0.3s ease, transform 0.3s ease; font-size: 0.95rem; }
        .social-links a:hover { background: var(--highlight-color); transform: translateY(-3px); }
        .map-container { border-radius: 15px; overflow: hidden; box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08); margin-top: 30px; border: 3px solid white; }
        .map-container iframe { width: 100%; height: 320px; border: none; display: block; }
        .floating-message { position: fixed; bottom: 25px; right: 25px; background-color: var(--primary-color); color: white; width: 55px; height: 55px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 22px; box-shadow: 0 6px 18px rgba(30, 58, 138, 0.3); z-index: 100; transition: background-color 0.3s ease, transform 0.3s ease; border: none; }
        .floating-message:hover { background-color: var(--highlight-color); transform: scale(1.1); }
        .alert { border-radius: 10px; padding: 15px 20px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08); border-left: 4px solid; font-size: 0.95rem; margin-bottom: 25px; }
        .alert-success { border-left-color: var(--bs-success-rgb); background-color: #f0fdf4; }
        .alert-danger { border-left-color: var(--bs-danger-rgb); background-color: #fef2f2; }
        @media (max-width: 992px) {
            .contact-hero h1 { font-size: 2.5rem; }
            .contact-form-container, .contact-info-container { padding: 30px 20px; }
            .section-title { font-size: 1.4rem; }
        }
        @media (max-width: 768px) {
            .contact-hero { padding: 60px 0 40px; }
            .contact-hero h1 { font-size: 2.2rem; }
            .contact-hero p { font-size: 1rem; }
            .map-container iframe { height: 280px; }
            .floating-message { width: 50px; height: 50px; font-size: 20px; bottom: 20px; right: 20px; }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
      <div class="container">
        <a class="navbar-brand" href="index.php">
          <img src="logo.png" alt="AMU Logo" class="logo">
          AMU SRAMS
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="start.php#about">About us</a></li>
            <li class="nav-item"><a class="nav-link active" href="#">Contact</a></li>
            <li class="nav-item"><a class="nav-link" href="admin/log.php">Login</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Hero Section -->
    <section class="contact-hero">
        <div class="container">
            <h1>Connect With Us</h1>
            <p>We're here to help and answer any questions about SRAMS at Arba Minch University.</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container mt-4">
        <?php
        // Session message display (PHP unchanged)
        if (isset($_SESSION["message"])) {
            echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i>' . htmlspecialchars($_SESSION["message"]) . '
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>';
            unset($_SESSION["message"]);
        }
        if (isset($_SESSION["error"])) {
            echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>' . htmlspecialchars($_SESSION["error"]) . '
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>';
            unset($_SESSION["error"]);
        }
        ?>

        <div class="row g-4">
            <div class="col-lg-7">
                <div class="contact-container">
                    <div class="contact-form-container">
                        <h2 class="section-title">Get In Touch</h2>
                        <form method="POST" action="">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                     <label for="nameInput" class="form-label">Your Name</label>
                                     <input type="text" class="form-control" id="nameInput" name="name" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                      <label for="emailInput" class="form-label">Your Email</label>
                                      <input type="email" class="form-control" id="emailInput" name="email" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                 <label for="messageInput" class="form-label">Your Message</label>
                                 <textarea class="form-control" id="messageInput" name="message" rows="5" required></textarea>
                            </div>
                            <div class="text-center mt-4">
                                <button type="submit" name="submit_contact" class="btn btn-primary">
                                    Send Message <i class="fas fa-paper-plane ms-1"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3940.923017294044!2d37.54972231478625!3d6.039980293548918!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x17b139f6bc1b1d13%3A0x1d9a0a7d8f8f8f8f!2sArba%20Minch%20University!5e0!3m2!1sen!2set!4v1620000000000!5m2!1sen!2set" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="contact-container h-100">
                    <div class="contact-info-container d-flex flex-column h-100">
                        <h2 class="section-title">Our Contact Details</h2>
                        <div class="flex-grow-1">
                            <div class="contact-info-item">
                                <div class="contact-info-icon"><i class="fas fa-map-marker-alt"></i></div>
                                <div class="contact-info-content">
                                    <h4>Location</h4>
                                    <p>Arba Minch University, Main Campus<br>Arba Minch, Ethiopia</p>
                                </div>
                            </div>
                            <div class="contact-info-item">
                                <div class="contact-info-icon"><i class="fas fa-phone-alt"></i></div>
                                <div class="contact-info-content">
                                    <h4>Call Us</h4>
                                    <p><a href="tel:+251468810022">Tel:+251-46881-4986</a><br><a href="tel:+251912345678">Fax: +251-46881-0820/0279</a></p>
                                </div>
                            </div>
                            <div class="contact-info-item">
                                <div class="contact-info-icon"><i class="fas fa-envelope"></i></div>
                                <div class="contact-info-content">
                                    <h4>Email Us</h4>
                                    <p><a href="mailto:info@amu.edu.et">info@amu.edu.et</a><br><a href="mailto:srams.support@amu.edu.et">srams.support@amu.edu.et</a></p>
                                </div>
                            </div>
                            <div class="contact-info-item">
                                <div class="contact-info-icon"><i class="fas fa-clock"></i></div>
                                <div class="contact-info-content">
                                    <h4>Working Hours</h4>
                                    <p>Mon - Fri: 8:30 AM - 5:30 PM<br>Sat: 9:00 AM - 1:00 PM</p>
                                </div>
                            </div>
                        </div>
                        <div class="social-links mt-auto">
                            <a href="https://www.facebook.com/ArbaMinchUniversityCAD/" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://x.com/ArbaMinch_Univ" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                            <a href="https://se.linkedin.com/company/arba-minch-university?trk=public_profile_experience-item_profile-section-card_image-click" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Floating Message Button -->
    <button class="floating-message" aria-label="Scroll to message form">
        <i class="fas fa-comment-dots"></i>
    </button>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script>
        // Simplified Floating button click event
        document.addEventListener('DOMContentLoaded', function() {
            const floatingButton = document.querySelector('.floating-message');
            const messageTextarea = document.querySelector('#messageInput'); // Use ID selector

            if (floatingButton && messageTextarea) {
                 floatingButton.addEventListener('click', function(e) {
                    e.preventDefault();
                    messageTextarea.focus();
                    const elementPosition = messageTextarea.getBoundingClientRect().top + window.pageYOffset;
                    const offsetPosition = elementPosition - 100; // Adjust offset if needed
                    window.scrollTo({ top: offsetPosition, behavior: 'smooth' });
                });
            }
        });
    </script>
</body>
</html>
<?php
// Close the database connection (No changes needed here - Identical to original)
if (isset($conn) && $conn instanceof mysqli) {
    $conn->close();
}
?>