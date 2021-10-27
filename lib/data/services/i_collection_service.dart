import 'package:ahmuseum/data/services/base_service.dart';
import 'package:ahmuseum/domain/entities/collection.dart';

abstract class ICollectionService extends BaseService {
  Future<Collection> fetchCollection({
    required int page,
    required int itemsPerPage,
  });
}
