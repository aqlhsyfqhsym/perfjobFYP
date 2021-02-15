const router = require("express").Router();
const acountController = require("../../controllers/user/index");

router.post("/login", acountController.login.Post);
router.put("/editaccount", acountController.modify.modf);
router.post("/deleteaccount", acountController.deletea.del);
router.post("/register", acountController.register.Post);

module.exports = router;
