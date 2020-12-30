import 'package:flutter/material.dart';

class Knowledge {
  final int id;
  final String title, image;
  final Color color;

  Knowledge({this.id, this.title, this.image, this.color});
}

class KnowledgeRepository {
// For demo list of service
  static List<Knowledge> conhecimentos = [
    Knowledge(
      id: 1,
      title: "Java",
      image: "java.png",
      color: Colors.blue[200],
    ),
    Knowledge(
      id: 2,
      title: "Spring Framework",
      image: "spring.jpg",
      color: Colors.blue[200],
    ),
    Knowledge(
      id: 3,
      title: "Flutter",
      image: "flutter.png",
      color: Colors.green[200],
    ),
    Knowledge(
      id: 4,
      title: "CSS",
      image: "css.png",
      color: Colors.red[200],
    ),
    Knowledge(
      id: 5,
      title: "HTML",
      image: "html.png",
      color: Colors.red[200],
    ),
    Knowledge(
      id: 6,
      title: "JS",
      image: "javascript.png",
      color: Colors.red[200],
    ),
    Knowledge(
      id: 7,
      title: "Angular",
      image: "angular.png",
      color: Colors.red[200],
    ),
    Knowledge(
      id: 8,
      title: "SQL",
      image: "sql.png",
      color: Colors.purple[200],
    ),
    Knowledge(
      id: 9,
      title: "Docker",
      image: "docker.png",
      color: Colors.yellow[200],
    ),
  ];
}
