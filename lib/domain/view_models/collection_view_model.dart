import 'package:ahmuseum/domain/entities/art_object.dart';

class CollectionViewModel {
  final List<ArtObject> items;
  final int count;

  CollectionViewModel({
    required this.items,
    required this.count,
  });

  factory CollectionViewModel.initial() => CollectionViewModel(
        items: [],
        count: 0,
      );
}
