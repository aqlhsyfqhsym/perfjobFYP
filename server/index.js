// Create express app
var express = require("express");
const apiRouterforuser = require("./router/user/index");
const apiRouterforresume = require("./router/resume/index");
const apihelper = require("./router/helper/index");

const bodyParser = require("body-parser");
const helmet = require("helmet");

var app = express();
require("dotenv").config();
//MIDDLEWARE
app.use(helmet.hidePoweredBy({ setTo: "PHP 7.2 Maybe" })); // SECURE LAYERS
app.use(helmet.frameguard({ action: "sameorigin" }));

app.use(express.json());
app.use(bodyParser.json()); // parse requests of content-type: application/json
app.use(bodyParser.urlencoded({ extended: false })); // parse requests of content-type: application/x-www-form-urlencoded

// Server port
var HTTP_PORT = 3000;
// Start server
app.listen(HTTP_PORT, () => {
  console.log("Server running on port %PORT%".replace("%PORT%", HTTP_PORT));
});
// Root endpoint

app.use("/user", apiRouterforuser);
app.use("/resume", apiRouterforresume);
app.use("/helper", apihelper);
// Insert here other API endpoints

// Default response for any other request
app.use(function (req, res) {
  res.status(404);
});
