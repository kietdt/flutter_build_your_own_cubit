import 'dart:async';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:app_links/app_links.dart';

class DeepLinkConf {
  final _appLinks = AppLinks();
  StreamSubscription? linkSub;

  Future<Uri?> init() async {
    linkSub?.cancel();
    linkSub = _appLinks.allUriLinkStream.listen((uri) {
      // navigate herelog('DeepLinkConf -> initLink: $initLink');
      log('allUriLinkStream -> uri: $uri');
    });

    Uri? initLink = await _appLinks.getInitialAppLink();
    log('DeepLinkConf -> initLink: $initLink');
    return initLink;
  }
}
