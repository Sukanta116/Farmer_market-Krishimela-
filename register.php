<?php
session_start();
if (!empty($_SESSION['user'])) {
    header('Location: index.php');
    exit;
}
?>
<?php include __DIR__ . '/includes/header.php'; ?>

<div class="container mt-5" style="max-width:600px;">
  <h2 class="mb-4">Register</h2>
  <form action="<?= BASE_URL ?>modules/auth/process_register.php" method="POST">
    <!-- Role Selection -->
    <div class="mb-3">
      <label for="role" class="form-label">I am a:</label>
      <select name="role" id="role" class="form-select" required>
        <option value="" disabled selected>Choose role</option>
        <option value="farmer">Farmer</option>
        <option value="buyer">Buyer</option>
      </select>
    </div>

    <!-- Buyer Type -->
    <div class="mb-3" id="buyerTypeDiv" style="display:none;">
      <label for="buyer_type" class="form-label">Buyer Type</label>
      <select
        name="buyer_type"
        id="buyer_type"
        class="form-select"
      >
        <option value="" disabled selected>Select type</option>
        <option value="household">Household</option>
        <option value="business">Business</option>
        <option value="restaurant">Restaurant</option>
      </select>
    </div>

    <!-- Farmer Fields -->
    <div id="farmerFields" style="display:none;">
      <div class="mb-3">
        <label for="full_name" class="form-label">Full Name</label>
        <input type="text" name="full_name" id="full_name" class="form-control">
      </div>
      <div class="mb-3">
        <label for="farm_size" class="form-label">Farm Size</label>
        <input type="text" name="farm_size" id="farm_size" class="form-control">
      </div>
      <div class="mb-3">
        <label for="farm_type" class="form-label">Farm Type</label>
        <input type="text" name="farm_type" id="farm_type" class="form-control">
      </div>
    </div>

    <!-- Household Buyer -->
    <div id="householdFields" style="display:none;">
      <div class="mb-3">
        <label for="first_name" class="form-label">First Name</label>
        <input type="text" name="first_name" id="first_name" class="form-control">
      </div>
      <div class="mb-3">
        <label for="last_name" class="form-label">Last Name</label>
        <input type="text" name="last_name" id="last_name" class="form-control">
      </div>
      <div class="mb-3">
        <label for="nid_number" class="form-label">NID Number</label>
        <input type="text" name="nid_number" id="nid_number" class="form-control">
      </div>
    </div>

    <!-- Business Buyer -->
    <div id="businessFields" style="display:none;">
      <div class="mb-3">
        <label for="business_name" class="form-label">Business Name</label>
        <input type="text" name="business_name" id="business_name" class="form-control">
      </div>
      <div class="mb-3">
        <label for="trade_license_number" class="form-label">Trade License #</label>
        <input type="text" name="trade_license_number" id="trade_license_number" class="form-control">
      </div>
    </div>

    <!-- Restaurant Buyer -->
    <div id="restaurantFields" style="display:none;">
      <div class="mb-3">
        <label for="restaurant_name" class="form-label">Restaurant Name</label>
        <input type="text" name="restaurant_name" id="restaurant_name" class="form-control">
      </div>
      <div class="mb-3">
        <label for="tin_number" class="form-label">TIN Number</label>
        <input type="text" name="tin_number" id="tin_number" class="form-control">
      </div>
    </div>

    <!-- Common Credentials -->
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" name="email" id="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" name="password" id="password" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-success w-100">Register</button>
  </form>
  <p class="mt-3 text-center">
    Already have an account? <a href="<?= BASE_URL ?>login.php">Login here</a>
  </p>
</div>

<?php include __DIR__ . '/includes/footer.php'; ?>

<script>
  const roleEl = document.getElementById('role');
  const buyerTypeDiv = document.getElementById('buyerTypeDiv');
  const buyerTypeEl = document.getElementById('buyer_type');
  const farmerFields = document.getElementById('farmerFields');
  const householdFields = document.getElementById('householdFields');
  const businessFields = document.getElementById('businessFields');
  const restaurantFields = document.getElementById('restaurantFields');

  roleEl.addEventListener('change', () => {
    const r = roleEl.value;
    farmerFields.style.display     = r === 'farmer' ? 'block' : 'none';
    buyerTypeDiv.style.display     = r === 'buyer'  ? 'block' : 'none';
    householdFields.style.display  = 'none';
    businessFields.style.display   = 'none';
    restaurantFields.style.display = 'none';
  });

  buyerTypeEl.addEventListener('change', () => {
    householdFields.style.display  = buyerTypeEl.value === 'household'  ? 'block' : 'none';
    businessFields.style.display   = buyerTypeEl.value === 'business'   ? 'block' : 'none';
    restaurantFields.style.display = buyerTypeEl.value === 'restaurant' ? 'block' : 'none';
  });
</script>
