import 'package:flutter/material.dart';
import 'package:my_page/knowledge/knowledge_card.dart';
import 'package:my_page/knowledge/knowledge_repository.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';
import 'package:my_page/shared/section_tile.dart';

class KnowledgeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Colors.red,
            title: "Conhecimentos",
            subTitle: "Meus interesses",
          ),
          Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Container(
                height: isMobileView(context) ? 250 : 600,
                child: GridView.builder(
                  itemBuilder: (_, index) => ServiceCard(index: index),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobileView(context) ? 2 : 4),
                  itemCount: KnowledgeRepository.conhecimentos.length,
                ),
              )),
        ],
      ),
    );
  }
}
