// Common API Resource
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_flutter/models/generation_model.dart';

@JsonSerializable()
class APIResource {
  late String _url;

  APIResource(this._url);

  APIResource.fromJson(Map<String, dynamic> parsedJson) {
    _url = parsedJson['url'];
  }

  String get url => _url;
}

// Common Description
@JsonSerializable()
class Description {
  late String _description;
  late NamedAPIResource _language;

  Description(this._description, this._language);

  Description.fromJson(Map<String, dynamic> parsedJson) {
    _description = parsedJson['description'];
    _language = NamedAPIResource.fromJson(parsedJson['language']);
  }

  String get description => _description;
  NamedAPIResource get language => _language;
}

// Common Effect
@JsonSerializable()
class Effect {
  late String _effect;
  late NamedAPIResource _language;

  Effect(this._effect, this._language);

  Effect.fromJson(Map<String, dynamic> parsedJson) {
    _effect = parsedJson['effect'];
    _language = NamedAPIResource.fromJson(parsedJson['language']);
  }

  String get effect => _effect;
  NamedAPIResource get language => _language;
}

// Common Encounter
@JsonSerializable()
class Encounter {
  late int _minLevel;
  late int _maxLevel;
  late NamedAPIResource _conditionValues;
  late int _chance;
  late NamedAPIResource _method;

  Encounter(
    this._minLevel,
    this._maxLevel,
    this._conditionValues,
    this._chance,
    this._method,
  );

  Encounter.fromJson(Map<String, dynamic> parsedJson) {
    _minLevel = parsedJson['min_level'];
    _maxLevel = parsedJson['max_level'];
    _conditionValues =
        NamedAPIResource.fromJson(parsedJson['condition_values']);
    _chance = parsedJson['chance'];
    _method = NamedAPIResource.fromJson(parsedJson['method']);
  }

  int get minLevel => _minLevel;
  int get maxLevel => _maxLevel;
  NamedAPIResource get conditionValues => _conditionValues;
  int get chance => _chance;
  NamedAPIResource get method => _method;
}

// Common Flavor Text
@JsonSerializable()
class FlavorText {
  late String _flavorText;
  late NamedAPIResource _language;
  late NamedAPIResource _version;

  FlavorText(this._flavorText, this._language, this._version);

  FlavorText.fromJson(Map<String, dynamic> parsedJson) {
    _flavorText = parsedJson['flavor_text'];
    _language = NamedAPIResource.fromJson(parsedJson['language']);
    _version = NamedAPIResource.fromJson(parsedJson['version']);
  }

  String get flavorText => _flavorText;
  NamedAPIResource get language => _language;
  NamedAPIResource get version => _version;
}

// Common Generation Game Index
@JsonSerializable()
class GenerationGameIndex {
  late int _gameIndex;
  late NamedAPIResource _generation;

  GenerationGameIndex(this._gameIndex, this._generation);

  GenerationGameIndex.fromJson(Map<String, dynamic> parsedJson) {
    _gameIndex = parsedJson['game_index'];
    _generation = NamedAPIResource.fromJson(parsedJson['generation']);
  }

  int get gameIndex => _gameIndex;
  NamedAPIResource get generation => _generation;
}

// Common Machine Version Detail
@JsonSerializable()
class MachineVersionDetail {
  late APIResource _machine;
  late NamedAPIResource _versionGroup;

  MachineVersionDetail(this._machine, this._versionGroup);

  MachineVersionDetail.fromJson(Map<String, dynamic> parsedJson) {
    _machine = APIResource.fromJson(parsedJson['machine']);
    _versionGroup = NamedAPIResource.fromJson(parsedJson['version_group']);
  }

  APIResource get machine => _machine;
  NamedAPIResource get versionGroup => _versionGroup;
}

// Common Name
@JsonSerializable()
class Name {
  late String _name;
  late NamedAPIResource _language;

  Name(this._name, this._language);

  Name.fromJson(Map<String, dynamic> parsedJson) {
    _name = parsedJson['name'];
    _language = NamedAPIResource.fromJson(parsedJson['language']);
  }

  String get name => _name;
  NamedAPIResource get language => _language;
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

// Common Verbose Effect
@JsonSerializable()
class VerboseEffect {
  late String _effect;
  late String _shortEffect;
  late NamedAPIResource _language;

  VerboseEffect(this._effect, this._shortEffect, this._language);

  VerboseEffect.fromJson(Map<String, dynamic> parsedJson) {
    _effect = parsedJson['effect'];
    _shortEffect = parsedJson['short_effect'];
    _language = NamedAPIResource.fromJson(parsedJson['language']);
  }

  String get effect => _effect;
  String get shortEffect => _shortEffect;
  NamedAPIResource get language => _language;
}

// Common Version Encounter Detail
@JsonSerializable()
class VersionEncounterDetail {
  late NamedAPIResource _version;
  late int _maxChance;
  late List<Encounter> _encounterDetails;

