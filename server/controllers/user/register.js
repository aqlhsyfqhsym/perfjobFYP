const bcrypt = require("bcrypt");
const mysql = require("mysql2");
const connection = require("../../config/connect");
const validator = require("validator");
const saltRounds = 9;

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sql1 =
    "SELECT * FROM user WHERE username = " + mysql.escape(req.body.username);
  let test;
  con.query(sql1, (err, t) => {
    if (err) throw err;
    if (t.length == 0) {
      test = false;
    } else {
      test = true;
    }
    if (!validator.isEmail(req.body.email)) {
      res.send({
        StatusCode: 400,
        msg: "check you email and  try again",
      });
    } else if (test) {
      res.send({
        StatusCode: 400,
        msg: "username exist try other one",
      });
    } else {
      let sql = "INSERT INTO user SET ?";
      const salt = bcrypt.genSaltSync(saltRounds);
      let post = {
        fullname: req.body.fullname,
        username: req.body.username,
        password: bcrypt.hashSync(req.body.password, salt),
        email: req.body.email,
      };

      con.query(sql, post, (err, _t) => {
        if (err) throw err;
        console.log("success");
        res.send({
          StatusCode: 200,
          msg: "Welcome to the team",
        });
      });
    }
  });
};
