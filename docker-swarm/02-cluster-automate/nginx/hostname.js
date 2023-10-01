const express = require("express");
const app = express();

app.get("/", (req, res) => {
  // Ottieni l'hostname locale
  const hostname = os.hostname();

  // Ritorna l'hostname
  res.send(hostname);
});

app.listen(3000, () => console.log("Servizio in esecuzione su http://localhost:3000"));