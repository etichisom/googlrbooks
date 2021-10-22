// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    this.kind,
    this.totalItems,
    this.items,
  });

  String kind;
  int totalItems;
  List<Item> items;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
    kind: json["kind"],
    totalItems: json["totalItems"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "totalItems": totalItems,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Kind kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;
  SearchInfo searchInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: kindValues.map[json["kind"]],
    id: json["id"],
    etag: json["etag"],
    selfLink: json["selfLink"],
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
    saleInfo: SaleInfo.fromJson(json["saleInfo"]),
    accessInfo: AccessInfo.fromJson(json["accessInfo"]),
    searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfo.toJson(),
    "saleInfo": saleInfo.toJson(),
    "accessInfo": accessInfo.toJson(),
    "searchInfo": searchInfo == null ? null : searchInfo.toJson(),
  };
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  Country country;
  Viewability viewability;
  bool embeddable;
  bool publicDomain;
  TextToSpeechPermission textToSpeechPermission;
  Epub epub;
  Pdf pdf;
  String webReaderLink;
  AccessViewStatus accessViewStatus;
  bool quoteSharingAllowed;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: countryValues.map[json["country"]],
    viewability: viewabilityValues.map[json["viewability"]],
    embeddable: json["embeddable"],
    publicDomain: json["publicDomain"],
    textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]],
    epub: Epub.fromJson(json["epub"]),
    pdf: Pdf.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"],
    accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]],
    quoteSharingAllowed: json["quoteSharingAllowed"],
  );

  Map<String, dynamic> toJson() => {
    "country": countryValues.reverse[country],
    "viewability": viewabilityValues.reverse[viewability],
    "embeddable": embeddable,
    "publicDomain": publicDomain,
    "textToSpeechPermission": textToSpeechPermissionValues.reverse[textToSpeechPermission],
    "epub": epub.toJson(),
    "pdf": pdf.toJson(),
    "webReaderLink": webReaderLink,
    "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
    "quoteSharingAllowed": quoteSharingAllowed,
  };
}

enum AccessViewStatus { NONE, SAMPLE }

final accessViewStatusValues = EnumValues({
  "NONE": AccessViewStatus.NONE,
  "SAMPLE": AccessViewStatus.SAMPLE
});

enum Country { NG }

final countryValues = EnumValues({
  "NG": Country.NG
});

class Epub {
  Epub({
    this.isAvailable,
  });

  bool isAvailable;

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable,
  };
}

class Pdf {
  Pdf({
    this.isAvailable,
    this.acsTokenLink,
  });

  bool isAvailable;
  String acsTokenLink;

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
    isAvailable: json["isAvailable"],
    acsTokenLink: json["acsTokenLink"] == null ? null : json["acsTokenLink"],
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "acsTokenLink": acsTokenLink == null ? null : acsTokenLink,
  };
}

enum TextToSpeechPermission { ALLOWED, ALLOWED_FOR_ACCESSIBILITY }

final textToSpeechPermissionValues = EnumValues({
  "ALLOWED": TextToSpeechPermission.ALLOWED,
  "ALLOWED_FOR_ACCESSIBILITY": TextToSpeechPermission.ALLOWED_FOR_ACCESSIBILITY
});

enum Viewability { NO_PAGES, PARTIAL }

final viewabilityValues = EnumValues({
  "NO_PAGES": Viewability.NO_PAGES,
  "PARTIAL": Viewability.PARTIAL
});

enum Kind { BOOKS_VOLUME }

final kindValues = EnumValues({
  "books#volume": Kind.BOOKS_VOLUME
});

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  Country country;
  Saleability saleability;
  bool isEbook;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: countryValues.map[json["country"]],
    saleability: saleabilityValues.map[json["saleability"]],
    isEbook: json["isEbook"],
  );

  Map<String, dynamic> toJson() => {
    "country": countryValues.reverse[country],
    "saleability": saleabilityValues.reverse[saleability],
    "isEbook": isEbook,
  };
}

enum Saleability { NOT_FOR_SALE }

