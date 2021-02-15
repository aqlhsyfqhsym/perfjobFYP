const connection = require("../../config/connect");
const mysql = require("mysql2");

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sqlcherch =
    "SELECT `School` FROM `education` WHERE `userid` =" +
    mysql.escape(req.body.userid);

  con.query(sqlcherch, (err, find1) => {
    if (err) throw err;
    console.log(find1);
    var arr = [];
    for (let index = 0; index < find1.length; index++) {
      const element = find1[index];
      if (element.school != "") {
        arr.push(element.school);
      }
    }
    if (req.body.education != undefined) {
      req.body.education.forEach((educations) => {
        console.log(educations);
        if (arr.indexOf(educations.school) < 0) {
          let educationy = {
            userid: req.body.userid,
            year: educations.year,
            note: educations.note,
            School: educations.school ,
          };
          let sql = "INSERT INTO education SET ?";

          con.query(sql, educationy, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
          });
        } else {
          res.send({ err: "other items are save with the same title" });
        }
      });
    } else {
      res.status(404).send({ err: "check the data" });
    }
  });

 
};
