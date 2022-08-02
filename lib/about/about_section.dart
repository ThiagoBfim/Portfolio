import 'package:easy_localization/easy_localization.dart';
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
            title: "about".tr(),
            subTitle: "about_me".tr(),
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
                  TextSpan(text: 'about_me_sentence_1'.tr()),
                  TextSpan(text: 'about_me_sentence_2'.tr()),
                  TextSpan(text: 'about_me_sentence_3'.tr()),
                  TextSpan(
                      text: 'about_me_sentence_4'.tr(),
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(text: 'about_me_sentence_5'.tr()),
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
                  TextSpan(text: 'about_me_it_sentence_1'.tr()),
                  TextSpan(text: 'about_me_it_sentence_2'.tr()),
                  TextSpan(
                      text: 'about_me_it_sentence_3'.tr(),
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
              'CV',
              style: TextStyle(color: Colors.blue, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
