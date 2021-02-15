var webscrape = require("webscrape");
var scraper = webscrape.default();
const connection = require("../../config/connect");
const mysql = require("mysql2");
const con = connection.mysqlconnect;


exports.Get = async (req, res) => {
  //jobs?q=html+js+css&l=
  let lien = "https://www.indeed.com/jobs?q=";
  let sl = "";
  let sqlcherch =
    "SELECT * FROM `skills` WHERE `userid` =" + mysql.escape(req.body.userid);

    //get the skills dari user
  con.query(sqlcherch, async (err, find1) => {
    if (err) console.log(err);
    find1.forEach((element) => {
      console.log(element);
      sl = sl + element.skils + "+";
    });
    console.log(sl);
    lien = lien + sl;
    //send request to the site to search the skills and get the html results 
    const result = await scraper.get(lien);

    console.log(result.$(".title").children());
    let data = result.$(".title").children();
    let arr = []; //array
    for (let index = 0; index < 5; index++) {
      const element = data[index];
      if (element != undefined) {
        console.log(element.attribs.title);
        arr.push(element.attribs.title); //display for indeed
      //   arr[index] = element.attribs.title; 
      //  console.log(arr[index]);
      } else {
        res.send({
          StatusCode: 404,
        });
      }

 
    }
  //for glassdoor
    let arry1 = []; //array
    let sqlcherch1 =
      "SELECT * FROM `skills` WHERE `userid` =" + mysql.escape(req.body.userid);
    con.query(sqlcherch1, async (err, find1) => {
      if (err) console.log(err);
      find1.forEach((element) => {
        console.log(element);
        sl = sl + element.skils + "%20"; //user skilss enter
      });
      console.log(sl + " glassdoor ");

      let lien1 = `https://www.glassdoor.com/Job/jobs.htm?sc.keyword=${sl}&locT=&locId=0&locKeyword=&srs=RECENT_SEARCHES`;
      const result1 = await scraper.get(lien1);
      //
      let data1 = result1.$(".job_title").children();
      console.log(data1);

      for (let index = 0; index < 5; index++) {
        const element = data1[index];
        console.log(element.children[0].data);
         arry1.push(element.children[0].data );
      //  arry1[index] =  element.children[0].data; 
      //  console.log(arry1[index]);
       //display for glassdoor
      }
      // console.log(arr.push(element)); // display 5

      // console.log(arry1.push(element)); //display 5
 
      res.send({
        StatusCode: 200,
        indeed: arr,
        glassdoor: arry1,
      });
       
     

    });
    

    // for (let index = 0; index < 5; index++) 
    // {
    // let intersection,[index] = arr[index].filter(x => arry1[index].includes(x));
    //  console.log(intersection[index]);
    // }
 
    /* data1.forEach(element => {
    
    }); */
   
  // function arraysEqual(arr, arry1) {
  //   if (
  //     !Array.isArray(arr)
  //     || !Array.isArray(arry1)
  //     || arr.length !== arry1.length
  //     ) {
  //       return false;
  //     }
    
  //   // .concat() is used so the original arrays are unaffected
  //   const arr1 = arr.concat().sort();
  //   const arr2 = arry1.concat().sort();
    
  //   for (let i = 0; i < 5; i++) {
  //       if (element.children[0].data.toString() !== element.attribs.title.toString()) {
          
  //         console.log("hello");

  //         // arr1.push(element.attribs.title);
  //         // arr2.push(element.children[0].data );
  //        }
  //   }
    
    
  //   return true;
  // }
  }
  
  );

 

   
} ;


