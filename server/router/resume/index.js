const router = require("express").Router();
const ResumeController = require("../../controllers/resume/index");

router.post("/addskils", ResumeController.addskilss.Post);
router.post("/addaward", ResumeController.addaward.Post);
router.post(
  "/addcontactinformation",
  ResumeController.addcontact_informtion.Post
);
router.post("/addeducation", ResumeController.addeduction.Post);
router.post("/addlanguage", ResumeController.addlanguage.Post);
router.post("/addworking_experience", ResumeController.addworkexperience.Post);

router.post("/updateresume", ResumeController.modify.modf);
router.post("/getresume", ResumeController.get.Post);

module.exports = router;
