import 'package:ahmuseum/data/services/base_service.dart';
import 'package:ahmuseum/data/services/details_service.dart';

abstract class IDetailsService extends BaseService {
  Future<ArtObjectDetails> fetchArtDetails({
    required String objectNumber,
  });
}
