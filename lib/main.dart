import 'package:ahmuseum/app.dart';
import 'package:ahmuseum/data/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await ServiceLocator.I.init();

  runApp(const MyApp());
}
