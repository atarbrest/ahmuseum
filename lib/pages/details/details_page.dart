import 'package:ahmuseum/data/service_locator.dart';
import 'package:ahmuseum/domain/blocs/details/details_bloc.dart';
import 'package:ahmuseum/pages/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final String objectNumber;

  const DetailsPage({
    required this.objectNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceLocator.I.get<DetailsBloc>()
        ..add(FetchDetails(objectNumber: widget.objectNumber)),
      child: const DetailsScreen(),
    );
  }
}
