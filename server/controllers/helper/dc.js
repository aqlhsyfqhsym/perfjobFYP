const bcrypt = require("bcrypt");
const saltRounds = 9;

exports.Post = async (req, res) => {
  const salt = bcrypt.genSaltSync(saltRounds);
  res.send({
    password: bcrypt.hashSync(req.body.password, salt),
  });
};
