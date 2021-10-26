part of 'collection_bloc.dart';

abstract class CollectionState extends BaseState {}

class InitialCollectionState extends CollectionState {}

class Loading extends CollectionState {}

class CollectionLoaded extends CollectionState {
  final List<ArtObject> newItems;
  final int fullCount;

  CollectionLoaded({
    required this.newItems,
    required this.fullCount,
  });
}

class Error extends CollectionState {}
