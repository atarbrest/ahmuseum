class CountFacetsDTO {
  final int hasImage;
  final int onDisplay;

  CountFacetsDTO({
    required this.hasImage,
    required this.onDisplay,
  });

  factory CountFacetsDTO.fromJson(Map<String, dynamic> json) {
    return CountFacetsDTO(
      hasImage: json['hasimage'],
      onDisplay: json['ondisplay'],
    );
  }
}
