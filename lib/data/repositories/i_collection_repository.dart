import 'package:ahmuseum/domain/entities/collection.dart';

abstract class ICollectionRepository {
  Future<Collection> fetchCollection({
    required int page,
    required int itemsPerPage,
  });
}
