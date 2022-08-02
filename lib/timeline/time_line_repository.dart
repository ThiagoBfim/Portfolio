import 'package:flutter/material.dart';

class TimeLine {
  final String date;
  final String name;
  final String iconAsset;
  final String subtitle;
  final String atividadesDesenvolvidas;
  final String tecnologias;
  final String feitosDestaque;

  TimeLine(
      {@required this.date,
      @required this.name,
      @required this.iconAsset,
      this.atividadesDesenvolvidas,
      this.tecnologias,
      this.feitosDestaque,
      @required this.subtitle});

  isStudy() => tecnologias == null;

  isNotStudy() => !isStudy();
}

class TimeLineRepository {
  static List<TimeLine> getTimeLines() {
    return [
      TimeLine(
          date: '2014-2017',
          name: 'Universidade Católica de Brasília',
          iconAsset: 'ucb.jpg',
          subtitle: 'ucb_course'),
      TimeLine(
          date: '2016-2017',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'mirante_job_1_position',
          feitosDestaque: 'mirante_job_1_emphasis',
          tecnologias: 'mirante_job_1_technologies',
          atividadesDesenvolvidas: 'mirante_job_1_tasks'),
      TimeLine(
          date: '2017-2019',
          name: 'Singular',
          iconAsset: 'singular.png',
          subtitle: 'singular_job_1_position',
          tecnologias: 'singular_job_1_technologies',
          atividadesDesenvolvidas: 'singular_job_1_tasks'),
      TimeLine(
          date: '2019-2020',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'mirante_job_2_position',
          feitosDestaque: 'mirante_job_2_emphasis',
          tecnologias: 'mirante_job_2_technologies',
          atividadesDesenvolvidas: 'mirante_job_2_tasks'),
      TimeLine(
          date: '2020-2020',
          name: 'Digital Innovation One',
          iconAsset: 'digital_innovation_one.png',
          subtitle: 'dio_job_1_position',
          tecnologias: 'dio_job_1_technologies',
          atividadesDesenvolvidas: 'dio_job_1_tasks'),
      TimeLine(
          date: '2020-2021',
          name: 'Instituto de Gestão e Tecnologia da Informação',
          iconAsset: 'igti.jpg',
          subtitle: 'igti_course'),
      TimeLine(
          date: '2020-2021',
          name: 'Singular Studio',
          iconAsset: 'singular.png',
          subtitle: 'singular_job_2_position',
          feitosDestaque: 'singular_job_2_emphasis',
          tecnologias: 'singular_job_2_technologies',
          atividadesDesenvolvidas: 'singular_job_2_tasks'),
      TimeLine(
          date: '2021',
          name: 'Aubay',
          iconAsset: 'aubay.png',
          subtitle: 'aubay_job_1_position',
          feitosDestaque: 'aubay_job_1_emphasis',
          tecnologias: 'aubay_job_1_technologies',
          atividadesDesenvolvidas: 'aubay_job_1_tasks'),
    ];
  }
}
