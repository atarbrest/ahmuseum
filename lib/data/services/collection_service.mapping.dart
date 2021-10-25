part of 'collection_service.dart';

extension on CollectionDTO {
  Collection toModel() {
    return Collection(
      elapsedMilliseconds: elapsedMilliseconds,
      count: count,
      countFacets: countFacets.toModel(),
      artObjects: artObjects?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}

extension on CountFacetsDTO {
  CountFacets toModel() {
    return CountFacets(
      hasImage: hasImage,
      onDisplay: onDisplay,
    );
  }
}

extension on ArtObjectDTO {
  ArtObject toModel() {
    return ArtObject(
      links: links.toModel(),
      id: id,
      objectNumber: objectNumber,
      title: title,
      hasImage: hasImage,
      principalOrFirstMaker: principalOrFirstMaker,
      longTitle: longTitle,
      showImage: showImage,
      permitDownload: permitDownload,
      webImage: webImage,
      headerImage: headerImage,
      productionPlaces: productionPlaces,
    );
  }
}

extension on LinksDTO {
  Links toModel() {
    return Links(
      self: self,
      web: web,
    );
  }
}
