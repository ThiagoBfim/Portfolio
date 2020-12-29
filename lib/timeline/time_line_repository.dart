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
          subtitle: 'Estágiario',
          feitosDestaque: '''Integração com VOIP(Callbox) via API REST.
Inclusão do Flyway para o gerenciamento de scripts.''',
          tecnologias:
              'Java 8, Spring, Wicket, HTML, CSS, JS, JasperReport, Git e SQL Server.',
          atividadesDesenvolvidas:
              '''Criação e manutenção de um sistema para gerenciamento de hotéis, contratos, e área
de atendimento para o contratante do serviço prestado pela Montreal Turismo.'''),
      TimeLine(
          date: '2017-2019',
          name: 'Singular',
          iconAsset: 'singular.png',
          subtitle: 'Engenheiro de Software',
          tecnologias: 'Java 8, Hibernate, Wicket, Spring e Git.',
          atividadesDesenvolvidas:
              '''Desenvolvimento de componentes e manutenção na arquitetura para uma plataforma
open source.'''),
      TimeLine(
          date: '2019-2020',
          name: 'Mirante Tecnologia',
          iconAsset: 'mirante.png',
          subtitle: 'Engenheiro de Software',
          tecnologias: 'Flutter, Java 8, Java 11, Angular, Angular JS, JSF, Hibernate, Wicket, Spring, Jenkins, Gitlab CI/CD, OracleSQL e SQLServer. ',
          feitosDestaque: '''Realização de integração com API REST para realização de pagamentos com PagTesouro.
Evolução e manutenção de um dos principais sistemas da Anvisa.''',
          atividadesDesenvolvidas:
              '''Análise e desenvolvimento de sistemas para a Anvisa, que proporcionou uma economia de mais de 32 milhões em um ano.
Análise e desenvolvimento de um aplicativo Mobile para o Incra e de uma API REST para comunicação.'''),
      TimeLine(
          date: '2020-2020',
          name: 'Digital Innovation One',
          iconAsset: 'digital_innovation_one.png',
          subtitle: 'Instrutor de Flutter',
          tecnologias: 'Flutter, Gitlab CI. ',
          atividadesDesenvolvidas:
              '''Criação de 3 módulos ensinando Flutter.
Um módulo introdutório.
Um módulo contendo integração com API Rest.
Um módulo ensinando a realizar uma aplicação do zero à produção.'''),
      TimeLine(
          date: '2020',
          name: 'Instituto de Gestão e Tecnologia da Informação',
          iconAsset: 'igti.jpg',
          subtitle: 'MBA em Desenvolvimento Mobile'),
      TimeLine(
          date: '2020',
          name: 'Singular Studio',
          iconAsset: 'singular.png',
          subtitle: 'Engenheiro de Software',
          feitosDestaque: '''Integração de uma ferramente para assinatura digital.
Integração de login com o GOV.BR via OAUTH2.
Inclusão do Flyway para o gerenciamento de scripts.''',
          tecnologias: 'Java 8, Hibernate, Wicket, Spring, Git e PostgreSQL.',
          atividadesDesenvolvidas:
              '''Criação, implementação, manutenção e implantação de uma plataforma no code.'''),
    ];
  }
}
