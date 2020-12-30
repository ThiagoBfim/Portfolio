import 'package:flutter/material.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';
import 'package:my_page/shared/section_tile.dart';
import 'package:my_page/timeline/timeline_widget.dart';

class TimeLineSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Colors.purple,
            title: "Linha do Tempo",
            subTitle: "Minha trajetória",
          ),
          Container(height: isMobileView(context) ? 300 : 1200, child: TimeLineWidget()),
        ],
      ),
    );
  }
}
