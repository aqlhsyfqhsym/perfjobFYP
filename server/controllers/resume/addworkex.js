const connection = require("../../config/connect");
const mysql = require("mysql2");

const con = connection.mysqlconnect;
exports.Post = async (req, res) => {
  let sqlcherch3 =
    "SELECT * FROM `working_experience` WHERE `userid` =" +
    mysql.escape(req.body.userid);

  con.query(sqlcherch3, (err, find1) => {
    if (err) throw err;
    console.log(find1);
    var arr = [];
    for (let index = 0; index < find1.length; index++) {
      const element = find1[index];
      if (element.company != "") {
        arr.push(element.company);
      }
    }
    if (req.body.working_experience != undefined) {
      req.body.working_experience.forEach((working_experiences) => {
        console.log(working_experiences);
        if (arr.indexOf(working_experiences.company) < 0) {
          let working_experiencey = {
            year: working_experiences.year,
            userid: req.body.userid,
            company: working_experiences.company,
            postion: working_experiences.postion,
          };
          let sql = "INSERT INTO working_experience SET ?";

          con.query(sql, working_experiencey, (err, sqlres) => {
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

  /*   let s = false;
  let w = false;
  let e = false;
  let l = false;
  let c = false;
  let a = false;
  if (req.body.skills != undefined) {
    s = true;
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
      let sql = "INSERT INTO skills SET ?";
      req.body.skills.forEach((element) => {
        let skills = {
          template: "template" + " " + req.body.templete,
          skils: element["skilss"],
          userid: req.body.userid,
        };

        if (arr.indexOf(element) == -1) {
          con.query(sql, skills, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
          });
        }
      });
    });
  }
  if (req.body.award != undefined) {
    a = true;
    let sqlcherch2 =
      "SELECT * FROM `award` WHERE `userid` =" + mysql.escape(req.body.userid);

    con.query(sqlcherch2, (err, find2) => {
      if (err) throw err;
      console.log(find2);
      var arr = [];
      for (let index = 0; index < find2.length; index++) {
        const element = find2[index];
        arr.push(element);
      }
      let sql = "INSERT INTO award SET ?";
      req.body.award.forEach((element) => {
        let award = {
          template: "template" + " " + req.body.templete,
          filepath: element.filepath,
          text: element.text,
          userid: req.body.userid,
        };

        if (arr.indexOf(element) == -1) {
          con.query(sql, award, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
          });
        }
      });
    });
  }
  if (req.body.language != undefined) {
    l = true;
    let sqlcherch3 =
      "SELECT * FROM `language` WHERE `userid` =" +
      mysql.escape(req.body.userid);

    con.query(sqlcherch3, (err, find3) => {
      if (err) throw err;
      console.log(find3);
      var arr = [];
      for (let index = 0; index < find3.length; index++) {
        const element = find3[index];
        arr.push(element);
      }
      let sql = "INSERT INTO language SET ?";
      req.body.language.forEach((element) => {
        let language = {
          template: "template" + " " + req.body.templete,
          lang: element.lang,
          userid: req.body.userid,
        };

        if (arr.indexOf(element) == -1) {
          con.query(sql, language, (err, sqlres) => {
            if (err) throw err;
            console.log(sqlres);
          });
        }
      });
    });
  }
  if (req.body.contactinformation != undefined) {
    c = true;
    let sqlcherch4 =
      "SELECT `id` FROM `contact_information` WHERE `userid` =" +
      mysql.escape(req.body.userid);

    con.query(sqlcherch4, (err, find4) => {
      if (err) throw err;
      console.log(find4);
      if (find4.length <= 3) {
        let sql1 = "INSERT INTO contact_information SET ?";
        let contact_information = {
          template: "template" + " " + req.body.templete,
          userid: req.body.userid,
          Sumamry: req.body.contactinformation.summary,
          fullname: req.body.contactinformation.fullname,
          address: req.body.contactinformation.address,
          email: req.body.contactinformation.email,
          phone: req.body.contactinformation.phone,
          Grender: req.body.contactinformation.gender,
        };
        con.query(sql1, contact_information, (err, sqlres) => {
          if (err) throw err;
          console.log(sqlres);
        });
      }
    });
  }

  if (req.body.working_experience != undefined) {
    w = true;
    let sql1 = "INSERT INTO working_experience SET ?";
    req.body.working_experience.forEach((element) => {
      let working_experience = {
        template: "template" + " " + req.body.templete,
        year: element.year,
        userid: req.body.userid,
        company: element.company,
        postion: element.postion,
      };
      con.query(sql1, working_experience, (err, sqlres) => {
        if (err) throw err;
        console.log(sqlres);
      });
    });
  }

  if (req.body.education != undefined) {
    e = true;
    let sqlcherch =
      "SELECT `School` FROM `education` WHERE `userid` =" +
      mysql.escape(req.body.userid);

    con.query(sqlcherch, (err, find) => {
      if (err) throw err;
      console.log();
      var arr = [];
      if (find.length < 1) {
        let sql1 = "INSERT INTO education SET ?";
        req.body.education.forEach((element) => {
          let education = {
            template: "template" + " " + req.body.templete,
            userid: req.body.userid,
            year: element.year,
            note: element.note,
            School: element.school,
          };
          if (arr.indexOf(element.school) == -1) {
            con.query(sql1, education, (err, sqlres) => {
              if (err) throw err;
              console.log(sqlres);
            });
          }
        });
      }
    });
  }
  if (
    s == false ||
    w == false ||
    e == false ||
    l == false ||
    c == false ||
    a == false
  ) {
    res.send({
      StatusCode: 300,
      msg:
        "you have information missing but sould complete it to get better resultat",
    });
  } else {
     res.send({
      StatusCode: 200,
      msg: "every think is good",
    });
  }*/
};
