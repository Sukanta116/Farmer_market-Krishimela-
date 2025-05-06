<?php
require_once __DIR__ . '/../config.php';

/**
 * Sanitize a string for safe output.
 */
function sanitize(string $data): string {
    return htmlspecialchars(strip_tags(trim($data)), ENT_QUOTES, 'UTF-8');
}

/**
 * Is the user logged in?
 */
function isLoggedIn(): bool {
    return !empty($_SESSION['user']);
}

/**
 * Redirect to login if not authenticated.
 */
function requireLogin(): void {
    if (!isLoggedIn()) {
        header('Location: ' . BASE_URL . 'login.php');
        exit;
    }
}

/**
 * Restrict a page to a specific role.
 */
function requireRole(string $role): void {
    if (!isLoggedIn() || $_SESSION['user']['role'] !== $role) {
        header('Location: ' . BASE_URL . 'index.php');
        exit;
    }
}

/**
 * Build a URL to an asset.
 */
function asset(string $path): string {
    return BASE_URL . 'assets/' . ltrim($path, '/');
}
