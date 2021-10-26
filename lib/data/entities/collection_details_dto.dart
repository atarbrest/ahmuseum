import 'dart:convert';

CollectionDetailsDto collectionDetailsDtoFromJson(String str) =>
    CollectionDetailsDto.fromJson(json.decode(str));

String collectionDetailsDtoToJson(CollectionDetailsDto data) =>
    json.encode(data.toJson());

class CollectionDetailsDto {
  CollectionDetailsDto({
    required this.elapsedMilliseconds,
    required this.artObject,
    required this.artObjectPage,
  });

  int elapsedMilliseconds;
  ArtObjectDetailsDto artObject;
  ArtObjectPage artObjectPage;

  factory CollectionDetailsDto.fromJson(Map<String, dynamic> json) =>
      CollectionDetailsDto(
        elapsedMilliseconds: json['elapsedMilliseconds'],
        artObject: ArtObjectDetailsDto.fromJson(json['artObject']),
        artObjectPage: ArtObjectPage.fromJson(json['artObjectPage']),
      );

  Map<String, dynamic> toJson() => {
        'elapsedMilliseconds': elapsedMilliseconds,
        'artObject': artObject.toJson(),
        'artObjectPage': artObjectPage.toJson(),
      };
}

class ArtObjectDetailsDto {
  ArtObjectDetailsDto({
    required this.links,
    required this.id,
    required this.priref,
    required this.objectNumber,
    required this.language,
    required this.title,
    required this.webImage,
    required this.colors,
    required this.colorsWithNormalization,
    required this.normalizedColors,
    required this.normalized32Colors,
    required this.titles,
    required this.description,
    required this.objectTypes,
    required this.objectCollection,
    required this.makers,
    // required this.principalMakers,
    required this.plaqueDescriptionDutch,
    required this.plaqueDescriptionEnglish,
    required this.principalMaker,
    required this.associations,
    required this.acquisition,
    required this.exhibitions,
    required this.materials,
    required this.techniques,
    required this.productionPlaces,
    required this.dating,
    required this.classification,
    required this.hasImage,
    required this.historicalPersons,
    required this.inscriptions,
    required this.documentation,
    required this.catRefRpk,
    required this.principalOrFirstMaker,
    required this.dimensions,
    required this.physicalProperties,
    required this.physicalMedium,
    required this.longTitle,
    required this.subTitle,
    required this.scLabelLine,
    required this.label,
    required this.showImage,
    required this.location,
    this.copyrightHolder,
    this.labelText,
    this.artistRole,
  });

  Links links;
  String id;
  String priref;
  String objectNumber;
  String language;
  String title;
  dynamic copyrightHolder;
  WebImage webImage;
  List<Color> colors;
  List<ColorsWithNormalization> colorsWithNormalization;
  List<Color> normalizedColors;
  List<Color> normalized32Colors;
  List<String> titles;
  String description;
  dynamic labelText;
  List<String> objectTypes;
  List<String> objectCollection;
  List<dynamic> makers;
  // List<PrincipalMaker> principalMakers;
  String plaqueDescriptionDutch;
  String plaqueDescriptionEnglish;
  String principalMaker;
  dynamic artistRole;
  List<dynamic> associations;
  Acquisition acquisition;
  List<dynamic> exhibitions;
  List<String> materials;
  List<dynamic> techniques;
  List<String> productionPlaces;
  Dating dating;
  Classification classification;
  bool hasImage;
  List<String> historicalPersons;
  List<dynamic> inscriptions;
  List<String> documentation;
  List<dynamic> catRefRpk;
  String principalOrFirstMaker;
  List<Dimension> dimensions;
  List<dynamic> physicalProperties;
  String physicalMedium;
  String longTitle;
  String subTitle;
  String scLabelLine;
  Label label;
  bool showImage;
  String location;

