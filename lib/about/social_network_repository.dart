import 'package:flutter/cupertino.dart';

class SocialNetwork {
  final String url;
  final String iconAsset;

  SocialNetwork({@required this.url, @required this.iconAsset});
}

class SocialNetworkRepository {

  static List<SocialNetwork> getSocialNetworks() {
    return [
      SocialNetwork(iconAsset: 'github.png', url: 'https://github.com/ThiagoBfim'),
      SocialNetwork(iconAsset: 'gitlab.png', url: 'https://gitlab.com/ThiagoBfim'),
      SocialNetwork(iconAsset: 'linkedin.png', url: 'https://www.linkedin.com/in/thiagobfim'),
      SocialNetwork(iconAsset: 'stackoverflow.png', url: 'https://stackoverflow.com/users/8377722/thiago-bomfim'),
      SocialNetwork(iconAsset: 'kaggle.png', url: 'https://www.kaggle.com/thiagobfim'),
    ];
  }

}
