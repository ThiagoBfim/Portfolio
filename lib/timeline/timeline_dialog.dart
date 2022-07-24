import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/timeline/time_line_repository.dart';

class TimeLineDialog extends StatelessWidget {
  final TimeLine timeline;

  const TimeLineDialog({Key key, @required this.timeline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Container(
          width: 800,
          padding: EdgeInsets.only(left: 15.0, right: 10.0, top: 40.0),
          margin: EdgeInsets.only(top: 75.0),
          decoration: _dialogBorder(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(timeline.name, style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 15),
              _infoAtividade('Atividades Desenvolvidas:', context),
              _infoDetailAtividade(timeline.atividadesDesenvolvidas, context),
              SizedBox(height: 10),
              _infoAtividade('Tecnologias:', context),
              _infoDetailAtividade(timeline.tecnologias, context),
              SizedBox(height: 10),
              Visibility(
                  visible: timeline.feitosDestaque != null,
                  child: _infoAtividade('Feitos de destaque:', context)),
              _infoDetailAtividade(timeline.feitosDestaque, context),
              SizedBox(height: 10),
              _buildCloseButton(context),
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

  BoxDecoration _dialogBorder(BuildContext context) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        color: AdaptiveTheme.of(context).mode.isDark
            ? Colors.black.withOpacity(0.85)
            : Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AdaptiveTheme.of(context).mode.isDark
                ? Colors.black45
                : Colors.white54,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          )
        ]);
  }

  Padding _buildCloseButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'fechar',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              )),
        ));
  }

  Padding _infoDetailAtividade(String detailAtividade, BuildContext context) {
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

  Widget _infoAtividade(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
