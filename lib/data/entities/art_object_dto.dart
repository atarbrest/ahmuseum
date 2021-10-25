import 'package:ahmuseum/data/entities/image_dto.dart';
import 'package:ahmuseum/data/entities/links_dto.dart';

class ArtObjectDTO {
  final LinksDTO links;
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

  ArtObjectDTO({
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

  factory ArtObjectDTO.fromJson(Map<String, dynamic> json) {
    return ArtObjectDTO(
      links: LinksDTO.fromJson(json['links']),
      id: json['id'],
      objectNumber: json['objectNumber'],
      title: json['title'],
      hasImage: json['hasImage'],
      principalOrFirstMaker: json['principalOrFirstMaker'],
      longTitle: json['longTitle'],
      showImage: json['showImage'],
      permitDownload: json['permitDownload'],
      webImage: ImageDTO.fromJson(json['webImage']),
      headerImage: ImageDTO.fromJson(json['headerImage']),
      productionPlaces: (json['productionPlaces'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
