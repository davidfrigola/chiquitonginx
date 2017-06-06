'use strict';

const express = require('express');

// Constants
const PORT = 8080;

// App
const app = express();

const endpoints = [100,101,102,
		200,201,202,203,204,205,206,207,226,
		300,301,302,303,304,305,306,307,308,
		400,401,402,403.404,405,406,407,408,409,410,
		411,412,413,414,415,416,417,418,
		421,422,423,424,425,426,428,429,
		431,
		451,
		500,501,502,503,504,505,506,507,508,509,510,511];

endpoints.forEach(function(endpoint) {
	app.get('/'+endpoint,function(req,res){
		res.status(endpoint).send(endpoint);
	});
});


app.listen(PORT);
console.log('Running on http://localhost:' + PORT);

