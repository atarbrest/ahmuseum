class ImageDTO {
  final String guid;
  final int offsetPercentageX;
  final int offsetPercentageY;
  final int width;
  final int height;
  final String url;

  ImageDTO({
    required this.guid,
    required this.offsetPercentageX,
    required this.offsetPercentageY,
    required this.width,
    required this.height,
    required this.url,
  });

  factory ImageDTO.fromJson(Map<String, dynamic> json) {
    return ImageDTO(
      guid: json['guid'],
      offsetPercentageX: json['offsetPercentageX'],
      offsetPercentageY: json['offsetPercentageY'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
    );
  }
}
