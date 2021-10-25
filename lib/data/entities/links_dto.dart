class LinksDTO {
  final String self;
  final String web;

  LinksDTO({
    required this.self,
    required this.web,
  });

  factory LinksDTO.fromJson(Map<String, dynamic> json) {
    return LinksDTO(
      self: json['self'],
      web: json['web'],
    );
  }
}
