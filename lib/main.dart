import 'package:flutter/material.dart';
import 'package:my_page/about/about_section.dart';
import 'package:my_page/knowledge/knowledge_section.dart';
import 'package:my_page/timeline/timeline_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AboutSection(),
              KnowledgeSection(),
              TimeLineSection(),
            ],
          ),
        ),
      ),
    );
  }
}
