import 'package:ahmuseum/data/entities/image_dto.dart';

class ArtObject {
  final String id;
  final String objectNumber;
  final String title;
  final String principalOrFirstMaker;
  final String longTitle;
  final ImageDTO webImage;
  final ImageDTO headerImage;

  const ArtObject({
    required this.id,
    required this.objectNumber,
    required this.title,
    required this.principalOrFirstMaker,
    required this.longTitle,
    required this.webImage,
    required this.headerImage,
  });
}
