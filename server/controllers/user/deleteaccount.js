const mysql = require("mysql2");
const connection = require("../../config/connect");

const con = connection.mysqlconnect;
exports.del = async (req, res) => {
  let sql = "DELETE FROM `user` WHERE `user`.`Id` =" + req.body.id;
  con.query(sql, (err, t) => {
    if (err) res.status(400);
    else console.log(t.affectedRows);
    if (t.affectedRows != 0) {
      res.send({
        StatusCode: 200,
        affectedRows: t.affectedRows,
      });
    } else {
      res.send({
        StatusCode: 300,
        affectedRows: t.affectedRows,
      });
    }
  });
};