  factory ArtObjectDetailsDto.fromJson(Map<String, dynamic> json) =>
      ArtObjectDetailsDto(
        links: Links.fromJson(json['links']),
        id: json['id'],
        priref: json['priref'],
        objectNumber: json['objectNumber'],
        language: json['language'],
        title: json['title'],
        copyrightHolder: json['copyrightHolder'],
        webImage: WebImage.fromJson(json['webImage']),
        colors: List<Color>.from(json['colors'].map((x) => Color.fromJson(x))),
        colorsWithNormalization: List<ColorsWithNormalization>.from(
            json['colorsWithNormalization']
                .map((x) => ColorsWithNormalization.fromJson(x))),
        normalizedColors: List<Color>.from(
            json['normalizedColors'].map((x) => Color.fromJson(x))),
        normalized32Colors: List<Color>.from(
            json['normalized32Colors'].map((x) => Color.fromJson(x))),
        titles: List<String>.from(json['titles'].map((x) => x)),
        description: json['description'],
        labelText: json['labelText'],
        objectTypes: List<String>.from(json['objectTypes'].map((x) => x)),
        objectCollection:
            List<String>.from(json['objectCollection'].map((x) => x)),
        makers: List<dynamic>.from(json['makers'].map((x) => x)),
        // principalMakers: List<PrincipalMaker>.from(
        //     json['principalMakers'].map((x) => PrincipalMaker.fromJson(x))),
        plaqueDescriptionDutch: json['plaqueDescriptionDutch'],
        plaqueDescriptionEnglish: json['plaqueDescriptionEnglish'],
        principalMaker: json['principalMaker'],
        artistRole: json['artistRole'],
        associations: List<dynamic>.from(json['associations'].map((x) => x)),
        acquisition: Acquisition.fromJson(json['acquisition']),
        exhibitions: List<dynamic>.from(json['exhibitions'].map((x) => x)),
        materials: List<String>.from(json['materials'].map((x) => x)),
        techniques: List<dynamic>.from(json['techniques'].map((x) => x)),
        productionPlaces:
            List<String>.from(json['productionPlaces'].map((x) => x)),
        dating: Dating.fromJson(json['dating']),
        classification: Classification.fromJson(json['classification']),
        hasImage: json['hasImage'],
        historicalPersons:
            List<String>.from(json['historicalPersons'].map((x) => x)),
        inscriptions: List<dynamic>.from(json['inscriptions'].map((x) => x)),
        documentation: List<String>.from(json['documentation'].map((x) => x)),
        catRefRpk: List<dynamic>.from(json['catRefRPK'].map((x) => x)),
        principalOrFirstMaker: json['principalOrFirstMaker'],
        dimensions: List<Dimension>.from(
            json['dimensions'].map((x) => Dimension.fromJson(x))),
        physicalProperties:
            List<dynamic>.from(json['physicalProperties'].map((x) => x)),
        physicalMedium: json['physicalMedium'],
        longTitle: json['longTitle'],
        subTitle: json['subTitle'],
        scLabelLine: json['scLabelLine'],
        label: Label.fromJson(json['label']),
        showImage: json['showImage'],
        location: json['location'],
      );

