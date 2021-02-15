const router = require("express").Router();
const helperController = require("../../controllers/helper/index");


router.post("/decryptpass", helperController.dc.Post);
router.post("/webscrapling", helperController.webs.Get);


module.exports = router;
