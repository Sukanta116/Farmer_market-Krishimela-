// common.js - shared scripts across all pages
document.addEventListener('DOMContentLoaded', () => {
    // Auto‑dismiss Bootstrap alerts after 5 seconds
    document.querySelectorAll('.alert').forEach(alert => {
      setTimeout(() => alert.remove(), 5000);
    });
  });
  