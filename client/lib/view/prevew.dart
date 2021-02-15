// ignore_for_file: always_specify_types

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:client/model/resume.dart';
import 'package:client/model/user.dart';

const PdfColor green = PdfColor.fromInt(0x90a4ae);
const PdfColor lightGreen = PdfColor.fromInt(0xffeceff1);

Future<Uint8List> generateResume(
    PdfPageFormat format, User users, Resume resume) async {
  final pw.Document doc = pw.Document(title: 'My Résumé', author: 'Prefjob');
  var t = users.user[0].photo == ""
      ? pw.Text("")
      : pw.Image(PdfImage.file(
          doc.document,
          bytes: base64.decode(users.user[0].photo),
        ));

  final pw.PageTheme pageTheme = await _myPageTheme(format);

  doc.addPage(pw.Page(
    pageTheme: pageTheme,
    build: (pw.Context context) {
      final contactInfo = resume.contactInfo;
      final eduction = resume.eduction;
      final workex = resume.workex;
      final award = resume.award;
      final lang = resume.language;

      return pw.Row(children: <pw.Widget>[
        pw.Expanded(
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
              pw.Container(
                  padding: const pw.EdgeInsets.only(
                    left: 30,
                    bottom: 10,
                  ),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Text(users.user[0].fullname, //fullname
                            textScaleFactor: 2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                        // pw.Text(
                        //      , //summary
                        //     textScaleFactor: 1.0,
                        //     style: pw.Theme.of(context)
                        //         .defaultTextStyle
                        //         .copyWith(color: green)),
                        pw.Text(contactInfo[0].sumamry, //summary
                            textScaleFactor: 1.0,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(color: green)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                              pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: <pw.Widget>[
                                    // pw.Text("No 6 Jalan Tun Teja"),
                                    pw.Text(contactInfo[0].address),
                                    // pw.Text('40470 Shah Alam'),
                                    // pw.Text('Selangor'),
                                  ]),
                              // pw.Column(
                              //     crossAxisAlignment:
                              //         pw.CrossAxisAlignment.start,
                              //     children: <pw.Widget>[
                              //       pw.Text(
                              //           resume.contactInfo[0].phone), //phone
                              //       pw.Text(resume.contactInfo[0].email),
                              //       // _UrlText('wholeprices.ca',
                              //       //     'https://wholeprices.ca'),
                              //     ]),
                              pw.Padding(padding: pw.EdgeInsets.zero)
                            ]),
                      ])),

              _Category(title: 'Work Experience'),

              for (var we in resume.workex) _Block(title: workex[0].company),
              _Textt(textss: 'Year working ' + workex[0].year),
              _Textt(textss: 'Working as ' + workex[0].postion),
              //   _Block(title: we.postion, company: we.company),

              _Category(title: 'Education'),
              _Block(title: eduction[0].school),
              _Textt(textss: eduction[0].year),
              _Textt(textss: eduction[0].note),

              // for (Eduction ed in resume.eduction)
              //   _Block(title: ed.school, year: ed.year, note: ed.note),

              _Category(title: 'Award'),
              _Block(title: award[0].filepath),
              _Textt(textss: award[0].text),

              // for (Award aw in resume.award) _Category(title: 'Award'),
              // for (Award art in resume.award) _Block(title: art.filepath),
              // for (Award art in resume.award) _Block(title: art.text),

              _Category(title: 'Language'),
              pw.Row(children: <pw.Widget>[
                // pw.Text(resume.skills[0].skils),
                _Percent(size: 60, value: .9, title: pw.Text(lang[0].lang)),
              ]),
            ])),
        pw.Container(
          height: double.infinity,
          width: 2,
          margin: const pw.EdgeInsets.symmetric(horizontal: 5),
          color: green,
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: <pw.Widget>[
            pw.ClipOval(
              child: pw.Container(
                  width: 110, height: 100, color: lightGreen, child: t),
            ),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(resume.contactInfo[0].phone),
                  pw.Text(resume.contactInfo[0].email),
                  // _UrlText('wholeprices.ca',
                  //     'https://wholeprices.ca'),
                ]),
            _Category(title: 'Skills'),
            pw.Column(children: <pw.Widget>[
              // pw.Text(resume.skills[0].skils),
              for (var i = 0; i < resume.skills.length; i++)
                _Percent(
                    size: 60,
                    value: .7,
                    title: pw.Text(resume.skills[i].skils)),
            ]),
            pw.BarcodeWidget(
              data: users.user[0].fullname,
              width: 60,
              height: 60,
              barcode: pw.Barcode.qrCode(),
            ),
          ],
        )
      ]);
    },
  ));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  return pw.PageTheme(
    pageFormat: format.applyMargin(
        left: 2.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.CustomPaint(
          size: PdfPoint(format.width, format.height),
          painter: (PdfGraphics canvas, PdfPoint size) {
            context.canvas
              ..setColor(lightGreen)
              ..moveTo(0, size.y)
              ..lineTo(0, size.y - 230)
              ..lineTo(60, size.y)
              ..fillPath()
              ..setColor(green)
              ..moveTo(0, size.y)
              ..lineTo(0, size.y - 100)
              ..lineTo(100, size.y)
              ..fillPath()
              ..setColor(lightGreen)
              ..moveTo(30, size.y)
              ..lineTo(110, size.y - 50)
              ..lineTo(150, size.y)
              ..fillPath()
              ..moveTo(size.x, 0)
              ..lineTo(size.x, 230)
              ..lineTo(size.x - 60, 0)
              ..fillPath()
              ..setColor(green)
              ..moveTo(size.x, 0)
              ..lineTo(size.x, 100)
              ..lineTo(size.x - 100, 0)
              ..fillPath()
              ..setColor(lightGreen)
              ..moveTo(size.x - 30, 0)
              ..lineTo(size.x - 110, 50)
              ..lineTo(size.x - 150, 0)
              ..fillPath();
          },
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({this.title, this.note, this.year, this.school, this.company});

  final String title;

  final String note;
  final String year;
  final String school;
  final String company;

  User users;
  Resume resume;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 2.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                      color: green, shape: pw.BoxShape.circle),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                //     ]),
                // company == ""
                //     ? pw.Container(width: 0, height: 0)
                //     : _Textt(textss: company.toString()),
                // note == ""
                //     ? pw.Container(width: 0, height: 0)
                //     : _Textt(textss: note.toString()),
                // year == ""
                //     ? pw.Container(width: 0, height: 0)
                //     : _Textt(textss: year.toString()),
                // postion == ""
                //     ? pw.Container(width: 0, height: 0)
                //     : _Textt(textss: postion.toString()),
                // filepath == ""
                //     ? pw.Container(width: 0, height: 0)
                //     : _Textt(textss: filepath.toString()),
              ])
        ]);
  }
}

class _Textt extends pw.StatelessWidget {
  _Textt({this.textss, this.year, this.note, this.company});

  final String textss;
  final String note;
  final String year;
  final String company;

  User users;
  Resume resume;

  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.BoxBorder(left: true, color: green, width: 2)),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(textss),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({this.title});

  final String title;
  User users;
  Resume resume;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        decoration: const pw.BoxDecoration(color: lightGreen, borderRadius: 6),
        margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
        padding: const pw.EdgeInsets.fromLTRB(10, 7, 10, 4),
        child: pw.Text(title, textScaleFactor: 1.5));
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    @required this.size,
    @required this.value,
    this.title,
    this.fontSize = 1.2,
    this.color = green,
    this.backgroundColor = PdfColors.grey300,
    this.strokeWidth = 5,
  }) : assert(size != null);

  final double size;

  final double value;

  final pw.Widget title;

  final double fontSize;

  final PdfColor color;

  final PdfColor backgroundColor;

  final double strokeWidth;

  @override
  pw.Widget build(pw.Context context) {
    final List<pw.Widget> widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    if (title != null) {
      widgets.add(title);
    }

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
