// To parse this JSON data, do
//
//     final foodData = foodDataFromMap(jsonString);

import 'dart:convert';

FoodData foodDataFromMap(String str) => FoodData.fromMap(json.decode(str));

String foodDataToMap(FoodData data) => json.encode(data.toMap());

class FoodData {
  FoodData({
    this.totalHits,
    this.currentPage,
    this.totalPages,
    this.pageList,
    this.foodSearchCriteria,
    this.foods,
    this.aggregations,
  });

  int totalHits;
  int currentPage;
  int totalPages;
  List<int> pageList;
  FoodSearchCriteria foodSearchCriteria;
  List<Food> foods;
  Aggregations aggregations;

  FoodData copyWith({
    int totalHits,
    int currentPage,
    int totalPages,
    List<int> pageList,
    FoodSearchCriteria foodSearchCriteria,
    List<Food> foods,
    Aggregations aggregations,
  }) =>
      FoodData(
        totalHits: totalHits ?? this.totalHits,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        pageList: pageList ?? this.pageList,
        foodSearchCriteria: foodSearchCriteria ?? this.foodSearchCriteria,
        foods: foods ?? this.foods,
        aggregations: aggregations ?? this.aggregations,
      );

  factory FoodData.fromMap(Map<String, dynamic> json) => FoodData(
    totalHits: json["totalHits"],
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    pageList: List<int>.from(json["pageList"].map((x) => x)),
    foodSearchCriteria: FoodSearchCriteria.fromMap(json["foodSearchCriteria"]),
    foods: List<Food>.from(json["foods"].map((x) => Food.fromMap(x))),
    aggregations: Aggregations.fromMap(json["aggregations"]),
  );

  Map<String, dynamic> toMap() => {
    "totalHits": totalHits,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "pageList": List<dynamic>.from(pageList.map((x) => x)),
    "foodSearchCriteria": foodSearchCriteria.toMap(),
    "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
    "aggregations": aggregations.toMap(),
  };
}

class Aggregations {
  Aggregations({
    this.dataType,
    this.nutrients,
  });

  DataTypeClass dataType;
  Nutrients nutrients;

  Aggregations copyWith({
    DataTypeClass dataType,
    Nutrients nutrients,
  }) =>
      Aggregations(
        dataType: dataType ?? this.dataType,
        nutrients: nutrients ?? this.nutrients,
      );

  factory Aggregations.fromMap(Map<String, dynamic> json) => Aggregations(
    dataType: DataTypeClass.fromMap(json["dataType"]),
    nutrients: Nutrients.fromMap(json["nutrients"]),
  );

  Map<String, dynamic> toMap() => {
    "dataType": dataType.toMap(),
    "nutrients": nutrients.toMap(),
  };
}

class DataTypeClass {
  DataTypeClass({
    this.branded,
    this.srLegacy,
    this.surveyFndds,
    this.foundation,
  });

  int branded;
  int srLegacy;
  int surveyFndds;
  int foundation;

  DataTypeClass copyWith({
    int branded,
    int srLegacy,
    int surveyFndds,
    int foundation,
  }) =>
      DataTypeClass(
        branded: branded ?? this.branded,
        srLegacy: srLegacy ?? this.srLegacy,
        surveyFndds: surveyFndds ?? this.surveyFndds,
        foundation: foundation ?? this.foundation,
      );

  factory DataTypeClass.fromMap(Map<String, dynamic> json) => DataTypeClass(
    branded: json["Branded"],
    srLegacy: json["SR Legacy"],
    surveyFndds: json["Survey (FNDDS)"],
    foundation: json["Foundation"],
  );

  Map<String, dynamic> toMap() => {
    "Branded": branded,
    "SR Legacy": srLegacy,
    "Survey (FNDDS)": surveyFndds,
    "Foundation": foundation,
  };
}

