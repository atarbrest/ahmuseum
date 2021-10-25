import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:ahmuseum/domain/entities/count_facets.dart';

class Collection {
  final int elapsedMilliseconds;
  final int count;
  final CountFacets countFacets;
  final List<ArtObject> artObjects;

  Collection({
    required this.elapsedMilliseconds,
    required this.count,
    required this.countFacets,
    required this.artObjects,
  });
}
