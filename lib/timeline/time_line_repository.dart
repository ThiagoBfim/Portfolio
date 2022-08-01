import 'package:easy_localization/easy_localization.dart';
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
          name: 'ucb_name'.tr(),
          iconAsset: 'ucb.jpg',
          subtitle: 'ucb_course'.tr()),
      TimeLine(
          date: '2016-2017',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'mirante_job_1_position'.tr(),
          feitosDestaque: 'mirante_job_1_emphasis'.tr(),
          tecnologias: 'mirante_job_1_technologies'.tr(),
          atividadesDesenvolvidas: 'mirante_job_1_tasks'.tr()),
      TimeLine(
          date: '2017-2019',
          name: 'Singular',
          iconAsset: 'singular.png',
          subtitle: 'singular_job_1_position'.tr(),
          tecnologias: 'singular_job_1_technologies'.tr(),
          atividadesDesenvolvidas: 'singular_job_1_tasks'.tr()),
      TimeLine(
          date: '2019-2020',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'mirante_job_2_position'.tr(),
          feitosDestaque: 'mirante_job_2_emphasis'.tr(),
          tecnologias: 'mirante_job_2_technologies'.tr(),
          atividadesDesenvolvidas: 'mirante_job_2_tasks'.tr()),
      TimeLine(
          date: '2020-2020',
          name: 'Digital Innovation One',
          iconAsset: 'digital_innovation_one.png',
          subtitle: 'dio_job_1_position'.tr(),
          tecnologias: 'dio_job_1_technologies'.tr(),
          atividadesDesenvolvidas: 'dio_job_1_tasks'.tr()),
      TimeLine(
          date: '2020-2021',
          name: 'igti_name'.tr(),
          iconAsset: 'igti.jpg',
          subtitle: 'igti_course'.tr()),
      TimeLine(
          date: '2020-2021',
          name: 'Singular Studio',
          iconAsset: 'singular.png',
          subtitle: 'singular_job_2_position'.tr(),
          feitosDestaque: 'singular_job_2_emphasis'.tr(),
          tecnologias: 'singular_job_2_technologies'.tr(),
          atividadesDesenvolvidas: 'singular_job_2_tasks'.tr()),
      TimeLine(
          date: '2021',
          name: 'Aubay',
          iconAsset: 'aubay.png',
          subtitle: 'aubay_job_1_position'.tr(),
          feitosDestaque: 'aubay_job_1_emphasis'.tr(),
          tecnologias: 'aubay_job_1_technologies'.tr(),
          atividadesDesenvolvidas: 'aubay_job_1_tasks'.tr()),
    ];
  }
}