class Nutrients {
  Nutrients();

factory Nutrients.fromMap(Map<String, dynamic> json) => Nutrients(
    );

Map<String, dynamic> toMap() => {
};
}

class FoodSearchCriteria {
  FoodSearchCriteria({
    this.query,
    this.generalSearchInput,
    this.pageNumber,
    this.numberOfResultsPerPage,
    this.pageSize,
    this.requireAllWords,
  });

  String query;
  String generalSearchInput;
  int pageNumber;
  int numberOfResultsPerPage;
  int pageSize;
  bool requireAllWords;

  FoodSearchCriteria copyWith({
    String query,
    String generalSearchInput,
    int pageNumber,
    int numberOfResultsPerPage,
    int pageSize,
    bool requireAllWords,
  }) =>
      FoodSearchCriteria(
        query: query ?? this.query,
        generalSearchInput: generalSearchInput ?? this.generalSearchInput,
        pageNumber: pageNumber ?? this.pageNumber,
        numberOfResultsPerPage: numberOfResultsPerPage ?? this.numberOfResultsPerPage,
        pageSize: pageSize ?? this.pageSize,
        requireAllWords: requireAllWords ?? this.requireAllWords,
      );

  factory FoodSearchCriteria.fromMap(Map<String, dynamic> json) => FoodSearchCriteria(
    query: json["query"],
    generalSearchInput: json["generalSearchInput"],
    pageNumber: json["pageNumber"],
    numberOfResultsPerPage: json["numberOfResultsPerPage"],
    pageSize: json["pageSize"],
    requireAllWords: json["requireAllWords"],
  );

  Map<String, dynamic> toMap() => {
    "query": query,
    "generalSearchInput": generalSearchInput,
    "pageNumber": pageNumber,
    "numberOfResultsPerPage": numberOfResultsPerPage,
    "pageSize": pageSize,
    "requireAllWords": requireAllWords,
  };
}

class Food {
  Food({
    this.fdcId,
    this.description,
    this.lowercaseDescription,
    this.dataType,
    this.gtinUpc,
    this.publishedDate,
    this.brandOwner,
    this.brandName,
    this.ingredients,
    this.marketCountry,
    this.foodCategory,
    this.allHighlightFields,
    this.score,
    this.foodNutrients,
    this.commonNames,
    this.additionalDescriptions,
    this.foodCode,
    this.ndbNumber,
    this.scientificName,
    this.mostRecentAcquisitionDate,
  });

  int fdcId;
  String description;
  String lowercaseDescription;
  DataTypeEnum dataType;
  String gtinUpc;
  DateTime publishedDate;
  String brandOwner;
  String brandName;
  String ingredients;
  String marketCountry;
  String foodCategory;
  String allHighlightFields;
  double score;
  List<FoodNutrient> foodNutrients;
  String commonNames;
  String additionalDescriptions;
  int foodCode;
  int ndbNumber;
  String scientificName;
  DateTime mostRecentAcquisitionDate;

  Food copyWith({
    int fdcId,
    String description,
    String lowercaseDescription,
    DataTypeEnum dataType,
    String gtinUpc,
    DateTime publishedDate,
    String brandOwner,
    String brandName,
    String ingredients,
    String marketCountry,
    String foodCategory,
    String allHighlightFields,
    double score,
    List<FoodNutrient> foodNutrients,
    String commonNames,
    String additionalDescriptions,
    int foodCode,
    int ndbNumber,
    String scientificName,
    DateTime mostRecentAcquisitionDate,
  }) =>
      Food(
        fdcId: fdcId ?? this.fdcId,
        description: description ?? this.description,
        lowercaseDescription: lowercaseDescription ?? this.lowercaseDescription,
        dataType: dataType ?? this.dataType,
        gtinUpc: gtinUpc ?? this.gtinUpc,
        publishedDate: publishedDate ?? this.publishedDate,
        brandOwner: brandOwner ?? this.brandOwner,
        brandName: brandName ?? this.brandName,
        ingredients: ingredients ?? this.ingredients,
        marketCountry: marketCountry ?? this.marketCountry,
        foodCategory: foodCategory ?? this.foodCategory,
        allHighlightFields: allHighlightFields ?? this.allHighlightFields,
        score: score ?? this.score,
        foodNutrients: foodNutrients ?? this.foodNutrients,
        commonNames: commonNames ?? this.commonNames,
        additionalDescriptions: additionalDescriptions ?? this.additionalDescriptions,
        foodCode: foodCode ?? this.foodCode,
        ndbNumber: ndbNumber ?? this.ndbNumber,
        scientificName: scientificName ?? this.scientificName,
        mostRecentAcquisitionDate: mostRecentAcquisitionDate ?? this.mostRecentAcquisitionDate,
      );

