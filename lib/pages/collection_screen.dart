import 'dart:developer';

import 'package:ahmuseum/domain/blocs/collection_bloc.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final PagingController<int, ArtObject> _pagingController =
      PagingController(firstPageKey: 0);

  late CollectionBloc _bloc;

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener(
      (pageKey) {
        log('--------- controller.pageRequestListener(pageKey: $pageKey');
        final existedItems = _pagingController.itemList ?? [];
        if (pageKey < existedItems.length) {
          log('!!! pageKey is wrong !!!');
          // return;
        }

        _bloc.add(GetCollection(
          existedItems: existedItems,
          offset: pageKey,
        ));
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.watch<CollectionBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Page'),
      ),
      body: BlocListener<CollectionBloc, CollectionState>(
        listener: (context, state) {
          if (state is CollectionLoaded) {
            final newItems = state.newItems;

            if (_pagingController.itemList != null) {
              final existed = newItems
                  .every((e) => _pagingController.itemList!.contains(e));
              if (existed) {
                log('existed');
                return;
              }
            }

            final existedItemsLength = _pagingController.itemList?.length ?? 0;

            final nextPageItem = existedItemsLength + newItems.length + 1;
            if (nextPageItem > state.fullCount) {
              _pagingController.appendLastPage(newItems);
            } else {
              _pagingController.appendPage(newItems, nextPageItem);
            }
          }
        },
        child: BlocBuilder<CollectionBloc, CollectionState>(
          builder: (context, state) {
            final noItems = _pagingController.itemList == null ||
                _pagingController.itemList!.isEmpty;

            if (noItems && state is IsLoading && state.isBusy) {
              return const Center(child: LinearProgressIndicator());
            } else {
              return noItems
                  ? const Center(child: Text('List is empty'))
                  : SafeArea(
                      child: PagedListView<int, ArtObject>(
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate<ArtObject>(
                          itemBuilder: (
                            context,
                            item,
                            index,
                          ) =>
                              ArtWidget(
                            index: index,
                            item: item,
                          ),
                        ),
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}

class ArtWidget extends StatelessWidget {
  final int index;
  final ArtObject item;

  const ArtWidget({
    required this.index,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${index + 1}. ${item.title}',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(item.id),
            Image.network(
              item.headerImage.url,
              cacheHeight: item.headerImage.height,
              cacheWidth: item.headerImage.width,
            ),
          ],
        ),
        children: [
          Text(item.longTitle),
          CachedNetworkImage(
            imageUrl: item.webImage.url,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: SizedBox.square(
                  child: LinearProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
