import 'package:ahmuseum/domain/blocs/collection/collection_bloc.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:ahmuseum/pages/details/details_page.dart';
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
        _bloc.add(
          GetCollection(
            existedItems: _pagingController.itemList ?? [],
            offset: pageKey,
          ),
        );
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

            // if (_pagingController.itemList != null) {
            //   final existed = newItems
            //       .every((e) => _pagingController.itemList!.contains(e));
            //   if (existed) {
            //     log('existed');
            //     return;
            //   }
            // }

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
            return SafeArea(
              child: PagedListView<int, ArtObject>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<ArtObject>(
                  firstPageProgressIndicatorBuilder: (context) =>
                      state is Loading
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox.shrink(),
                  newPageProgressIndicatorBuilder: (context) => state is Loading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink(),
                  noItemsFoundIndicatorBuilder: (context) => const Center(
                    child: Text('No item found'),
                  ),
                  itemBuilder: (context, item, index) =>
                      ArtWidget(index: index, item: item),
                ),
              ),
            );
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
            CachedNetworkImage(
              imageUrl: item.headerImage.url,
              height: 80,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: LinearProgressIndicator(
                    value: progress.progress,
                  ),
                );
              },
            )
          ],
        ),
        children: [
          Text(item.longTitle),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(objectNumber: item.objectNumber),
              ),
            ),
            child: const Text('Go Details'),
          ),
        ],
      ),
    );
  }
}
