import 'package:flutter/material.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/screen_view.dart';

import 'knowledge_repository.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    var conhecimento = KnowledgeRepository.conhecimentos[widget.index];
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        hoverColor: Colors.transparent,
        child: AnimatedContainer(
          duration: duration,
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
          height: 256,
          width: 256,
          decoration: BoxDecoration(
            color: conhecimento.color.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 50,
              color: conhecimento.color.withOpacity(0.5),
            )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(conhecimento),
              SizedBox(height: kDefaultPadding),
              Text(
                conhecimento.title,
                style: TextStyle(fontSize: isMobileView(context) ? 18 : 22),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer _icon(Knowledge conhecimento) {
    return AnimatedContainer(
      duration: duration,
      padding: EdgeInsets.all(kDefaultPadding),
      height: isMobileView(context) ? 80 : 120,
      width: isMobileView(context) ? 80 :  120,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          if (!isHover)
            BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.1),
            ),
        ],
      ),
      child: Image.asset(
        'assets/conhecimentos/${conhecimento.image}',
        fit: BoxFit.fill,
      ),
    );
  }
}
