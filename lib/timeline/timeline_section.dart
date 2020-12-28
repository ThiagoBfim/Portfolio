import 'package:flutter/material.dart';
import 'package:my_page/knowledge/knowledge_repository.dart';
import 'package:my_page/knowledge/knowledge_card.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/section_tile.dart';
import 'package:my_page/timeline/timeline.dart';

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
          Container(height: 800, child: TimeLineWidget()),
        ],
      ),
    );
  }
}
