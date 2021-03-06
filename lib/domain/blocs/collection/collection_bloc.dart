import 'dart:async';

import 'package:ahmuseum/data/repositories/i_collection_repository.dart';
import 'package:ahmuseum/domain/blocs/base/base_bloc.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:ahmuseum/domain/entities/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collection_state.dart';
part 'collection_event.dart';

class CollectionBloc extends BaseBloc<CollectionEvent, CollectionState> {
  final ICollectionRepository collectionRepository;

  CollectionBloc(this.collectionRepository) : super(InitialCollectionState()) {
    on<GetCollection>(_onGetCollection);
  }

  FutureOr<void> _onGetCollection(GetCollection event, Emitter<CollectionState> emit) async {
    emit(Loading());

    await makeExecution<Collection>(
      function: () async {
        final currentPage = event.existedItems.isEmpty ? 0 : event.existedItems.length ~/ event.limit;

        final collection = await collectionRepository.fetchCollection(
          page: currentPage + 1,
          itemsPerPage: event.limit,
        );

        return collection;
      },
      onSuccess: (value) async {
        emit(CollectionLoaded(
          newItems: value.artObjects,
          fullCount: value.count,
        ));
      },
      onError: () async {
        emit(Error());
      },
    );
  }
}
