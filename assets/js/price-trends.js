// price-trends.js - fetch & render Chart.js line chart

// Ensure you include Chart.js in header, e.g.:
// <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

document.addEventListener('DOMContentLoaded', () => {
  const ctx = document.getElementById('priceChart').getContext('2d');

  // Example data (replace with dynamic data from your backend)
  const labels = ['January', 'February', 'March', 'April', 'May'];
  const data = {
    labels: labels,
    datasets: [{
      label: 'Price Trends',
      data: [12, 19, 3, 5, 2],
      backgroundColor: 'rgba(75, 192, 192, 0.2)',
      borderColor: 'rgba(75, 192, 192, 1)',
      borderWidth: 1
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: 'Market Price Trends'
        }
      }
    }
  };

  new Chart(ctx, config);
});
