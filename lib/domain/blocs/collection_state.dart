part of 'collection_bloc.dart';

abstract class CollectionState {}

class InitialCollectionState extends CollectionState {}

class IsLoading extends CollectionState {
  final bool isBusy;

  IsLoading({required this.isBusy});
}

class CollectionLoaded extends CollectionState {
  final List<ArtObject> newItems;
  final int fullCount;

  CollectionLoaded({
    required this.newItems,
    required this.fullCount,
  });
}
