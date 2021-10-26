import 'package:ahmuseum/data/entities/collection_details_dto.dart';

class DetailsViewModel {
  final String title;
  final String description;
  final WebImage? webImage;
  final String principalMaker;

  DetailsViewModel({
    required this.title,
    required this.description,
    required this.principalMaker,
    this.webImage,
  });

  factory DetailsViewModel.initial() => DetailsViewModel(
        title: '',
        description: '',
        principalMaker: '',
      );
}
