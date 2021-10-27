import 'package:ahmuseum/data/repositories/i_details_repository.dart';
import 'package:ahmuseum/data/services/details_service.dart';
import 'package:ahmuseum/data/services/i_details_service.dart';

class DetailsRepository implements IDetailsRepository {
  final IDetailsService _detailsService;

  DetailsRepository(this._detailsService);

  @override
  Future<ArtObjectDetails> fetchArtDetails({
    required String objectNumber,
  }) async {
    return _detailsService.fetchArtDetails(objectNumber: objectNumber);
  }
}
