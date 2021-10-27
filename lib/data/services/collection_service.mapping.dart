part of 'collection_service.dart';

extension on CollectionDTO {
  Collection toModel() {
    return Collection(
      elapsedMilliseconds: elapsedMilliseconds,
      count: count,
      artObjects: artObjects?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}

extension on ArtObjectDTO {
  ArtObject toModel() {
    return ArtObject(
      id: id,
      objectNumber: objectNumber,
      title: title,
      principalOrFirstMaker: principalOrFirstMaker,
      longTitle: longTitle,
      webImage: webImage,
      headerImage: headerImage,
    );
  }
}
