import 'package:ahmuseum/domain/entities/art_object.dart';

class Collection {
  final int count;
  final List<ArtObject> artObjects;

  const Collection({
    required this.count,
    required this.artObjects,
  });
}
