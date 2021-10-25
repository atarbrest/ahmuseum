import 'package:ahmuseum/pages/collection_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CollectionPage(title: 'Home Page'),
    );
  }
}
