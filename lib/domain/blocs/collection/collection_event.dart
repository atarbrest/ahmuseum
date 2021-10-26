part of 'collection_bloc.dart';

abstract class CollectionEvent extends BaseEvent {}

class GetCollection extends CollectionEvent {
  final List<ArtObject> existedItems;
  final int offset;
  final int limit;

  GetCollection({
    this.existedItems = const [],
    this.offset = 0,
    this.limit = CollectionBloc.kItemsPerPage,
  });
}
