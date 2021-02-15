const connection = require("../../config/connect");
const mysql = require("mysql2");
exports.Post = async (req, res) => {
  const con = connection.mysqlconnect;

  let userid = mysql.escape(req.body.userid);
  // let sqlcherch = `SELECT * FROM skills,award,contact_information,education,language,working_experience WHERE skills.userid = ${userid} AND award.userid = ${userid} AND contact_information.userid = ${userid} AND education.userid = ${userid} AND language.userid = ${userid} AND working_experience.userid = ${userid}`;
  let skilssql = `SELECT skils FROM skills WHERE userid=${userid}`;
  let skills;
  con.query(skilssql, (err, find) => {
    if (err) throw err;
    skills = find;
    console.log(skills);
    let contact_infosql = `SELECT * FROM contact_information WHERE userid = ${userid} LIMIT 1`;
    let contact_info;

    con.query(contact_infosql, (err, find) => {
      if (err) throw err;
      contact_info = find;
      console.log(contact_info);
      let eductionsql = `SELECT * FROM education WHERE userid = ${userid} LIMIT 1`;
      let eduction;
  
      con.query(eductionsql, (err, find) => {
        if (err) throw err;
        eduction = find;
        console.log(eduction);
        let wesql = `SELECT * FROM working_experience WHERE userid = ${userid} LIMIT 1`;
        let we;
    
        con.query(wesql, (err, find) => {
          if (err) throw err;
          we = find;
          console.log(we);
          let awardsql = `SELECT * FROM award WHERE userid = ${userid} LIMIT 1`;
          let award;
      
          con.query(awardsql, (err, find) => {
            if (err) throw err;
            award = find;
            console.log(award);
            let lgsql = `SELECT * FROM language WHERE userid = ${userid} LIMIT 1`;
            let lg;
        
            con.query(lgsql, (err, find) => {
              if (err) throw err;
              lg = find;
              console.log(lg);
              res.send({
                StatusCode: 200,
                skills: skills,
                language: lg,
                contact_info: contact_info,
                eduction: eduction,
                workex: we,
                award: award,
              });
            });
          });        
          });
        });
      });
    });
  
  
  
   
  /* con.query(skilssql, (err, find) => {
    if (err) throw err;
    skills = find;
  });
  con.query(skilssql, (err, find) => {
    if (err) throw err;
    skills = find;
  }); */
};
