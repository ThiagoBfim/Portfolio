import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';
import 'package:my_page/timeline/time_line_repository.dart';
import 'package:timelines/timelines.dart';

class TimeLineWidget extends StatefulWidget {
  @override
  _TimeLineWidgetState createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animatable<Color> background;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    background = TweenSequence<Color>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green[200].withOpacity(0.6),
            end: Colors.green[300].withOpacity(0.6),
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green[300].withOpacity(0.6),
            end: Colors.green[200].withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var timeLines = TimeLineRepository.getTimeLines();
    return Container(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.vertical,
          connectorTheme: ConnectorThemeData(
            space: 40.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
            connectorBuilder: (_, index, type) => Connector.solidLine(),
            connectionDirection: ConnectionDirection.before,
            contentsAlign: ContentsAlign.alternating,
            contentsBuilder: (context, index) {
              var timeline = timeLines[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildCard(timeline, context),
              );
            },
            itemCount: timeLines.length,
            indicatorBuilder: (_, index) {
              var timeline = timeLines[index];
              return _buildImage(timeline);
            }),
      ),
    );
  }

  Container _buildImage(TimeLine timeline) {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.circle, boxShadow: [kDefaultStrongShadow]),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/timeline/${timeline.iconAsset}'),
        maxRadius: isMobileView(context) ? 25 : 50.0,
      ),
    );
  }

  Widget _buildCard(TimeLine timeline, BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return InkWell(
            onTap: timeline.atividadesDesenvolvidas != null
                ? _showDialog(timeline)
                : null,
            child: Card(
              color: timeline.atividadesDesenvolvidas != null
                  ? background
                      .evaluate(AlwaysStoppedAnimation(_controller.value))
                  : Colors.white.withOpacity(0.2),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        timeline.date,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: isMobileView(context) ? 14 : 20.0),
                      ),
                      Text(
                        timeline.name,
                        textAlign: TextAlign.center,
                        style: isMobileView(context)
                            ? Theme.of(context).textTheme.subtitle1
                            : Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        timeline.subtitle,
                        style: isMobileView(context)
                            ? Theme.of(context).textTheme.subtitle2
                            : Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _infoAtividade(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  _showDialog(TimeLine timeline) {
    return () => showDialog(
        context: this.context,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: contentBox(timeline, context),
            ));
  }

  contentBox(TimeLine timeline, BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Container(
          width: 800,
          padding: EdgeInsets.only(left: 15.0, right: 10.0, top: 40.0),
          margin: EdgeInsets.only(top: 75.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [kDefaultStrongShadow]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(timeline.name, style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 15),
              _infoAtividade('Atividades Desenvolvidas:'),
              _infoDetailAtividade(timeline.atividadesDesenvolvidas),
              SizedBox(height: 10),
              _infoAtividade('Tecnologias:'),
              _infoDetailAtividade(timeline.tecnologias),
              SizedBox(height: 10),
              Visibility(
                  visible: timeline.feitosDestaque != null,
                  child: _infoAtividade('Feitos de destaque:')),
              _infoDetailAtividade(timeline.feitosDestaque),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'fechar',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        )),
                  )),
            ],
          ),
        ),
        Positioned(
            left: 10,
            right: 10,
            child: Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, boxShadow: [kDefaultStrongShadow]),
                child: CircleAvatar(
                  maxRadius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      child: Image.asset(
                        'assets/timeline/${timeline.iconAsset}',
                      )),
                ))),
      ],
    ));
  }

  Padding _infoDetailAtividade(String detailAtividade) {
    return Padding(
        padding: EdgeInsets.only(
          top: 5.0,
          bottom: 15.0,
        ),
        child: Text(
          detailAtividade ?? '',
          style: Theme.of(context).textTheme.subtitle1,
        ));
  }
}
