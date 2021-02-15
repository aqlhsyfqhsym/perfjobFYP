const connection = require("../../config/connect");
const mysql = require("mysql2");

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sqlcherch =
    "SELECT * FROM `skills` WHERE `userid` =" + mysql.escape(req.body.userid);
  con.query(sqlcherch, (err, find1) => {
    if (err) throw err;
    console.log(find1);
    var arr = [];
    for (let index = 0; index < find1.length; index++) {
      const element = find1[index];
      if (element.skils != "") {
        arr.push(element.skils);
      }
    }
    if (req.body.skils != undefined) {
      req.body.skils.forEach((skills) => {
        console.log(skills);
        if (arr.indexOf(skills) < 0) {
          let skillsdatav = {
            skils: skills.skilss,
            userid: req.body.userid,
          };
          let sql = "INSERT INTO skills SET ?";

          con.query(sql, skillsdatav, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
            return res.send({
              StatusCode: 200,
              msg: "add skills done",
            });
          });
        }
      });
    } else {
      return res.status(404);
    }
  });
};