  Map<String, dynamic> toJson() => {
        'links': links.toJson(),
        'id': id,
        'priref': priref,
        'objectNumber': objectNumber,
        'language': language,
        'title': title,
        'copyrightHolder': copyrightHolder,
        'webImage': webImage.toJson(),
        'colors': List<dynamic>.from(colors.map((x) => x.toJson())),
        'colorsWithNormalization':
            List<dynamic>.from(colorsWithNormalization.map((x) => x.toJson())),
        'normalizedColors':
            List<dynamic>.from(normalizedColors.map((x) => x.toJson())),
        'normalized32Colors':
            List<dynamic>.from(normalized32Colors.map((x) => x.toJson())),
        'titles': List<dynamic>.from(titles.map((x) => x)),
        'description': description,
        'labelText': labelText,
        'objectTypes': List<dynamic>.from(objectTypes.map((x) => x)),
        'objectCollection': List<dynamic>.from(objectCollection.map((x) => x)),
        'makers': List<dynamic>.from(makers.map((x) => x)),
        // 'principalMakers':
        //     List<dynamic>.from(principalMakers.map((x) => x.toJson())),
        'plaqueDescriptionDutch': plaqueDescriptionDutch,
        'plaqueDescriptionEnglish': plaqueDescriptionEnglish,
        'principalMaker': principalMaker,
        'artistRole': artistRole,
        'associations': List<dynamic>.from(associations.map((x) => x)),
        'acquisition': acquisition.toJson(),
        'exhibitions': List<dynamic>.from(exhibitions.map((x) => x)),
        'materials': List<dynamic>.from(materials.map((x) => x)),
        'techniques': List<dynamic>.from(techniques.map((x) => x)),
        'productionPlaces': List<dynamic>.from(productionPlaces.map((x) => x)),
        'dating': dating.toJson(),
        'classification': classification.toJson(),
        'hasImage': hasImage,
        'historicalPersons':
            List<dynamic>.from(historicalPersons.map((x) => x)),
        'inscriptions': List<dynamic>.from(inscriptions.map((x) => x)),
        'documentation': List<dynamic>.from(documentation.map((x) => x)),
        'catRefRPK': List<dynamic>.from(catRefRpk.map((x) => x)),
        'principalOrFirstMaker': principalOrFirstMaker,
        'dimensions': List<dynamic>.from(dimensions.map((x) => x.toJson())),
        'physicalProperties':
            List<dynamic>.from(physicalProperties.map((x) => x)),
        'physicalMedium': physicalMedium,
        'longTitle': longTitle,
        'subTitle': subTitle,
        'scLabelLine': scLabelLine,
        'label': label.toJson(),
        'showImage': showImage,
        'location': location,
      };
}

class Acquisition {
  Acquisition({
    required this.method,
    required this.date,
    required this.creditLine,
  });

  String method;
  DateTime date;
  String creditLine;

  factory Acquisition.fromJson(Map<String, dynamic> json) => Acquisition(
        method: json['method'],
        date: DateTime.parse(json['date']),
        creditLine: json['creditLine'],
      );

  Map<String, dynamic> toJson() => {
        'method': method,
        'date': date.toIso8601String(),
        'creditLine': creditLine,
      };
}

class Classification {
  Classification({
    required this.iconClassIdentifier,
    required this.iconClassDescription,
    required this.motifs,
    required this.events,
    required this.periods,
    required this.places,
    required this.people,
    required this.objectNumbers,
  });

  List<String> iconClassIdentifier;
  List<String> iconClassDescription;
  List<dynamic> motifs;
  List<dynamic> events;
  List<dynamic> periods;
  List<String> places;
  List<String> people;
  List<String> objectNumbers;

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
        iconClassIdentifier:
            List<String>.from(json['iconClassIdentifier'].map((x) => x)),
        iconClassDescription:
            List<String>.from(json['iconClassDescription'].map((x) => x)),
        motifs: List<dynamic>.from(json['motifs'].map((x) => x)),
        events: List<dynamic>.from(json['events'].map((x) => x)),
        periods: List<dynamic>.from(json['periods'].map((x) => x)),
        places: List<String>.from(json['places'].map((x) => x)),
        people: List<String>.from(json['people'].map((x) => x)),
        objectNumbers: List<String>.from(json['objectNumbers'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'iconClassIdentifier':
            List<dynamic>.from(iconClassIdentifier.map((x) => x)),
        'iconClassDescription':
            List<dynamic>.from(iconClassDescription.map((x) => x)),
        'motifs': List<dynamic>.from(motifs.map((x) => x)),
        'events': List<dynamic>.from(events.map((x) => x)),
        'periods': List<dynamic>.from(periods.map((x) => x)),
        'places': List<dynamic>.from(places.map((x) => x)),
        'people': List<dynamic>.from(people.map((x) => x)),
        'objectNumbers': List<dynamic>.from(objectNumbers.map((x) => x)),
      };
}

class Color {
  Color({
    required this.percentage,
    required this.hex,
  });

  int percentage;
  String hex;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        percentage: json['percentage'],
        hex: json['hex'],
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'hex': hex,
      };
}

