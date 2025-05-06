<?php
session_start();
if (!empty($_SESSION['user'])) {
    switch ($_SESSION['user']['role']) {
        case 'farmer':
            header('Location: modules/farmer/dashboard.php');
            exit;
        case 'buyer':
            header('Location: modules/buyer/dashboard.php');
            exit;
        case 'admin':
            header('Location: modules/admin/dashboard.php');
            exit;
    }
}
?>

<style>
  body {
    background: url("assets/images/Home.png") no-repeat center center fixed;
    background-size: cover;
    color: white;
    font-family: 'Arial', sans-serif;
    text-align: center; /* Center-align text */
    margin: 0;
    padding: 0;
    min-height: 100vh; /* Ensure the body takes up the full viewport height */
    display: flex;
    flex-direction: column;
  }

  main {
    flex: 1; /* Pushes the footer to the bottom */
    display: flex;
    flex-direction: column;
    justify-content: center; /* Center-align content vertically */
    align-items: center; /* Center-align content horizontally */
  }

  h1 {
    font-size: 3rem;
    font-weight: bold;
    margin-bottom: 200px;
  }

  p {
    font-size: 1.2rem;
    margin-bottom: 40px;
  }

  .btn {
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 25px;
    transition: all 0.3s ease;
    margin: 5px;
  }

  .btn-primary {
    background-color:rgb(251, 252, 252);
    border: none;
  }

  .btn-primary:hover {
    background-color: #0056b3;
  }

  .btn-success {
    background-color:rgb(251, 253, 252);
    border: none;
  }

  .btn-success:hover {
    background-color: #1e7e34;
  }
  a {
  text-decoration: none;
  color: black;
  font-weight: bold; 
}


  footer {
   
    color: white;
    padding: 10px 0;
    text-align: center;
  }
</style>

<main>
  <h1>Welcome to </h1>
  <p>Empowering farmers by eliminating middlemen and connecting them directly to buyers.</p>
  <div>
    <a href="login.php" class="btn btn-primary">Login</a>
    <a href="register.php" class="btn btn-success">Register</a>
  </div>
</main>

<footer>
  <?php include __DIR__ . '/includes/footer.php'; ?>
</footer>
