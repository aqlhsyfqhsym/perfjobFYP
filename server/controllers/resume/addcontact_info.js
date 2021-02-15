const connection = require("../../config/connect");
const mysql = require("mysql2");

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sqlcherch4 =
    "SELECT `id` FROM `contact_information` WHERE `userid` =" +
    mysql.escape(req.body.userid);

  con.query(sqlcherch4, (err, find1) => {
    if (err) throw err;
    console.log(find1);
    var arr = [];
    for (let index = 0; index < find1.length; index++) {
      const element = find1[index];
      if (element.summary != "" && element.summary != undefined) {
        arr.push(element.summary);
      }
    }
    if (req.body.contactinformation != undefined) {
      req.body.contactinformation.forEach((contactinformations) => {
        console.log(contactinformations);
        if (arr.indexOf(contactinformations.summary) < 0) {
          let contact_information = {
            userid: req.body.userid,
            Sumamry: contactinformations.summary,
            fullname: contactinformations.fullname,
            address: contactinformations.address,
            email: contactinformations.email,
            phone: contactinformations.phone,
            Grender: contactinformations.gender,
          };
          let sql = "INSERT INTO contact_information SET ?";

          con.query(sql, contact_information, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
            res.status(200).send({ statuscode: 200 });
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