  factory Food.fromMap(Map<String, dynamic> json) => Food(
    fdcId: json["fdcId"],
    description: json["description"],
    lowercaseDescription: json["lowercaseDescription"],
    dataType: dataTypeEnumValues.map[json["dataType"]],
    gtinUpc: json["gtinUpc"] == null ? null : json["gtinUpc"],
    publishedDate: DateTime.parse(json["publishedDate"]),
    brandOwner: json["brandOwner"] == null ? null : json["brandOwner"],
    brandName: json["brandName"] == null ? null : json["brandName"],
    ingredients: json["ingredients"] == null ? null : json["ingredients"],
    marketCountry: json["marketCountry"] == null ? null : json["marketCountry"],
    foodCategory: json["foodCategory"],
    allHighlightFields: json["allHighlightFields"],
    score: json["score"].toDouble(),
    foodNutrients: List<FoodNutrient>.from(json["foodNutrients"].map((x) => FoodNutrient.fromMap(x))),
    commonNames: json["commonNames"] == null ? null : json["commonNames"],
    additionalDescriptions: json["additionalDescriptions"] == null ? null : json["additionalDescriptions"],
    foodCode: json["foodCode"] == null ? null : json["foodCode"],
    ndbNumber: json["ndbNumber"] == null ? null : json["ndbNumber"],
    scientificName: json["scientificName"] == null ? null : json["scientificName"],
    mostRecentAcquisitionDate: json["mostRecentAcquisitionDate"] == null ? null : DateTime.parse(json["mostRecentAcquisitionDate"]),
  );

  Map<String, dynamic> toMap() => {
    "fdcId": fdcId,
    "description": description,
    "lowercaseDescription": lowercaseDescription,
    "dataType": dataTypeEnumValues.reverse[dataType],
    "gtinUpc": gtinUpc == null ? null : gtinUpc,
    "publishedDate": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
    "brandOwner": brandOwner == null ? null : brandOwner,
    "brandName": brandName == null ? null : brandName,
    "ingredients": ingredients == null ? null : ingredients,
    "marketCountry": marketCountry == null ? null : marketCountry,
    "foodCategory": foodCategory,
    "allHighlightFields": allHighlightFields,
    "score": score,
    "foodNutrients": List<dynamic>.from(foodNutrients.map((x) => x.toMap())),
    "commonNames": commonNames == null ? null : commonNames,
    "additionalDescriptions": additionalDescriptions == null ? null : additionalDescriptions,
    "foodCode": foodCode == null ? null : foodCode,
    "ndbNumber": ndbNumber == null ? null : ndbNumber,
    "scientificName": scientificName == null ? null : scientificName,
    "mostRecentAcquisitionDate": mostRecentAcquisitionDate == null ? null : "${mostRecentAcquisitionDate.year.toString().padLeft(4, '0')}-${mostRecentAcquisitionDate.month.toString().padLeft(2, '0')}-${mostRecentAcquisitionDate.day.toString().padLeft(2, '0')}",
  };
}

enum DataTypeEnum { BRANDED, SURVEY_FNDDS, SR_LEGACY, FOUNDATION }

