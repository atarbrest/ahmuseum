class ImageDTO {
  final String url;

  const ImageDTO({
    required this.url,
  });

  factory ImageDTO.fromJson(Map<String, dynamic> json) {
    return ImageDTO(
      url: json['url'],
    );
  }
}