final saleabilityValues = EnumValues({
  "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  String textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json["textSnippet"],
  );

  Map<String, dynamic> toJson() => {
    "textSnippet": textSnippet,
  };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.subtitle,
    this.publisher,
    this.categories,
    this.panelizationSummary,
    this.comicsContent,
  });

  String title;
  var authors;
  String publishedDate;
  String description;
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  var pageCount;
  PrintType printType;
  var averageRating;
  var ratingsCount;
  MaturityRating maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  ImageLinks imageLinks;
  Language language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  String subtitle;
  String publisher;
  var categories;
  PanelizationSummary panelizationSummary;
  bool comicsContent;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"],
    authors: json["authors"] == 'Book' ? null : null,
    publishedDate: json["publishedDate"] == null ? null : json["publishedDate"],
    description: json["description"] == null ?'<No description>': json["description"],
    pageCount: json["pageCount"],
    printType: printTypeValues.map[json["printType"]],
    averageRating: json["averageRating"] == null ? 0 : json["averageRating"],
    ratingsCount: json["ratingsCount"] == null ? 1 : json["ratingsCount"],
    maturityRating: maturityRatingValues.map[json["maturityRating"]],
    allowAnonLogging: json["allowAnonLogging"],
    contentVersion: json["contentVersion"],
    imageLinks: ImageLinks.fromJson(json["imageLinks"]),
    language: languageValues.map[json["language"]],
    previewLink: json["previewLink"],
    infoLink: json["infoLink"],
    canonicalVolumeLink: json["canonicalVolumeLink"],
    subtitle: json["subtitle"] == null ? '' : json["subtitle"],
    publisher: json["publisher"] == null ? 'Google' : json["publisher"],
    categories: json["categories"] == null ? ['Books'] : List.from(json["categories"].map((x) => x)),
    panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
    comicsContent: json["comicsContent"] == null ? null : json["comicsContent"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "authors": authors == null ? null : null,
    "publishedDate": publishedDate == null ? null : publishedDate,
    "description": description == null ? null : description,
    "pageCount": pageCount,
    "averageRating": averageRating == null ? null : averageRating,
    "ratingsCount": ratingsCount == null ? null : ratingsCount,
    "maturityRating": maturityRatingValues.reverse[maturityRating],
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "imageLinks": imageLinks.toJson(),
    "language": languageValues.reverse[language],
    "previewLink": previewLink,
    "infoLink": infoLink,
    "canonicalVolumeLink": canonicalVolumeLink,
    "subtitle": subtitle == null ? null : subtitle,
    "publisher": publisher == null ? null : publisher,
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x)),
    "panelizationSummary": panelizationSummary == null ? null : panelizationSummary.toJson(),
    "comicsContent": comicsContent == null ? null : comicsContent,
  };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String smallThumbnail;
  String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json){
    return ImageLinks(
   thumbnail: json!=null?json["thumbnail"]:'https://books.google.com/books/content?id=vVOCDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
  );
  }

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  Type type;
  String identifier;



  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "identifier": identifier,
  };
}

enum Type { ISBN_10, ISBN_13 }

final typeValues = EnumValues({
  "ISBN_10": Type.ISBN_10,
  "ISBN_13": Type.ISBN_13
});

enum Language { EN, ES }

final languageValues = EnumValues({
  "en": Language.EN,
  "es": Language.ES
});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues = EnumValues({
  "NOT_MATURE": MaturityRating.NOT_MATURE
});

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
    this.imageBubbleVersion,
  });

  bool containsEpubBubbles;
  bool containsImageBubbles;
  String imageBubbleVersion;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(

  );

  Map<String, dynamic> toJson() => {
    "containsEpubBubbles": containsEpubBubbles,
    "containsImageBubbles": containsImageBubbles,
    "imageBubbleVersion": imageBubbleVersion == null ? null : imageBubbleVersion,
  };
}

enum PrintType { BOOK }

final printTypeValues = EnumValues({
  "BOOK": PrintType.BOOK
});

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  bool text;
  bool image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
    text: json["text"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image": image,
  };
}

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