final dataTypeEnumValues = EnumValues({
  "Branded": DataTypeEnum.BRANDED,
  "Foundation": DataTypeEnum.FOUNDATION,
  "SR Legacy": DataTypeEnum.SR_LEGACY,
  "Survey (FNDDS)": DataTypeEnum.SURVEY_FNDDS
});

class FoodNutrient {
  FoodNutrient({
    this.nutrientId,
    this.nutrientName,
    this.nutrientNumber,
    this.unitName,
    this.derivationCode,
    this.derivationDescription,
    this.value,
  });

  int nutrientId;
  String nutrientName;
  String nutrientNumber;
  UnitName unitName;
  DerivationCode derivationCode;
  String derivationDescription;
  double value;

  FoodNutrient copyWith({
    int nutrientId,
    String nutrientName,
    String nutrientNumber,
    UnitName unitName,
    DerivationCode derivationCode,
    String derivationDescription,
    double value,
  }) =>
      FoodNutrient(
        nutrientId: nutrientId ?? this.nutrientId,
        nutrientName: nutrientName ?? this.nutrientName,
        nutrientNumber: nutrientNumber ?? this.nutrientNumber,
        unitName: unitName ?? this.unitName,
        derivationCode: derivationCode ?? this.derivationCode,
        derivationDescription: derivationDescription ?? this.derivationDescription,
        value: value ?? this.value,
      );

  factory FoodNutrient.fromMap(Map<String, dynamic> json) => FoodNutrient(
    nutrientId: json["nutrientId"],
    nutrientName: json["nutrientName"],
    nutrientNumber: json["nutrientNumber"],
    unitName: unitNameValues.map[json["unitName"]],
    derivationCode: json["derivationCode"] == null ? null : derivationCodeValues.map[json["derivationCode"]],
    derivationDescription: json["derivationDescription"] == null ? null : json["derivationDescription"],
    value: json["value"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "nutrientId": nutrientId,
    "nutrientName": nutrientName,
    "nutrientNumber": nutrientNumber,
    "unitName": unitNameValues.reverse[unitName],
    "derivationCode": derivationCode == null ? null : derivationCodeValues.reverse[derivationCode],
    "derivationDescription": derivationDescription == null ? null : derivationDescription,
    "value": value,
  };
}

enum DerivationCode { LCCS, LCCD, LCSL, NC, FLA, Z, NR, FLC, T, BFSN, BNA, A, LC, BFZN, MA, MC, O, AS, BFPN, BFFN, FLM, CAZN, AI }

final derivationCodeValues = EnumValues({
  "A": DerivationCode.A,
  "AI": DerivationCode.AI,
  "AS": DerivationCode.AS,
  "BFFN": DerivationCode.BFFN,
  "BFPN": DerivationCode.BFPN,
  "BFSN": DerivationCode.BFSN,
  "BFZN": DerivationCode.BFZN,
  "BNA": DerivationCode.BNA,
  "CAZN": DerivationCode.CAZN,
  "FLA": DerivationCode.FLA,
  "FLC": DerivationCode.FLC,
  "FLM": DerivationCode.FLM,
  "LC": DerivationCode.LC,
  "LCCD": DerivationCode.LCCD,
  "LCCS": DerivationCode.LCCS,
  "LCSL": DerivationCode.LCSL,
  "MA": DerivationCode.MA,
  "MC": DerivationCode.MC,
  "NC": DerivationCode.NC,
  "NR": DerivationCode.NR,
  "O": DerivationCode.O,
  "T": DerivationCode.T,
  "Z": DerivationCode.Z
});

enum UnitName { G, KCAL, MG, IU, UG, K_J }

final unitNameValues = EnumValues({
  "G": UnitName.G,
  "IU": UnitName.IU,
  "KCAL": UnitName.KCAL,
  "kJ": UnitName.K_J,
  "MG": UnitName.MG,
  "UG": UnitName.UG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
