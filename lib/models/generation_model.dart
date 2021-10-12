import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_flutter/models/common_model.dart';

@JsonSerializable()
class GenerationI {
  late Sprite _redGreenBlue;
  late Sprite _yellow;

  GenerationI(this._redGreenBlue, this._yellow);

  GenerationI.fromJson(Map<String, dynamic> parsedJson) {
    _redGreenBlue = Sprite.fromJson(parsedJson['red-blue']);
    _yellow = Sprite.fromJson(parsedJson['yellow']);
  }

  Sprite get redBlue => _redGreenBlue;
  Sprite get yellow => _yellow;
}

@JsonSerializable()
class GenerationII {
  late Sprite _crystal;
  late Sprite _gold;
  late Sprite _silver;

  GenerationII(this._crystal, this._gold, this._silver);

  GenerationII.fromJson(Map<String, dynamic> parsedJson) {
    _crystal = Sprite.fromJson(parsedJson['crystal']);
    _gold = Sprite.fromJson(parsedJson['gold']);
    _silver = Sprite.fromJson(parsedJson['silver']);
  }

  Sprite get crystal => _crystal;
  Sprite get gold => _gold;
  Sprite get silver => _silver;
}

@JsonSerializable()
class GenerationIII {
  late Sprite _emerald;
  late Sprite _fireredLeafgreen;
  late Sprite _rubySapphire;

  GenerationIII(this._emerald, this._fireredLeafgreen, this._rubySapphire);

  GenerationIII.fromJson(Map<String, dynamic> parsedJson) {
    _emerald = Sprite.fromJson(parsedJson['emerald']);
    _fireredLeafgreen = Sprite.fromJson(parsedJson['firered-leafgreen']);
    _rubySapphire = Sprite.fromJson(parsedJson['ruby-sapphire']);
  }

  Sprite get emerald => _emerald;
  Sprite get fireredLeafgreen => _fireredLeafgreen;
  Sprite get rubySapphire => _rubySapphire;
}

@JsonSerializable()
class GenerationIV {
  late Sprite _diamondPearl;
  late Sprite _heartgoldSoulsilver;
  late Sprite _platinum;

  GenerationIV(
    this._diamondPearl,
    this._heartgoldSoulsilver,
    this._platinum,
  );

  GenerationIV.fromJson(Map<String, dynamic> parsedJson) {
    _diamondPearl = Sprite.fromJson(parsedJson['diamond-pearl']);
    _heartgoldSoulsilver = Sprite.fromJson(parsedJson['heartgold-soulsilver']);
    _platinum = Sprite.fromJson(parsedJson['platinum']);
  }

  Sprite get diamondPearl => _diamondPearl;
  Sprite get heartgoldSoulsilver => _heartgoldSoulsilver;
  Sprite get platinum => _platinum;
}

@JsonSerializable()
class AnimatedSprite {
  late Sprite _animated;
  late String? _frontDefault;
  late String? _frontShiny;
  late String? _frontFemale;
  late String? _frontShinyFemale;
  late String? _backDefault;
  late String? _backShiny;
  late String? _backFemale;
  late String? _backShinyFemale;

  AnimatedSprite(
    this._animated,
    this._frontDefault,
    this._frontShiny,
    this._frontFemale,
    this._frontShinyFemale,
    this._backDefault,
    this._backShiny,
    this._backFemale,
    this._backShinyFemale,
  );

  AnimatedSprite.fromJson(Map<String, dynamic> parsedJson) {
    _animated = Sprite.fromJson(parsedJson['animated']);
    _frontDefault = parsedJson['front_default'];
    _frontShiny = parsedJson['front_shiny'];
    _frontFemale = parsedJson['front_female'];
    _frontShinyFemale = parsedJson['front_shiny_female'];
    _backDefault = parsedJson['back_default'];
    _backShiny = parsedJson['back_shiny'];
    _backFemale = parsedJson['back_female'];
    _backShinyFemale = parsedJson['back_shiny_female'];
  }

  Sprite get animated => _animated;
  String? get frontDefault => _frontDefault;
  String? get frontShiny => _frontShiny;
  String? get frontFemale => _frontFemale;
  String? get frontShinyFemale => _frontShinyFemale;
  String? get backDefault => _backDefault;
  String? get backShiny => _backShiny;
  String? get backFemale => _backFemale;
  String? get backShinyFemale => _backShinyFemale;
}

@JsonSerializable()
class GenerationV {
  late AnimatedSprite _blackWhite;

  GenerationV(this._blackWhite);

  GenerationV.fromJson(Map<String, dynamic> parsedJson) {
    _blackWhite = AnimatedSprite.fromJson(parsedJson['black-white']);
  }

  AnimatedSprite get blackWhite => _blackWhite;
}

@JsonSerializable()
class GenerationVI {
  late Sprite _omegarubyAlphasapphire;
  late Sprite _xy;

  GenerationVI(this._omegarubyAlphasapphire, this._xy);

  GenerationVI.fromJson(Map<String, dynamic> parsedJson) {
    _omegarubyAlphasapphire =
        Sprite.fromJson(parsedJson['omegaruby-alphasapphire']);
    _xy = Sprite.fromJson(parsedJson['x-y']);
  }

  Sprite get omegarubyAlphasapphire => _omegarubyAlphasapphire;
  Sprite get xy => _xy;
}

@JsonSerializable()
class GenerationVII {
  late Sprite _icons;
  late Sprite _ultraSunUltraMoon;

  GenerationVII(this._icons, this._ultraSunUltraMoon);

  GenerationVII.fromJson(Map<String, dynamic> parsedJson) {
    _icons = Sprite.fromJson(parsedJson['icons']);
    _ultraSunUltraMoon = Sprite.fromJson(parsedJson['ultra-sun-ultra-moon']);
  }

  Sprite get icons => _icons;
  Sprite get ultraSunUltraMoon => _ultraSunUltraMoon;
}
