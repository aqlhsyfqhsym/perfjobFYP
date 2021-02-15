const mysql = require("mysql2");
const connection = require("../../config/connect");
const bcrypt = require("bcrypt");
const saltRounds = 9;

const con = connection.mysqlconnect;
exports.modf = async (req, res) => {
  const salt = bcrypt.genSaltSync(saltRounds);
  mysql.escape(req.body.id);
  let sql2 = `UPDATE user SET username = ${mysql.escape(
    req.body.username
  )}, email = ${mysql.escape(req.body.email)}, fullname = ${mysql.escape(
    req.body.fullname
  )} , password = ${mysql.escape(req.body.password)}, Photo = ${mysql.escape(
    req.body.photo
  )} WHERE Id = ${mysql.escape(req.body.id)}`;
  /* let sql = "UPDATE user SET " + " ";
  "username  = " +
    "," +
    mysql.escape(req.body.username) +
    "email  = " +
    "," +
    mysql.escape(req.body.email) +
    "fullname  =" +
    "," +
    mysql.escape(req.body.fullname) +
    "password  = " +
    "," +
    bcrypt.hashSync(req.body.password, salt) +
    //password
    " WHERE user.id =" +
    mysql.escape(req.body.id); */
  con.query(sql2, (err, sqll) => {
    if (err) throw err;
    console.log("success");
    console.log(sqll);
    res.send({
      StatusCode: 200,
    });
  });
};
