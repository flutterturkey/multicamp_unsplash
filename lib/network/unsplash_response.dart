// To parse this JSON data, do
//
//     final unsplashResponse = unsplashResponseFromJson(jsonString);

import 'dart:convert';

List<UnsplashResponse> unsplashResponseFromJson(String str) =>
    List<UnsplashResponse>.from(
        json.decode(str).map((x) => UnsplashResponse.fromJson(x)));

String unsplashResponseToJson(List<UnsplashResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnsplashResponse {
  UnsplashResponse({
    this.id,
    this.width,
    this.height,
    this.urls,
    this.links,
  });

  String id;
  int width;
  int height;
  Urls urls;
  UnsplashResponseLinks links;

  factory UnsplashResponse.fromJson(Map<String, dynamic> json) =>
      UnsplashResponse(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        urls: Urls.fromJson(json["urls"]),
        links: UnsplashResponseLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "urls": urls.toJson(),
        "links": links.toJson(),
      };
}

class UnsplashResponseLinks {
  UnsplashResponseLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory UnsplashResponseLinks.fromJson(Map<String, dynamic> json) =>
      UnsplashResponseLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}
