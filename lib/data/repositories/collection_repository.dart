import 'package:ahmuseum/data/repositories/i_collection_repository.dart';
import 'package:ahmuseum/data/services/i_collection_service.dart';
import 'package:ahmuseum/domain/entities/collection.dart';

class CollectionRepository implements ICollectionRepository {
  final ICollectionService _collectionService;

  CollectionRepository(this._collectionService);

  @override
  Future<Collection> fetchCollection({
    required int page,
    required int itemsPerPage,
  }) async {
    return _collectionService.fetchCollection(
      page: page,
      itemsPerPage: itemsPerPage,
    );
  }
}
