import 'package:flutter/material.dart';
import 'package:my_page/about/social_network_repository.dart';
import 'package:my_page/shared/constans.dart';
import 'package:my_page/shared/section_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Colors.green,
            title: "Sobre",
            subTitle: "Sobre mim",
          ),
          Column(
            children: [
              _sobreMim(context),
              _sobreTecnologia(context),
              _redeSociais(context),
              _curriculo(context),
            ],
          )
        ],
      ),
    );
  }

  Container _sobreMim(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: <TextSpan>[
                  TextSpan(
                      text:
                          'Me chamo Thiago Santos do Bomfim, e sou um engenheiro de software.\n'),
                  TextSpan(
                      text:
                          'Eu sou muito apaixonado pelo potencial que a tecnologia tem de mudar a vida das pessoas.\n'),
                  TextSpan(
                      text:
                          'Isso me motiva a estar estudando cada vez mais, pois compartilho do pensamento'),
                  TextSpan(
                      text:
                          ' "Para quem só sabe usar martelo, todo problema é prego"',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text:
                          ', então estou sempre estudando e aprendendo as melhores praticas e melhores maneiras de resolver determinado problema.'),
                ]),
          ),
        ));
  }

  Container _sobreTecnologia(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: <TextSpan>[
                  TextSpan(
                      text:
                          'Sou adepto ao manifesto agil e as boas práticas.\n'),
                  TextSpan(
                      text:
                          'Penso que o código precisa ser simples e que consiga agregar valor para determinada pessoa. '
                          'Tento sempre fazer código limpo, seguindo os princípios do SOLID e também compartilho do pensamento '),
                  TextSpan(
                      text: '"Código legado é aquele sem testes."',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ]),
          ),
        ));
  }

  _redeSociais(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              SocialNetworkRepository.getSocialNetworks().length,
              (index) {
                var social = SocialNetworkRepository.getSocialNetworks()[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(100.0),
                  onTap: () => _launchURL(social.url),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/about/${social.iconAsset}',
                      height: 100,
                      width: 100,
                    ),
                  ),
                );
              },
            )));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _curriculo(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () => _launchURL(
          'https://thiagobfim.github.io/Portfolio/assets/assets/thiago-cv.pdf'),
      child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/about/favicon.png'),
              height: 80,
              width: 80,
            ),
            Text(
              'Currículo',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
