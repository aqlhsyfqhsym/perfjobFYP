const bcrypt = require("bcrypt");
const mysql = require("mysql2");
const connection = require("../../config/connect");

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sql =
    "SELECT * FROM user WHERE username=" + mysql.escape(req.body.username);
  con.query(sql, (err, sqlres) => {
    console.log(sqlres);
    if (sqlres != undefined) {
      if (sqlres.length == 1) {
        let password = sqlres[0].password;
        let result = bcrypt.compareSync(req.body.password, password);
        if (result) {
          if (err) throw err;
          console.log("success");
          console.log(sqlres);
          res.send({
            StatusCode: 200,
            user: sqlres,
          });
        } else {
          res.send({
            StatusCode: 400,
            msg: "check your information and try again",
          });
        }
      } else {
        res.send({
          StatusCode: 400,
          msg: "user doesn't exist",
        });
      }
    }else{
      res.send({
        StatusCode: 400,
        msg: "check you connection ",
      });
    }
  });
};
