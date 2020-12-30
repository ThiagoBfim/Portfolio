import 'package:flutter/material.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';
import 'package:my_page/timeline/time_line_repository.dart';

class TimeLineIndicator extends StatelessWidget {

  final TimeLine timeline;

  const TimeLineIndicator({Key key, @required this.timeline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.circle, boxShadow: [kDefaultStrongShadow]),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/timeline/${timeline.iconAsset}'),
        maxRadius: isMobileView(context) ? 25 : 50.0,
      ),
    );
  }
}
