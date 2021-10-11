import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_flutter/models/common_model.dart';

@JsonSerializable()
class PokedexModel {
  late int _count;
  late String _next;
  late String? _previous;
  late List<NamedAPIResource> _results;

  PokedexModel(this._count, this._next, this._previous, this._results);

  PokedexModel.fromJson(Map<String, dynamic> parsedJson) {
    _count = parsedJson['count'] as int;
    _next = parsedJson['next'] as String;
    _previous = parsedJson['previous'] as String?;

    List<NamedAPIResource> item = [];

    for (int i = 0; i < parsedJson['results'].length; i++) {
      NamedAPIResource result =
          NamedAPIResource.fromJson(parsedJson['results'][i]);
      item.add(result);
    }

    _results = item;
  }

  int get count => _count;
  String get next => _next;
  String? get previous => _previous;
  List<NamedAPIResource> get results => _results;
}
