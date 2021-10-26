import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ahmuseum/data/entities/collection_details_dto.dart';
import 'package:ahmuseum/data/services/base_service.dart';

part 'details_service.mapping.dart';

class DetailsService extends BaseService {
  DetailsService();

  Future<ArtObjectDetails> fetchArtDetails({
    required String objectNumber,
  }) async {
    final result = executeRequest<ArtObjectDetails, ArtObjectDetailsDto>(
      invoker: () async {
        final url = Uri.https(
          host,
          '/api/$culture/collection/$objectNumber',
          {
            'key': apiKey,
          },
        );

        final response = await client.get(
          url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );
        return response;
      },
      mapper: (dto) {
        final decodedResponse = jsonDecode(dto);
        final result = CollectionDetailsDto.fromJson(decodedResponse);
        final collectionDetails = result.toModel();
        final artDetails = collectionDetails.artObject;
        return artDetails;
      },
    );
    return result;
  }
}
