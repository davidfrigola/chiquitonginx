'use strict';

const express = require('express');

// Constants
const PORT = 8080;

// App
const app = express();
app.get('/', function (req, res) {
  res.send('200\n');
});
app.get('/500', function(req,res){
  res.status(500).send('500\n');
});
app.listen(PORT);
console.log('Running on http://localhost:' + PORT);

