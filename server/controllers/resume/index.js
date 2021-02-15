const addskilss = require("./addskills");
const addcontact_informtion = require("./addcontact_info");
const addaward = require("./addaward");
const addworkexperience = require("./addworkex");
const addeduction = require("./addeduction");
const addlanguage = require("./addlanguage");

const modify = require("./editresume");
const get = require("./getallrusmewithid");

module.exports = {
  get,
  addcontact_informtion,
  addskilss,
  addaward,
  addeduction,
  addlanguage,
  addworkexperience,
  modify,
};
