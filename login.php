<?php
session_start();
if (!empty($_SESSION['user'])) {
    header('Location: index.php');
    exit;
}

if (isset($_GET['message'])) {
    $message = htmlspecialchars($_GET['message']);
    echo "<script>alert('$message');</script>";
}
?>
<?php include __DIR__ . '/includes/header.php'; ?>

<div class="container mt-5" style="max-width:400px;">
  <h2 class="mb-4">Login</h2>
  <form action="<?= BASE_URL ?>modules/auth/process_login.php" method="POST">
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input
        type="text"
        name="username"
        id="username"
        class="form-control"
        required
      >
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input
        type="password"
        name="password"
        id="password"
        class="form-control"
        required
      >
    </div>
    <button type="submit" class="btn btn-primary w-100">Login</button>
  </form>
  <p class="mt-3 text-center">
    <a href="<?= BASE_URL ?>modules/auth/forgot_password.php">Forgot Password?</a>
  </p>
  <p class="mt-3 text-center">
    Don't have an account? <a href="<?= BASE_URL ?>register.php">Register here</a>
  </p>
</div>

<?php include __DIR__ . '/includes/footer.php'; ?>