class ColorsWithNormalization {
  ColorsWithNormalization({
    required this.originalHex,
    required this.normalizedHex,
  });

  String originalHex;
  String normalizedHex;

  factory ColorsWithNormalization.fromJson(Map<String, dynamic> json) =>
      ColorsWithNormalization(
        originalHex: json['originalHex'],
        normalizedHex: json['normalizedHex'],
      );

  Map<String, dynamic> toJson() => {
        'originalHex': originalHex,
        'normalizedHex': normalizedHex,
      };
}

class Dating {
  Dating({
    required this.presentingDate,
    required this.sortingDate,
    required this.period,
    required this.yearEarly,
    required this.yearLate,
  });

  String presentingDate;
  int sortingDate;
  int period;
  int yearEarly;
  int yearLate;

  factory Dating.fromJson(Map<String, dynamic> json) => Dating(
        presentingDate: json['presentingDate'],
        sortingDate: json['sortingDate'],
        period: json['period'],
        yearEarly: json['yearEarly'],
        yearLate: json['yearLate'],
      );

  Map<String, dynamic> toJson() => {
        'presentingDate': presentingDate,
        'sortingDate': sortingDate,
        'period': period,
        'yearEarly': yearEarly,
        'yearLate': yearLate,
      };
}

class Dimension {
  Dimension({
    required this.unit,
    required this.type,
    required this.value,
    this.dimensionPart,
  });

  String unit;
  String type;
  dynamic dimensionPart;
  String value;

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
        unit: json['unit'],
        type: json['type'],
        dimensionPart: json['part'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'unit': unit,
        'type': type,
        'part': dimensionPart,
        'value': value,
      };
}

class Label {
  Label({
    required this.title,
    required this.makerLine,
    required this.description,
    required this.date,
    this.notes,
  });

  String title;
  String makerLine;
  String description;
  dynamic notes;
  DateTime date;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        title: json['title'],
        makerLine: json['makerLine'],
        description: json['description'],
        notes: json['notes'],
        date: DateTime.parse(json['date']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'makerLine': makerLine,
        'description': description,
        'notes': notes,
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class Links {
  Links({
    required this.search,
  });

  String search;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        search: json['search'],
      );

  Map<String, dynamic> toJson() => {
        'search': search,
      };
}

class PrincipalMaker {
  PrincipalMaker({
    required this.name,
    required this.unFixedName,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.placeOfDeath,
    required this.occupation,
    required this.roles,
    required this.productionPlaces,
    this.dateOfBirthPrecision,
    this.dateOfDeathPrecision,
    this.nationality,
    this.biography,
    this.qualification,
  });

  String name;
  String unFixedName;
  String placeOfBirth;
  DateTime dateOfBirth;
  dynamic dateOfBirthPrecision;
  DateTime dateOfDeath;
  dynamic dateOfDeathPrecision;
  String placeOfDeath;
  List<String> occupation;
  List<String> roles;
  dynamic nationality;
  dynamic biography;
  List<String> productionPlaces;
  dynamic qualification;

