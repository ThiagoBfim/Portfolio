import 'package:flutter/material.dart';

class TimeLine {
  final String date;
  final String name;
  final String iconAsset;
  final String subtitle;

  TimeLine(
      {@required this.date,
      @required this.name,
      @required this.iconAsset,
      @required this.subtitle});
}

class TimeLineRepository {
  static List<TimeLine> getTimeLines() {
    return [
      TimeLine(
          date: '2014-2017',
          name: 'Universidade Católica de Brasília',
          iconAsset: 'ucb.jpg',
          subtitle: 'Graduação em Sistema de Informação'),
      TimeLine(
          date: '2016-2017',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'Estágiario'),
      TimeLine(
          date: '2017-2019',
          name: 'Singular',
          iconAsset: 'singular.png',
          subtitle: 'Engenheiro de Software'),
      TimeLine(
          date: '2019-2020',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'Engenheiro de Software'),
      TimeLine(
          date: '2020-2020',
          name: 'Digital Innovation One',
          iconAsset: 'digital_innovation_one.png',
          subtitle: 'Instrutor de Flutter'),
      TimeLine(
          date: '2020',
          name: 'Instituto de Gestão e Tecnologia da Informação',
          iconAsset: 'igti.jpg',
          subtitle: 'MBA em Desenvolvimento Mobile'),
      TimeLine(
          date: '2020',
          name: 'Singular Studio',
          iconAsset: 'singular.png',
          subtitle: 'Engenheiro de Software'),
    ];
  }
}
