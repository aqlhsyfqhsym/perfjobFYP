
  const connection = require("../../config/connect");
  const mysql = require("mysql2");
  exports.modf = async (req, res) => {
    const con = connection.mysqlconnect;

    let userid = mysql.escape(req.body.userid);
  let temp = mysql.escape( req.body.template);
    // let sqlcherch = `SELECT FROM skills,award,contact_information,education,language,working_experience WHERE skills.userid = ${userid} AND award.userid = ${userid} AND contact_information.userid = ${userid} AND education.userid = ${userid} AND language.userid = ${userid} AND working_experience.userid = ${userid}`;
    let skilssql = `DELETE FROM skills WHERE userid=${userid} AND template = ${temp}`;
    con.query(skilssql, (err, find) => {
      if (err) throw err;
    });
      let contact_infosql = `DELETE FROM contact_information WHERE userid = ${userid} AND template = ${temp}`;

      con.query(contact_infosql, (err, find) => {
        if (err) throw err;
      });
      let eductionsql = `DELETE FROM education WHERE userid = ${userid} AND template = ${temp}`;
      con.query(eductionsql, (err, find) => {
        if (err) throw err;
      });
      let wesql = `DELETE FROM working_experience WHERE userid = ${userid} AND template = ${temp}`;
      let we;

      con.query(wesql, (err, find) => {
        if (err) throw err;
      });
      let awardsql = `DELETE FROM award WHERE userid = ${userid} AND template = ${temp}`;
      con.query(awardsql, (err, find) => {
        if (err) throw err;
      });
      let lgsql = `DELETE FROM language WHERE userid = ${userid} AND template = ${temp}`;
      con.query(lgsql, (err, find) => {
        if (err) throw err;
        lg = find;
        console.log(lg);
        res.send({
          StatusCode: 200,
          msg: "you can build new one now",
        });
      });
  
  };
