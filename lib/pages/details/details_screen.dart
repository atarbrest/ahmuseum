import 'package:ahmuseum/domain/blocs/details/details_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DetailsBloc>();
    final item = bloc.viewModel;
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: const Text('Details Page')),
            body: state is Loading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(item.title),
                      const SizedBox(height: 10),
                      Text(item.principalMaker),
                      const SizedBox(height: 10),
                      Text(item.description),
                      const SizedBox(height: 10),
                      if (item.webImage != null)
                        CachedNetworkImage(
                          imageUrl: item.webImage!.url,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            );
                          },
                        ),
                      const SizedBox(height: 10),
                    ],
                  ));
      },
    );
  }
}
