import 'package:ahmuseum/domain/entities/image.dart';

class ArtObject {
  final String id;
  final String objectNumber;
  final String title;
  final String principalOrFirstMaker;
  final String longTitle;
  final Image webImage;
  final Image headerImage;

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
