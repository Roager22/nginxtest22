const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('TEST SERVICE 2');
});

app.listen(3001, () => {
  console.log('Example app listening on port 3001!');
});