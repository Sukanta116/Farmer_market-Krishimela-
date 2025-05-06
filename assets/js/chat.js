// chat.js - real‑time chat logic (long‑polling)

document.addEventListener('DOMContentLoaded', function () {
  const farmerId = parseInt(document.getElementById('farmerId').value, 10); // Get farmerId from a hidden input or similar
  const chatBuyer = document.getElementById('chatBuyer');
  const chatWindow = document.getElementById('chatWindow');
  const chatMessage = document.getElementById('chatMessage');
  const sendBtn = document.getElementById('sendBtn');

  let selectedBuyerId = null;

  // Load messages when a buyer is selected
  chatBuyer.addEventListener('change', function () {
    selectedBuyerId = this.value;
    loadMessages();
  });

  // Send a new message
  sendBtn.addEventListener('click', function () {
    if (!selectedBuyerId || !chatMessage.value.trim()) {
      alert('Please select a buyer and type a message.');
      return;
    }

    const message = chatMessage.value.trim();
    chatMessage.value = '';

    fetch('../../modules/api/send_message.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        receiver_id: selectedBuyerId,
        message: message,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          loadMessages(); // Reload messages after sending
        } else {
          alert('Failed to send message.');
        }
      });
  });

  // Load messages from the server
  function loadMessages() {
    if (!selectedBuyerId) return;

    fetch(`../../modules/api/fetch_messages.php?receiver_id=${selectedBuyerId}`)
      .then((response) => response.json())
      .then((data) => {
        chatWindow.innerHTML = ''; // Clear the chat window
        data.messages.forEach((msg) => {
          const messageDiv = document.createElement('div');
          messageDiv.innerHTML = `<strong>${msg.sender_id === farmerId ? 'You' : 'Buyer'}:</strong> ${msg.message}`;
          messageDiv.innerHTML = `<strong>${msg.sender_id === farmerId ? 'You' : 'Buyer'}:</strong> ${msg.message}`;
          chatWindow.appendChild(messageDiv);
        });
        chatWindow.scrollTop = chatWindow.scrollHeight; // Scroll to the bottom
      });
  }
});
