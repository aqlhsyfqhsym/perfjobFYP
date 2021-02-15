const connection = require("../../config/connect");
const mysql = require("mysql2");

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sqlcherch2 =
    "SELECT * FROM `award` WHERE `userid` =" + mysql.escape(req.body.userid);

  con.query(sqlcherch2, (err, find1) => {
    if (err) throw err;
    console.log(find1);
    var arr = [];
    for (let index = 0; index < find1.length; index++) {
      const element = find1[index];
      if (element.text != "") {
        arr.push(element.text);
      }
    }
    if (req.body.award != undefined) {
      req.body.award.forEach((awards) => {
        console.log(awards);
        if (arr.indexOf(awards.text) < 0) {
          let award = {
            filepath: awards.filepath,
            text: awards.text,
            userid: req.body.userid,
          };
          let sql = "INSERT INTO award SET ?";

          con.query(sql, award, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
          });
        } else {
          res
            .status(300)
            .send({ err: "other items are save with the same title" });
        }
      });
    } else {
      res.status(404).send({ err: "check the data" });
    }
  });

 
};
