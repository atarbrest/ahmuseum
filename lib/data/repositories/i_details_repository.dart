import 'package:ahmuseum/data/services/details_service.dart';

abstract class IDetailsRepository {
  Future<ArtObjectDetails> fetchArtDetails({
    required String objectNumber,
  });
}
