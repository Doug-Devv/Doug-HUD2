<script>
    window.addEventListener('message', (event) => {
        const data = event.data;
        if (data.type === 'updateHUD') {
            document.getElementById('street').textContent = data.street || 'Unknown';
            document.getElementById('postal').textContent = data.postal || 'N/A';
            document.getElementById('userid').textContent = data.userid || '0';
        }
    });
</script>
