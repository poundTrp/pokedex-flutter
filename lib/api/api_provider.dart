import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_flutter/api/apiConfig.dart';
import 'package:pokedex_flutter/constants/statusCode.dart';

class ApiProvider {
  Future<Map<String, dynamic>> getData(String endpoint) async {
    String _path = ApiConfig.API_PATH + ApiConfig.API_VERSION + endpoint;

    print('data path: $_path');
    final response = await Dio().get(_path);
    print('data status code: ${response.statusCode}');

    if (response.statusCode == StatusCode.success) {
      Map<String, dynamic> parsedJson = json.decode(response.toString());
      return parsedJson;
    } else {
      print('${TextResponse.failedCode} ${response.statusCode}');
      throw Exception(TextResponse.failed);
    }
  }

  Future<Map<String, dynamic>> getDataByUrl(String path) async {
    print('path: $path');
    final response = await Dio().get(path);
    print('response status code: ${response.statusCode}');

    if (response.statusCode == StatusCode.success) {
      Map<String, dynamic> parsedJson = json.decode(response.toString());

      return parsedJson;
    } else {
      print('${TextResponse.failedCode} ${response.statusCode}');
      throw Exception(TextResponse.failed);
    }
  }
}
