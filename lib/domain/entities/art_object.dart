import 'package:ahmuseum/data/entities/image_dto.dart';
import 'package:ahmuseum/domain/entities/links.dart';

class ArtObject {
  final Links? links;
  final String id;
  final String objectNumber;
  final String title;
  final bool hasImage;
  final String principalOrFirstMaker;
  final String longTitle;
  final bool showImage;
  final bool permitDownload;
  final ImageDTO webImage;
  final ImageDTO headerImage;
  final List<String?> productionPlaces;

  ArtObject({
    required this.links,
    required this.id,
    required this.objectNumber,
    required this.title,
    required this.hasImage,
    required this.principalOrFirstMaker,
    required this.longTitle,
    required this.showImage,
    required this.permitDownload,
    required this.webImage,
    required this.headerImage,
    required this.productionPlaces,
  });
}
