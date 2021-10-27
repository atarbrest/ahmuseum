import 'dart:convert';
import 'dart:io';

import 'package:ahmuseum/data/entities/art_object_dto.dart';
import 'package:ahmuseum/data/entities/collection_dto.dart';
import 'package:ahmuseum/data/services/base_service.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:ahmuseum/domain/entities/collection.dart';

part 'collection_service.mapping.dart';

class CollectionService extends BaseService {
  CollectionService();

  Future<Collection> fetchCollection({
    required int page,
    required int itemsPerPage,
  }) async {
    final result = await executeRequest<Collection, CollectionDTO>(
      invoker: () async {
        final url = Uri.https(
          host,
          '/api/$culture/collection',
          {
            'key': apiKey,
            'p': page.toString(),
            'ps': itemsPerPage.toString(),
          },
        );
        // final url = Uri.parse(
        //     'https://$host/api/$culture/collection?key=$apiKey&p=${page.toString()}&ps=${itemsPerPage.toString()}');

        final response = await client.get(
          url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );
        return response;
      },
      mapper: (value) {
        final decodedResponse = jsonDecode(value);
        final result = CollectionDTO.fromJson(decodedResponse);
        return result.toModel();
      },
    );
    return result;
  }
}
