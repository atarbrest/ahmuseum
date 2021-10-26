part of 'details_service.dart';

extension on CollectionDetailsDto {
  CollectionDetails toModel() {
    return CollectionDetails(
      elapsedMilliseconds: elapsedMilliseconds,
      artObject: artObject.toModel(),
      artObjectPage: artObjectPage,
    );
  }
}

class CollectionDetails {
  int elapsedMilliseconds;
  ArtObjectDetails artObject;
  ArtObjectPage artObjectPage;

  CollectionDetails({
    required this.elapsedMilliseconds,
    required this.artObject,
    required this.artObjectPage,
  });
}

extension on ArtObjectDetailsDto {
  ArtObjectDetails toModel() {
    return ArtObjectDetails(
      links: links,
      id: id,
      // priref: priref,
      objectNumber: objectNumber,
      // language: language,
      title: title,
      webImage: webImage,
      // colors: colors,
      // colorsWithNormalization: colorsWithNormalization,
      // normalizedColors: normalizedColors,
      // normalized32Colors: normalized32Colors,
      // titles: titles,
      description: description,
      // objectTypes: objectTypes,
      // objectCollection: objectCollection,
      // makers: makers,
      // principalMakers: principalMakers,
      // plaqueDescriptionDutch: plaqueDescriptionDutch,
      // plaqueDescriptionEnglish: plaqueDescriptionEnglish,
      principalMaker: principalMaker,
      // associations: associations,
      // acquisition: acquisition,
      // exhibitions: exhibitions,
      // materials: materials,
      // techniques: techniques,
      // productionPlaces: productionPlaces,
      // dating: dating,
      // classification: classification,
      // hasImage: hasImage,
      // historicalPersons: historicalPersons,
      // inscriptions: inscriptions,
      // documentation: documentation,
      // catRefRpk: catRefRpk,
      // principalOrFirstMaker: principalOrFirstMaker,
      // dimensions: dimensions,
      // physicalProperties: physicalProperties,
      // physicalMedium: physicalMedium,
      // longTitle: longTitle,
      // subTitle: subTitle,
      // scLabelLine: scLabelLine,
      // label: label,
      // showImage: showImage,
      // location: location,
      // copyrightHolder: copyrightHolder,
      // labelText: labelText,
      // artistRole: artistRole,
    );
  }
}

class ArtObjectDetails {
  Links links;
  String id;
  // String priref;
  String objectNumber;
  // String language;
  String title;
  // dynamic copyrightHolder;
  WebImage webImage;
  // List<Color> colors;
  // List<ColorsWithNormalization> colorsWithNormalization;
  // List<Color> normalizedColors;
  // List<Color> normalized32Colors;
  // List<String> titles;
  String description;
  // dynamic labelText;
  // List<String> objectTypes;
  // List<String> objectCollection;
  // List<dynamic> makers;
  // List<PrincipalMaker> principalMakers;
  // String plaqueDescriptionDutch;
  // String plaqueDescriptionEnglish;
  String principalMaker;
  // dynamic artistRole;
  // List<dynamic> associations;
  // Acquisition acquisition;
  // List<dynamic> exhibitions;
  // List<String> materials;
  // List<dynamic> techniques;
  // List<String> productionPlaces;
  // Dating dating;
  // Classification classification;
  // bool hasImage;
  // List<String> historicalPersons;
  // List<dynamic> inscriptions;
  // List<String> documentation;
  // List<dynamic> catRefRpk;
  // String principalOrFirstMaker;
  // List<Dimension> dimensions;
  // List<dynamic> physicalProperties;
  // String physicalMedium;
  // String longTitle;
  // String subTitle;
  // String scLabelLine;
  // Label label;
  // bool showImage;
  // String location;

  ArtObjectDetails({
    required this.links,
    required this.id,
    // required this.priref,
    required this.objectNumber,
    // required this.language,
    required this.title,
    required this.webImage,
    // required this.colors,
    // required this.colorsWithNormalization,
    // required this.normalizedColors,
    // required this.normalized32Colors,
    // required this.titles,
    required this.description,
    // required this.objectTypes,
    // required this.objectCollection,
    // required this.makers,
    // required this.principalMakers,
    // required this.plaqueDescriptionDutch,
    // required this.plaqueDescriptionEnglish,
    required this.principalMaker,
    // required this.associations,
    // required this.acquisition,
    // required this.exhibitions,
    // required this.materials,
    // required this.techniques,
    // required this.productionPlaces,
    // required this.dating,
    // required this.classification,
    // required this.hasImage,
    // required this.historicalPersons,
    // required this.inscriptions,
    // required this.documentation,
    // required this.catRefRpk,
    // required this.principalOrFirstMaker,
    // required this.dimensions,
    // required this.physicalProperties,
    // required this.physicalMedium,
    // required this.longTitle,
    // required this.subTitle,
    // required this.scLabelLine,
    // required this.label,
    // required this.showImage,
    // required this.location,
    // this.copyrightHolder,
    // this.labelText,
    // this.artistRole,
  });
}
