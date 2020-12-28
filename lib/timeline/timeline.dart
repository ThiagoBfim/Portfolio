import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/timeline/time_line_repository.dart';
import 'package:timelines/timelines.dart';

class TimeLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timeLines = TimeLineRepository.getTimeLines();
    return Container(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.vertical,
          connectorTheme: ConnectorThemeData(
            space: 30.0,
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
              return Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, boxShadow: [kDefaultStrongShadow]),
                child: CircleAvatar(
                  backgroundImage: AssetImage('timeline/${timeline.iconAsset}'),
                  maxRadius: 50.0,
                ),
              );
            }),
      ),
    );
  }

  Card _buildCard(TimeLine timeline, BuildContext context) {
    return Card(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                timeline.date,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
              ),
              Text(
                timeline.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                timeline.subtitle,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
