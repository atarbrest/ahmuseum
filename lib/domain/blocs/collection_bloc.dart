import 'dart:developer';

import 'package:ahmuseum/data/repositories/collection_repository.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collection_state.dart';
part 'collection_event.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository collectionRepository;
  static const kItemsPerPage = 10;

  CollectionBloc(this.collectionRepository) : super(InitialCollectionState()) {
    on<GetCollection>(
      (event, emit) async {
        // if (state is IsLoading) {
        //   log('______is still busy. wait a bit');
        //   return;
        // }

        emit(IsLoading(isBusy: true));

        final currentPage = event.existedItems.isEmpty
            ? 0
            : event.existedItems.length ~/ kItemsPerPage;

        final collection = await collectionRepository.getCollection(
          page: currentPage + 1,
          itemsPerPage: kItemsPerPage,
        );

        // should check if items already existed in collection
        final alreadyInList =
            collection.artObjects.every((e) => event.existedItems.contains(e));
        if (alreadyInList) {
          emit(IsLoading(isBusy: false));

          log('!!! items already was loaded before !!!');
          return;
        }

        emit(
          CollectionLoaded(
            newItems: collection.artObjects,
            fullCount: collection.count,
          ),
        );
      },
    );
  }
}
