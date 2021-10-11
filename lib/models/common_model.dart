import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class APIResource {
  late String _url;

  APIResource(this._url);

  APIResource.fromJson(Map<String, dynamic> parsedJson) {
    _url = parsedJson['url'];
  }

  String get url => _url;
}

// Common Named API Resource
@JsonSerializable()
class NamedAPIResource {
  late String _name;
  late String _url;

  NamedAPIResource(this._name, this._url);

  NamedAPIResource.fromJson(Map<String, dynamic> parsedJson) {
    _name = parsedJson['name'];
    _url = parsedJson['url'];
  }

  String get name => _name;
  String get url => _url;
}
