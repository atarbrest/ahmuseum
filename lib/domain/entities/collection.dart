import 'package:ahmuseum/domain/entities/art_object.dart';

class Collection {
  final int elapsedMilliseconds;
  final int count;
  final List<ArtObject> artObjects;

  const Collection({
    required this.elapsedMilliseconds,
    required this.count,
    required this.artObjects,
  });
}
