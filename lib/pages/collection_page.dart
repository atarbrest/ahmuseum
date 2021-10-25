import 'package:ahmuseum/data/service_locator.dart';
import 'package:ahmuseum/domain/blocs/collection_bloc.dart';
import 'package:ahmuseum/pages/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ServiceLocator.I.get<CollectionBloc>()..add(GetCollection()),
      child: const CollectionScreen(),
    );
  }
}
