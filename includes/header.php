<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/db.php';
require_once __DIR__ . '/functions.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>
    <?= isset($pageTitle)
        ? sanitize($pageTitle) . ' | Farm-to-Market'
        : 'Farm-to-Market' ?>
  </title>

  <!-- Bootstrap CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
  >

  <!-- Common Styles -->
  <link rel="stylesheet" href="<?= asset('css/common.css') ?>">

  <!-- Role‑specific Overrides -->
  <?php if (isLoggedIn()): ?>
    <?php if ($_SESSION['user']['role'] === 'farmer'): ?>
      <link rel="stylesheet" href="<?= asset('css/farmer.css') ?>">
    <?php elseif ($_SESSION['user']['role'] === 'buyer'): ?>
      <link rel="stylesheet" href="<?= asset('css/buyer.css') ?>">
    <?php elseif ($_SESSION['user']['role'] === 'admin'): ?>
      <link rel="stylesheet" href="<?= asset('css/admin.css') ?>">
    <?php endif; ?>
  <?php endif; ?>
</head>
<body>

<?php include __DIR__ . '/navbar.php'; ?>
<main class="container my-4">
