<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold" href="<?= BASE_URL ?>index.php">
      <img src="<?= BASE_URL ?>assets/images/কৃষিমেলা.png" alt="কৃষিমেলা Logo" class="navbar-logo">
    </a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#mainNavbar"
      aria-controls="mainNavbar"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav ms-auto">
        <?php if (isLoggedIn()): ?>
          <?php switch ($_SESSION['user']['role']): 
            case 'farmer': ?>
              <li class="nav-item">
                <a class="nav-link" href="<?= BASE_URL ?>modules/farmer/dashboard.php">
                  Dashboard
                </a>
              </li>
              <?php break;
            case 'buyer': ?>
              <li class="nav-item">
                <a class="nav-link" href="<?= BASE_URL ?>modules/buyer/dashboard.php">
                  Dashboard
                </a>
              </li>
              <?php break;
            case 'admin': ?>
              <li class="nav-item">
                <a class="nav-link" href="<?= BASE_URL ?>modules/admin/dashboard.php">
                  Admin Panel
                </a>
              </li>
          <?php endswitch; ?>
          <li class="nav-item">
            <a class="nav-link text-danger" href="<?= BASE_URL ?>logout.php">
              Logout
            </a>
          </li>
        <?php else: ?>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>login.php">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>register.php">Register</a>
          </li>
        <?php endif; ?>
      </ul>
    </div>
  </div>
</nav>
