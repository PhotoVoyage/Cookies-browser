const express = require('express');
const cookieParser = require('cookie-parser');
const path = require('path');

const app = express();
const PORT = 3000;

// Configure Express to use EJS as a templating engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Use cookieParser
app.use(cookieParser());

app.get('/public/bootstrap.min.css', function(req, res) {
    res.setHeader('Content-Type', 'text/css');
    res.sendFile(__dirname + '/public/bootstrap.min.css');
});


// Configure Express to parse form data
app.use(express.urlencoded({ extended: true }));

// Path to set the cookie
app.post('/setcookie', (req, res) => {
  const cookieValue = req.body.cookieValue;
  res.cookie('myCookie', cookieValue);
  res.redirect('/');
});



// Path to delete the cookie
app.post('/deletecookie', (req, res) => {
  res.clearCookie('myCookie');
  res.redirect('/');
});


//Set the main route to display the page
app.get('/', (req, res) => {
  // Get the value of the cookie 'myCookie'
  const miCookie = req.cookies.miCookie || 'No cookie set';

  // Define the 'error' variable as null
  let error = null;

  // Render the index.ejs page with the cookie value and the 'error' variable
  res.render('index', { miCookie, error });
});


// Start the server
app.listen(PORT, () => {
  console.log(`Server started on http://localhost:${PORT}`);
});