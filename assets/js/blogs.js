// blogs.js - (Optional) AJAX CRUD for blogs
// Example for submitting a new post via AJAX:
//
// const blogForm = document.querySelector('form');
// if (blogForm && window.location.pathname.includes('/modules/farmer/blogs/')) {
//   blogForm.addEventListener('submit', async e => {
//     e.preventDefault();
//     const title   = blogForm.title.value.trim();
//     const content = blogForm.content.value.trim();
//     const res = await fetch(`${BASE_URL}modules/api/submit_blog.php`, {
//       method: 'POST',
//       headers: { 'Content-Type': 'application/json' },
//       body: JSON.stringify({ title, content })
//     });
//     const json = await res.json();
//     if (json.success) {
//       window.location.href = 'list.php';
//     } else {
//       alert(json.error);
//     }
//   });
// }
