import 'package:ahmuseum/data/entities/art_object_dto.dart';
import 'package:ahmuseum/data/entities/count_facets_dto.dart';

class CollectionDTO {
  final int count;
  final CountFacetsDTO countFacets;
  final List<ArtObjectDTO>? artObjects;

  CollectionDTO({
    required this.count,
    required this.countFacets,
    required this.artObjects,
  });

  factory CollectionDTO.fromJson(Map<String, dynamic> json) {
    return CollectionDTO(
      count: json['count'],
      countFacets: CountFacetsDTO.fromJson(json['countFacets']),
      artObjects: (json['artObjects'] as List<dynamic>?)?.map((e) => ArtObjectDTO.fromJson(e)).toList() ?? [],
    );
  }
}