  VersionEncounterDetail(
    this._version,
    this._maxChance,
    this._encounterDetails,
  );

  VersionEncounterDetail.fromJson(Map<String, dynamic> parsedJson) {
    _version = NamedAPIResource.fromJson(parsedJson['version']);
    _maxChance = parsedJson['max_chance'];

    List<Encounter> encounterDetails = [];

    for (int i = 0; i < parsedJson['encounter_details'].length; i++) {
      Encounter item = Encounter.fromJson(parsedJson['encounter_details'][i]);
      encounterDetails.add(item);
    }
    _encounterDetails = encounterDetails;
  }

  NamedAPIResource get version => _version;
  int get maxChance => _maxChance;
  List<Encounter> get encounterDetails => _encounterDetails;
}

// Common Version Game Index
@JsonSerializable()
class VersionGameIndex {
  late int _gameIndex;
  late NamedAPIResource _version;

  VersionGameIndex(this._gameIndex, this._version);

  VersionGameIndex.fromJson(Map<String, dynamic> parsedJson) {
    _gameIndex = parsedJson['game_index'];
    _version = NamedAPIResource.fromJson(parsedJson['version']);
  }

  int get gameIndex => _gameIndex;
  NamedAPIResource get version => _version;
}

// Common Version Group Flavor Text
@JsonSerializable()
class VersionGroupFlavorText {
  late String _text;
  late NamedAPIResource _language;
  late NamedAPIResource _versionGroup;

  VersionGroupFlavorText(this._text, this._language, this._versionGroup);

  VersionGroupFlavorText.fromJson(Map<String, dynamic> parsedJson) {
    _text = parsedJson['text'];
    _language = NamedAPIResource.fromJson(parsedJson['language']);
    _versionGroup = NamedAPIResource.fromJson(parsedJson['version_group']);
  }

  String get text => _text;
  NamedAPIResource get language => _language;
  NamedAPIResource get versionGroup => _versionGroup;
}

// Common Sprite
@JsonSerializable()
class Sprite {
  late String? _frontDefault;
  late String? _frontShiny;
  late String? _frontFemale;
  late String? _frontShinyFemale;
  late String? _backDefault;
  late String? _backShiny;
  late String? _backFemale;
  late String? _backShinyFemale;

  Sprite(
    this._frontDefault,
    this._frontShiny,
    this._frontFemale,
    this._frontShinyFemale,
    this._backDefault,
    this._backShiny,
    this._backFemale,
    this._backShinyFemale,
  );

  Sprite.fromJson(Map<String, dynamic> parsedJson) {
    _frontDefault = parsedJson['front_default'];
    _frontShiny = parsedJson['front_shiny'];
    _frontFemale = parsedJson['front_female'];
    _frontShinyFemale = parsedJson['front_shiny_female'];
    _backDefault = parsedJson['back_default'];
    _backShiny = parsedJson['back_shiny'];
    _backFemale = parsedJson['back_female'];
    _backShinyFemale = parsedJson['back_shiny_female'];
  }

  String? get frontDefault => _frontDefault;
  String? get frontShiny => _frontShiny;
  String? get frontFemale => _frontFemale;
  String? get frontShinyFemale => _frontShinyFemale;
  String? get backDefault => _backDefault;
  String? get backShiny => _backShiny;
  String? get backFemale => _backFemale;
  String? get backShinyFemale => _backShinyFemale;
}

// Common Generation Version
@JsonSerializable()
class GenerationGameVersions {
  late GenerationI _generationI;
  late GenerationII _generationII;
  late GenerationIII _generationIII;
  late GenerationIV _generationIV;
  late GenerationV _generationV;
  late GenerationVI _generationVI;
  late GenerationVII _generationVII;

  GenerationGameVersions(
    this._generationI,
    this._generationII,
    this._generationIII,
    this._generationIV,
    this._generationV,
    this._generationVI,
    this._generationVII,
  );

  GenerationGameVersions.fromJson(Map<String, dynamic> parsedJson) {
    _generationI = GenerationI.fromJson(parsedJson['generation-i']);
    _generationII = GenerationII.fromJson(parsedJson['generation-ii']);
    _generationIII = GenerationIII.fromJson(parsedJson['generation-iii']);
    _generationIV = GenerationIV.fromJson(parsedJson['generation-iv']);
    _generationV = GenerationV.fromJson(parsedJson['generation-v']);
    _generationVI = GenerationVI.fromJson(parsedJson['generation-vi']);
    _generationVII = GenerationVII.fromJson(parsedJson['generation-vii']);
  }

  GenerationI get generationI => _generationI;
  GenerationII get generationII => _generationII;
  GenerationIII get generationIII => _generationIII;
  GenerationIV get generationIV => _generationIV;
  GenerationV get generationV => _generationV;
  GenerationVI get generationVI => _generationVI;
  GenerationVII get generationVII => _generationVII;
}
