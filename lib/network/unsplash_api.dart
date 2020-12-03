import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multicamp_unsplash/network/unsplash_response.dart';

class UnsplashAPI {
  static const Map<String, String> header = {
    "Authorization": "Client-ID exHpA2cq8MietVWRXgiGNRGJGENkfFHRmtlI0BLOOQo"
  };

  static Future<List<UnsplashResponse>> getRandomImages(
      {int imageCount = 25}) async {
    final response = await http.get(
        'https://api.unsplash.com/photos/random?count=$imageCount',
        headers: header);
    return unsplashResponseFromJson(response.body);
  }

  static Future<List<UnsplashResponse>> searchImages(String keyword,
      {int imageCount = 25, int page = 1}) async {
    final res = await http.get(
        'https://api.unsplash.com/search/photos?query=$keyword&page=$page&per_page=$imageCount&order_by=popular',
        headers: header);
    final response = json.decode(res.body)['results'];
    return unsplashResponseFromJson(jsonEncode(response));
  }

  static Future<String> getDownloadLink(String link) async {
    final res = await http.get(link, headers: header);
    return json.decode(res.body)['url'];
  }
}
