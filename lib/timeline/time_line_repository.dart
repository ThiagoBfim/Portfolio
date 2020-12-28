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
          subtitle: 'Sistema de Informação'),
      TimeLine(
          date: '2016-2017',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'Estágiario'),
      TimeLine(
          date: '2017-2019',
          name: 'OpenSingular',
          iconAsset: 'singular.png',
          subtitle: 'Engenheiro de Software'),
      TimeLine(
          date: '2019-2020',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'Engenheiro de Software'),
      TimeLine(
          date: '2020',
          name: 'OpenSingular Studio',
          iconAsset: 'singular.png',
          subtitle: 'Engenheiro de Software'),
    ];
  }
}
