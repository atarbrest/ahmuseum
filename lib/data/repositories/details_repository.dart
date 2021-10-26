import 'package:ahmuseum/data/services/details_service.dart';

class DetailsRepository {
  final DetailsService _detailsService;

  DetailsRepository(this._detailsService);

  Future<ArtObjectDetails> fetchArtDetails({
    required String objectNumber,
  }) async {
    return _detailsService.fetchArtDetails(objectNumber: objectNumber);
  }
}
