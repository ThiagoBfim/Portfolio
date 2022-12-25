import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfUtil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            child: Text(
              'Generate PDF',
              style: TextStyle(color: Colors.transparent),
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.transparent)),
            onPressed: _createPDF,
          )
        ],
      ),
    );
  }

  Future<void> _createPDF() async {
    final pdf = pw.Document();
    final emoji = await PdfGoogleFonts.notoColorEmoji();
    final loop = await PdfGoogleFonts.zenLoopRegular();

    pdf.addPage(firstPage(emoji, loop)); // Page
    pdf.addPage(secondPage(emoji, loop)); // Page

    final Uint8List bytes = await pdf.save();

    await saveAndLaunchFile(bytes, 'CV.pdf');
  }

  pw.Page firstPage(pw.Font emoji, pw.Font loop) {
    return pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(fontSize: 10, letterSpacing: 0.2)),
        margin: pw.EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Center(
              child:
                  pw.Text("THIAGO BOMFIM", style: pw.TextStyle(fontSize: 22.0)),
            ),
            pw.SizedBox(height: 5),
            pw.Center(
              child: pw.Text("SOFTWARE ENGINEER",
                  style: pw.TextStyle(fontSize: 10.0)),
            ),
            pw.SizedBox(height: 20),
            pw.Expanded(
                child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                  createLeftColumn(emoji),
                  pw.VerticalDivider(
                    thickness: 1,
                    indent: 0,
                    endIndent: 20,
                    color: PdfColor.fromHex("#000000"),
                  ),
                  createRightColumn(emoji, loop)
                ]))
          ]);
        });
  }

  pw.Widget createLeftColumn(pw.Font emoji) {
    return pw.Container(
        width: 150,
        child: pw.Wrap(
            direction: pw.Axis.vertical,
            crossAxisAlignment: pw.WrapCrossAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              pw.Text("° DETAILS ° ",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontFallback: [emoji],
                  )),
              pw.Text("thiago.bomfim.work@gmail.com"),
              pw.Text("Lisbon/PT"),
              pw.SizedBox(height: 5),
              pw.Text("° SKILLS ° ",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontFallback: [emoji],
                  )),
              pw.Text("HTML & CSS"),
              pw.Text("JavaScript"),
              pw.Text("SQL"),
              pw.Text("Java"),
              pw.Text("Spring framework"),
              pw.Text("SQL"),
              pw.Text("Flutter"),
              pw.Text("Git"),
              pw.Text("Agile & Scrum"),
              pw.Text("Docker"),
              pw.Text("Kubernetes"),
              pw.Text("Linux"),
              pw.SizedBox(height: 5),
              pw.Text("° LANGUAGES ° ",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontFallback: [emoji],
                  )),
              pw.Text("Portuguese - C2"),
              pw.Text("English - B2"),
            ]));
  }

  pw.Expanded createRightColumn(pw.Font emoji, pw.Font loop) {
    return pw.Expanded(
        child: pw.Wrap(spacing: 20, runSpacing: 10, children: [
      pw.Container(
          alignment: pw.Alignment.topLeft,
          child: pw.Text("👤 PROFILE",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontFallback: [emoji],
              ))),
      pw.Text(
          "Technology knowledge for me is a superpower, and I want to use this superpower to improve other's lives."),
      pw.Text(
          "I want to work with the mission of generating software that adds value to people, with best practices and good code quality."),
      pw.Container(
          alignment: pw.Alignment.topLeft,
          child: pw.Text("💻 EXPERIENCE",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontFallback: [emoji],
              ))),
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: buildExperienceHistory(loop))
    ]));
  }

  List<pw.Widget> buildExperienceHistory(pw.Font loop) {
    List<pw.Widget> history = [];

    _aubayExperience(loop, history);
    _singularExperience(loop, history);
    _dioExperience(loop, history);
    _miranteExperience(loop, history);
    _singular2Experience(loop, history);
    return history;
  }

  void _miranteExperience(pw.Font loop, List<pw.Widget> history) {
    var experience = pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Senior Java Developer at Mirante Tecnologia, Brasilia",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text("July 2019 - August 2020",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
          pw.SizedBox(height: 5),
          pw.Text("• Analysis and development of systems for Anvisa",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text(
              "• Analysis and development of a Mobile application for INCRA and API Rest for communication;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text(
              "• Responsible for the evolution and maintenance of one of Anvisa's main systems;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.SizedBox(height: 5),
          pw.Text(
              "Technologies:Flutter, Java 8, Java 11, Angular, Angular JS, JSF, Hibernate, Wicket, Spring, Jenkins, Gitlab, OracleSQL and SQLServer."),
          pw.SizedBox(height: 10),
        ]);
    history.add(experience);
  }

  void _dioExperience(pw.Font loop, List<pw.Widget> history) {
    var experience = pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Flutter Instructor at Digital Innovation One,Brasilia",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text("August 2020 - December 2020",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
          pw.SizedBox(height: 5),
          pw.Text(
              "• Responsible for the creation of 3 modules teaching Flutter. An introductory module, " +
                  "a module containing integration with Rest API, and a module teaching how to create" +
                  "an application from scratch to production.",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.SizedBox(height: 5),
          pw.Text("Technologies: Dart, Flutter, GitLab CI"),
          pw.SizedBox(height: 10),
        ]);
    history.add(experience);
  }

  void _singularExperience(pw.Font loop, List<pw.Widget> history) {
    var experience = pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Principal Developer at OpenSingular, Brasilia",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text("August 2020 - July 2021",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
          pw.SizedBox(height: 5),
          pw.Text(
              "• Creation, implementation, maintenance, and implantation of a product no code;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Integration of a tool for digital signature;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Integration with GOV.BR authentication using OAUTH2;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Inclusion of Flyway for managing scripts;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text(
              "• Creating docker and Dart project to generate dynamic apk with the external configuration;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text(
              "• Creating of the mobile application and API with JWT authentication;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.SizedBox(height: 5),
          pw.Text(
              "Technologies: Java 8, Hibernate, Wicket, Spring, Git, HTML, CSS, JS, Dart, Flutter, Docker, PostgreSQL"),
          pw.SizedBox(height: 10),
        ]);
    history.add(experience);
  }

  void _aubayExperience(pw.Font loop, List<pw.Widget> history) {
    var experience = pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Senior Developer at Aubay PT, Lisbon",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text("July 2021",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
          pw.SizedBox(height: 5),
          pw.Text("• Responsible for managing and defining the CI/CD pipeline;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Responsible for the Cloud Environment;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Training teams with best practices and code quality; ",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Mentorship and technical interviews; ",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Create components and design code to improve team work. ",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.SizedBox(height: 5),
          pw.Text(
              "Technologies: Java 8/11/17, Spring Boot, SQL, SOAP, Jenkins, Git, Docker, Kubernetes, Helm, OpenShift, ElasticSearch, Splunk"),
          pw.SizedBox(height: 10),
        ]);
    history.add(experience);
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', fileName)
      ..click();
  }

  secondPage(pw.Font emoji, pw.Font loop) {
    return pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(fontSize: 10, letterSpacing: 0.2)),
        margin: pw.EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Expanded(
                child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                  pw.Container(width: 150),
                  pw.VerticalDivider(
                    thickness: 1,
                    indent: 0,
                    endIndent: 20,
                    color: PdfColor.fromHex("#000000"),
                  ),
                  createRightColumnSecondPage(emoji, loop)
                ]))
          ]);
        });
  }

  createRightColumnSecondPage(pw.Font emoji, pw.Font loop) {
    return pw.Expanded(
        child: pw.Wrap(
      spacing: 20,
      runSpacing: 10,
      children: [
        pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: buildExperienceHistorySecondPage(loop)),
        pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text("🎓 EDUCATION",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontFallback: [emoji],
                ))),
        createSmallInfo(
            loop,
            emoji,
            "Bachelor’s Degree in Information System, University Catolica of Brasilia, Brasilia",
            "January 2014 - December 2017"),
        createSmallInfo(
            loop,
            emoji,
            "MBA in Mobile Development,Institute of Management and Information Technology(IGTI)",
            "July 2020 - July 2021"),
        pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text("📚 COURSES",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontFallback: [emoji],
                ))),
        createSmallInfo(
            loop, emoji, "FullCycle Developer, Code.Education", "2021"),
        createSmallInfo(
            loop,
            emoji,
            "Design Practices and Code Architecture for Java Applications, Caelum",
            "2020"),
        createSmallInfo(loop, emoji,
            "Docker: Creating Containers without a headache, Alura", "2020"),
        createSmallInfo(
            loop,
            emoji,
            "Gitlab, Cl and Docker: Continuous Delivery Pipeline, Alura",
            "2020"),
        createSmallInfo(
            loop,
            emoji,
            "Kubernetes: Introduction to Container orchestration, Alura",
            "2020"),
        createSmallInfo(
            loop,
            emoji,
            "Unit Tests and Widget with Mocks: good practices in Flutter, Alura",
            "2020"),
        createSmallInfo(loop, emoji,
            "Solid with Java: guidance for objects with Java, Alura", "2020"),
        pw.Container(
            alignment: pw.Alignment.topLeft,
            child: pw.Text("🏅 CERTIFICATIONS",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontFallback: [emoji],
                ))),
        createSmallInfo(
            loop,
            emoji,
            "Oracle Cloud Infrastructure Developer 2021 Associate (1Z0-1084-21)",
            "2022"),
        createSmallInfo(loop, emoji,
            "Oracle Cloud Infrastructure Foundations (1Z0-1085-21)", "2021"),
        createSmallInfo(
            loop, emoji, "Scrum FoundationProfessional Certificate", "2020"),
        createSmallInfo(loop, emoji,
            "Oracle Certified Professional Java SE 8 Programmer II (1Z0-809) ", "2018"),
        createSmallInfo(loop, emoji,
            "Oracle Certified Associate Java SE 8 Programmer (1Z0-808)", "2017"),
      ],
    ));
  }

  pw.Widget createSmallInfo(
      pw.Font loop, pw.Font emoji, String text, String data) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(text,
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontFallback: [emoji, loop],
              )),
          pw.Text(data,
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
        ]);
  }

  List<pw.Widget> buildExperienceHistorySecondPage(pw.Font loop) {
    List<pw.Widget> history = [];

    _mirante2Experience(loop, history);
    return history;
  }

  void _mirante2Experience(pw.Font loop, List<pw.Widget> history) {
    var experience = pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Java Developer at Mirante Tecnologia, Brasilia",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text("January 2016 - December 2017",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
          pw.SizedBox(height: 5),
          pw.Text(
              "• Creation and maintenance of a hotel management system, contracts and customer service;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Inclusion of Flyway for the management of scripts;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Integration with VOIP(Callbox) using API REST.",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.SizedBox(height: 5),
          pw.Text(
              "Technologies: Java 8, Spring, Wicket, HTML, CSS, JS, JasperReport, Git, and SQL Server."),
          pw.SizedBox(height: 10),
        ]);
    history.add(experience);
  }

  void _singular2Experience(pw.Font loop, List<pw.Widget> history) {
    var experience = pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Software Engineer at Open Singular, Brasilia",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text("January 2018 - July 2019",
              style: pw.TextStyle(
                color: PdfColor.fromHex("#878787"),
              )),
          pw.SizedBox(height: 5),
          pw.Text(
              "• Component development and architecture maintenance for a platform low code and open source;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text("• Creation of a component integrating with Google Maps;",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.Text(
              "• Responsible for the evolution of architecture, in order to ensure minimum break changes and refactoring’s to update versions.",
              style: pw.TextStyle(fontFallback: [loop])),
          pw.SizedBox(height: 5),
          pw.Text(
              "Technologies: Java 8, Hibernate, Wicket, Spring, Git, HTML, CSS, JavaScript."),
          pw.SizedBox(height: 10),
        ]);
    history.add(experience);
  }
}
