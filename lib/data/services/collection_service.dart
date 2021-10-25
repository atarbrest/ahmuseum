import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ahmuseum/data/entities/art_object_dto.dart';
import 'package:ahmuseum/data/entities/collection_dto.dart';
import 'package:ahmuseum/data/entities/count_facets_dto.dart';
import 'package:ahmuseum/data/entities/links_dto.dart';
import 'package:ahmuseum/data/services/base_service.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:ahmuseum/domain/entities/collection.dart';
import 'package:ahmuseum/domain/entities/count_facets.dart';
import 'package:ahmuseum/domain/entities/links.dart';

part 'collection_service.mapping.dart';

class CollectionService extends BaseService {
  CollectionService();

  Future<Collection> getCollection({
    required int page,
    required int itemsPerPage,
  }) async {
    try {
      const culture = 'en';
      const apiKey = '0fiuZFh4';

      final url = Uri.https(
        'www.rijksmuseum.nl',
        '/api/$culture/collection',
        {
          'key': apiKey,
          'p': page.toString(),
          'ps': itemsPerPage.toString(),
        },
      );

      final response = await client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final result = CollectionDTO.fromJson(decodedResponse);
        return result.toModel();
      }
      throw Exception('Failed to load colllection');
    } catch (ex) {
      log(ex.toString());
      throw Exception('Failed to load colllection');
    }
  }
}
