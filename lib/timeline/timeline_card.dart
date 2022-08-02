import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';
import 'package:my_page/timeline/time_line_repository.dart';
import 'package:my_page/timeline/timeline_dialog.dart';

class TimeLineCard extends StatefulWidget {
  final TimeLine timeline;

  const TimeLineCard({Key key, @required this.timeline}) : super(key: key);

  @override
  _TimeLineCardState createState() => _TimeLineCardState(timeline);
}

class _TimeLineCardState extends State<TimeLineCard>
    with SingleTickerProviderStateMixin {
  final TimeLine timeline;
  AnimationController _controller;
  Animatable<Color> background;

  _TimeLineCardState(this.timeline);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    background = TweenSequence<Color>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green[200].withOpacity(0.6),
            end: Colors.green[300].withOpacity(0.9),
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green[300].withOpacity(0.9),
            end: Colors.green[200].withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return InkWell(
            onTap: timeline.isNotStudy() ? _showDialog(timeline) : null,
            child: Card(
              color: timeline.isNotStudy()
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
                        timeline.subtitle.tr(),
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

  _showDialog(TimeLine timeline) {
    return () => showDialog(
        context: this.context,
        builder: (_) => TimeLineDialog(timeline: timeline));
  }
}
