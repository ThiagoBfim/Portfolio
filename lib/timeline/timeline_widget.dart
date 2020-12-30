import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_page/timeline/time_line_repository.dart';
import 'package:my_page/timeline/timeline_card.dart';
import 'package:my_page/timeline/timeline_indicator.dart';
import 'package:timelines/timelines.dart';

class TimeLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timeLines = TimeLineRepository.getTimeLines();
    return Container(
      child: Timeline.tileBuilder(
          theme: TimelineThemeData(
              direction: Axis.vertical,
              connectorTheme: ConnectorThemeData(space: 45.0, thickness: 5.0)),
          builder: TimelineTileBuilder.connected(
              connectorBuilder: (_, index, type) => Connector.solidLine(),
              connectionDirection: ConnectionDirection.before,
              contentsAlign: ContentsAlign.alternating,
              contentsBuilder: (context, index) =>
                  TimeLineCard(timeline: timeLines[index]),
              itemCount: timeLines.length,
              indicatorBuilder: (_, index) =>
                  TimeLineIndicator(timeline: timeLines[index]))),
    );
  }
}
