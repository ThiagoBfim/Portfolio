import 'package:flutter/material.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';
import 'package:my_page/timeline/time_line_repository.dart';

class TimeLineIndicator extends StatelessWidget {
  final TimeLine timeline;

  const TimeLineIndicator({Key key, @required this.timeline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: timeline.isStudy() ? 30.0 : 0.0),
          child: Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle, boxShadow: [kDefaultShadow]),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/timeline/${timeline.iconAsset}'),
              maxRadius: isMobileView(context) ? 25 : 40.0,
            ),
          ),
        ),
        Visibility(
          visible: timeline.isStudy(),
          child: Positioned(
            left: 0,
            right: 3.0,
            top: isMobileView(context) ? -48 : -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/timeline/estudo.png'))),
            ),
          ),
        ),
      ],
    );
  }
}
