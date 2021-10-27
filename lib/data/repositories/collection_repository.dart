import 'package:ahmuseum/data/services/collection_service.dart';
import 'package:ahmuseum/domain/entities/collection.dart';

class CollectionRepository {
  final CollectionService _collectionService;

  CollectionRepository(this._collectionService);

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
