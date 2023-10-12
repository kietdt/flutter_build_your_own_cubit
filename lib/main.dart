import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_own_cubit/app.dart';
import 'package:my_own_cubit/config/deeplink/deep_links.dart';

void main() {
  runApp(const MyApp());
  init();
}

void init() async {
  DeepLinkConf deepLinkConf = DeepLinkConf();
  Uri? initUri = await deepLinkConf.init();
  log('init -> initUri: $initUri');
}
