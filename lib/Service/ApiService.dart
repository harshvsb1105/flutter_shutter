import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shutter/Model/ImageModel/ImageModel.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiService {
  static var client = http.Client();

  Future<ImageModel?> fetchImageService(
      String searchText, int page, int perPage) async {
    debugPrint('API Search : $searchText');
    String searchUrl =
        "${Constants.baseUrl}/v2/images/search?page=$page&per_page=$perPage&query=$searchText";
    var response = await client.get(Uri.parse(searchUrl),
        headers: {"Authorization": "Bearer ${Constants.authToken}"});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      debugPrint('This is response status : ${response.statusCode}');
      debugPrint('This is response body : $jsonString');
      ImageModel imageModel = ImageModel.fromJson(jsonDecode(jsonString));
      debugPrint('------- ${imageModel.imageListData?.length}--------');
      return imageModel;
    } else {
      return null;
    }
  }
}
