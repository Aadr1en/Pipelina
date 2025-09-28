const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 30080;

// Servir le frontend (public/)
app.use(express.static(path.join(__dirname, 'public')));

// Petite API pour la démo
app.get('/api/info', (req, res) => {
  res.json({
    message: 'Bienvenue dans la démo DevOps ',
    outils: ['Jenkins', 'Docker', 'Ansible', 'Kubernetes', 'CI/CD']
  });
});

app.listen(port, () => console.log(` Application disponible sur http://localhost:${port}`));
