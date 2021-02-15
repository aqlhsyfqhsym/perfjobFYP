// To parse this JSON data, do
//
//     final resume = resumeFromJson(jsonString);

import 'dart:convert';

class Resume {
  Resume({
    this.statusCode,
    this.skills,
    this.language,
    this.contactInfo,
    this.eduction,
    this.workex,
    this.award,
  });

  final int statusCode;
  final List<Skill> skills;
  final List<Language> language;
  final List<ContactInfo> contactInfo;
  final List<Eduction> eduction;
  final List<Workex> workex;
  final List<Award> award;

  factory Resume.fromRawJson(String str) => Resume.fromJson(json.decode(str));

  get resume => null;

  String toRawJson() => json.encode(toJson());

  factory Resume.fromJson(Map<String, dynamic> json) => Resume(
        statusCode: json["StatusCode"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        language: List<Language>.from(
            json["language"].map((x) => Language.fromJson(x))),
        contactInfo: List<ContactInfo>.from(
            json["contact_info"].map((x) => ContactInfo.fromJson(x))),
        eduction: List<Eduction>.from(
            json["eduction"].map((x) => Eduction.fromJson(x))),
        workex:
            List<Workex>.from(json["workex"].map((x) => Workex.fromJson(x))),
        award: List<Award>.from(json["award"].map((x) => Award.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "language": List<dynamic>.from(language.map((x) => x.toJson())),
        "contact_info": List<dynamic>.from(contactInfo.map((x) => x.toJson())),
        "eduction": List<dynamic>.from(eduction.map((x) => x.toJson())),
        "workex": List<dynamic>.from(workex.map((x) => x.toJson())),
        "award": List<dynamic>.from(award.map((x) => x.toJson())),
      };
}

//AWARD
class Award {
  Award({
    this.id,
    this.filepath,
    this.userid,
    this.text,
    this.template,
  });

  final int id;
  final String filepath;
  final int userid;
  final String text;
  final String template;

  factory Award.fromRawJson(String str) => Award.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Award.fromJson(Map<String, dynamic> json) => Award(
        id: json["id"],
        filepath: json["filepath"],
        userid: json["userid"],
        text: json["text"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filepath": filepath,
        "userid": userid,
        "text": text,
        "template": template,
      };
}

//CONTACT
class ContactInfo {
  ContactInfo({
    this.sumamry,
    this.fullname,
    this.address,
    this.email,
    this.phone,
    this.grender,
    this.id,
    this.userid,
    this.template,
  });

  final String sumamry;
  final String fullname;
  final String address;
  final String email;
  final String phone;
  final String grender;
  final int id;
  final int userid;
  final String template;

  factory ContactInfo.fromRawJson(String str) =>
      ContactInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        sumamry: json["Sumamry"],
        fullname: json["fullname"],
        address: json["address"],
        email: json["email"],
        phone: json["phone"],
        grender: json["Grender"],
        id: json["id"],
        userid: json["userid"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "Sumamry": sumamry,
        "fullname": fullname,
        "address": address,
        "email": email,
        "phone": phone,
        "Grender": grender,
        "id": id,
        "userid": userid,
        "template": template,
      };
}

//EDUCATION
class Eduction {
  Eduction({
    this.id,
    this.school,
    this.year,
    this.note,
    this.userid,
    this.template,
  });

  final int id;
  final String school;
  final String year;
  final String note;
  final int userid;
  final String template;

  factory Eduction.fromRawJson(String str) =>
      Eduction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Eduction.fromJson(Map<String, dynamic> json) => Eduction(
        id: json["id"],
        school: json["School"],
        year: json["year"],
        note: json["note"],
        userid: json["userid"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "School": school,
        "year": year,
        "note": note,
        "userid": userid,
        "template": template,
      };
}

//LANGUAGE
class Language {
  Language({
    this.lang,
  });

  final String lang;

  factory Language.fromRawJson(String str) =>
      Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
      };
}

//SKILLS
class Skill {
  Skill({
    this.skils,
  });

  final String skils;

  factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skils: json["skils"],
      );

  Map<String, dynamic> toJson() => {
        "skils": skils,
      };
}

//WORKING EXPERIENCE
class Workex {
  Workex({
    this.id,
    this.year,
    this.company,
    this.postion,
    this.userid,
    this.template,
  });

  final int id;
  final String year;
  final String company;
  final String postion;
  final int userid;
  final String template;

  factory Workex.fromRawJson(String str) => Workex.fromJson(json.decode(str));

  num get length => null;

  String toRawJson() => json.encode(toJson());

  factory Workex.fromJson(Map<String, dynamic> json) => Workex(
        id: json["id"],
        year: json["year"],
        company: json["company"],
        postion: json["postion"],
        userid: json["userid"],
        template: json["template"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "year": year,
        "company": company,
        "postion": postion,
        "userid": userid,
        "template": template,
      };
}