  factory PrincipalMaker.fromJson(Map<String, dynamic> json) => PrincipalMaker(
        name: json['name'],
        unFixedName: json['unFixedName'],
        placeOfBirth: json['placeOfBirth'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        dateOfBirthPrecision: json['dateOfBirthPrecision'],
        dateOfDeath: DateTime.parse(json['dateOfDeath']),
        dateOfDeathPrecision: json['dateOfDeathPrecision'],
        placeOfDeath: json['placeOfDeath'],
        occupation: List<String>.from(json['occupation'].map((x) => x)),
        roles: List<String>.from(json['roles'].map((x) => x)),
        nationality: json['nationality'],
        biography: json['biography'],
        productionPlaces:
            List<String>.from(json['productionPlaces'].map((x) => x)),
        qualification: json['qualification'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'unFixedName': unFixedName,
        'placeOfBirth': placeOfBirth,
        'dateOfBirth':
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        'dateOfBirthPrecision': dateOfBirthPrecision,
        'dateOfDeath':
            "${dateOfDeath.year.toString().padLeft(4, '0')}-${dateOfDeath.month.toString().padLeft(2, '0')}-${dateOfDeath.day.toString().padLeft(2, '0')}",
        'dateOfDeathPrecision': dateOfDeathPrecision,
        'placeOfDeath': placeOfDeath,
        'occupation': List<dynamic>.from(occupation.map((x) => x)),
        'roles': List<dynamic>.from(roles.map((x) => x)),
        'nationality': nationality,
        'biography': biography,
        'productionPlaces': List<dynamic>.from(productionPlaces.map((x) => x)),
        'qualification': qualification,
      };
}

class WebImage {
  WebImage({
    required this.guid,
    required this.offsetPercentageX,
    required this.offsetPercentageY,
    required this.width,
    required this.height,
    required this.url,
  });

  String guid;
  int offsetPercentageX;
  int offsetPercentageY;
  int width;
  int height;
  String url;

  factory WebImage.fromJson(Map<String, dynamic> json) => WebImage(
        guid: json['guid'],
        offsetPercentageX: json['offsetPercentageX'],
        offsetPercentageY: json['offsetPercentageY'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'guid': guid,
        'offsetPercentageX': offsetPercentageX,
        'offsetPercentageY': offsetPercentageY,
        'width': width,
        'height': height,
        'url': url,
      };
}

class ArtObjectPage {
  ArtObjectPage({
    required this.id,
    required this.similarPages,
    required this.lang,
    required this.objectNumber,
    required this.tags,
    required this.plaqueDescription,
    required this.createdOn,
    required this.updatedOn,
    required this.adlibOverrides,
    this.audioFile1,
    this.audioFileLabel1,
    this.audioFileLabel2,
  });

  String id;
  List<dynamic> similarPages;
  String lang;
  String objectNumber;
  List<dynamic> tags;
  String plaqueDescription;
  dynamic audioFile1;
  dynamic audioFileLabel1;
  dynamic audioFileLabel2;
  DateTime createdOn;
  DateTime updatedOn;
  AdlibOverrides adlibOverrides;

  factory ArtObjectPage.fromJson(Map<String, dynamic> json) => ArtObjectPage(
        id: json['id'],
        similarPages: List<dynamic>.from(json['similarPages'].map((x) => x)),
        lang: json['lang'],
        objectNumber: json['objectNumber'],
        tags: List<dynamic>.from(json['tags'].map((x) => x)),
        plaqueDescription: json['plaqueDescription'],
        audioFile1: json['audioFile1'],
        audioFileLabel1: json['audioFileLabel1'],
        audioFileLabel2: json['audioFileLabel2'],
        createdOn: DateTime.parse(json['createdOn']),
        updatedOn: DateTime.parse(json['updatedOn']),
        adlibOverrides: AdlibOverrides.fromJson(json['adlibOverrides']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'similarPages': List<dynamic>.from(similarPages.map((x) => x)),
        'lang': lang,
        'objectNumber': objectNumber,
        'tags': List<dynamic>.from(tags.map((x) => x)),
        'plaqueDescription': plaqueDescription,
        'audioFile1': audioFile1,
        'audioFileLabel1': audioFileLabel1,
        'audioFileLabel2': audioFileLabel2,
        'createdOn': createdOn.toIso8601String(),
        'updatedOn': updatedOn.toIso8601String(),
        'adlibOverrides': adlibOverrides.toJson(),
      };
}

class AdlibOverrides {
  AdlibOverrides({
    this.titel,
    this.maker,
    this.etiketText,
  });

  dynamic titel;
  dynamic maker;
  dynamic etiketText;

  factory AdlibOverrides.fromJson(Map<String, dynamic> json) => AdlibOverrides(
        titel: json['titel'],
        maker: json['maker'],
        etiketText: json['etiketText'],
      );

  Map<String, dynamic> toJson() => {
        'titel': titel,
        'maker': maker,
        'etiketText': etiketText,
      };
}
