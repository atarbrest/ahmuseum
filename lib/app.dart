import 'package:ahmuseum/domain/services/navigator_service.dart';
import 'package:ahmuseum/pages/collection/collection_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CollectionPage(),
    );
  }
}
