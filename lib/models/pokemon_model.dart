import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_flutter/models/common_model.dart';

@JsonSerializable()
class PokemonAbility {
  late bool _isHidden;
  late int _slot;
  late NamedAPIResource _ability;

  PokemonAbility(this._isHidden, this._slot, this._ability);

  PokemonAbility.fromJson(Map<String, dynamic> parsedJson) {
    _isHidden = parsedJson['is_hidden'];
    _slot = parsedJson['slot'];
    _ability = NamedAPIResource.fromJson(parsedJson['ability']);
  }

  bool get isHidden => _isHidden;
  int get slot => _slot;
  NamedAPIResource get ability => _ability;
}

@JsonSerializable()
class PokemonHeldItemVersion {
  late NamedAPIResource _version;
  late int _rarity;

  PokemonHeldItemVersion(this._version, this._rarity);

  PokemonHeldItemVersion.fromJson(Map<String, dynamic> parsedJson) {
    _version = NamedAPIResource.fromJson(parsedJson['version']);
    _rarity = parsedJson['rarity'];
  }

  NamedAPIResource get version => _version;
  int get rarity => _rarity;
}

@JsonSerializable()
class PokemonHeldItem {
  late NamedAPIResource _item;
  late List<PokemonHeldItemVersion> _versionDetails;

  PokemonHeldItem(this._item, this._versionDetails);

  PokemonHeldItem.fromJson(Map<String, dynamic> parsedJson) {
    _item = NamedAPIResource.fromJson(parsedJson['item']);

    List<PokemonHeldItemVersion> versionDetails = [];

    for (int i = 0; i < parsedJson['version_details'].length; i++) {
      PokemonHeldItemVersion item =
          PokemonHeldItemVersion.fromJson(parsedJson['version_details'][i]);

      versionDetails.add(item);
    }

    _versionDetails = versionDetails;
  }

  NamedAPIResource get item => _item;
  List<PokemonHeldItemVersion> get versionDetails => _versionDetails;
}

@JsonSerializable()
class PokemonMoveVersion {
  late NamedAPIResource _moveLearnMethod;
  late NamedAPIResource _versionGroup;
  late int _levelLearnedAt;

  PokemonMoveVersion(
    this._moveLearnMethod,
    this._versionGroup,
    this._levelLearnedAt,
  );

  PokemonMoveVersion.fromJson(Map<String, dynamic> parsedJson) {
    _moveLearnMethod =
        NamedAPIResource.fromJson(parsedJson['move_learn_method']);
    _versionGroup = NamedAPIResource.fromJson(parsedJson['version_group']);
    _levelLearnedAt = parsedJson['level_learned_at'];
  }

  NamedAPIResource get moveLearnMethod => _moveLearnMethod;
  NamedAPIResource get versionGroup => _versionGroup;
  int get levelLearnedAt => _levelLearnedAt;
}

@JsonSerializable()
class PokemonMove {
  late NamedAPIResource _move;
  late List<PokemonMoveVersion> _versionGroupDetails;

  PokemonMove(this._move, this._versionGroupDetails);

  PokemonMove.fromJson(Map<String, dynamic> parsedJson) {
    _move = NamedAPIResource.fromJson(parsedJson['move']);

    List<PokemonMoveVersion> versionGroupDetails = [];

    for (int i = 0; i < parsedJson['version_group_details'].length; i++) {
      PokemonMoveVersion item =
          PokemonMoveVersion.fromJson(parsedJson['version_group_details'][i]);
      versionGroupDetails.add(item);
    }

    _versionGroupDetails = versionGroupDetails;
  }

  NamedAPIResource get move => _move;
  List<PokemonMoveVersion> get versionGroupDetails => _versionGroupDetails;
}

@JsonSerializable()
class Other {
  late Sprite _dreamWorld;
  late Sprite _officialArtwork;

  Other(this._dreamWorld, this._officialArtwork);

  Other.fromJson(Map<String, dynamic> parsedJson) {
    _dreamWorld = Sprite.fromJson(parsedJson['dream_world']);
    _officialArtwork = Sprite.fromJson(parsedJson['official-artwork']);
  }

  Sprite get dreamWorld => _dreamWorld;
  Sprite get officialArtwork => _officialArtwork;
}

@JsonSerializable()
class PokemonSprites {
  late String? _frontDefault;
  late String? _frontShiny;
  late String? _frontFemale;
  late String? _frontShinyFemale;
  late String? _backDefault;
  late String? _backShiny;
  late String? _backFemale;
  late String? _backShinyFemale;
  late Other _other;

  PokemonSprites(
    this._frontDefault,
    this._frontShiny,
    this._frontFemale,
    this._frontShinyFemale,
    this._backDefault,
    this._backShiny,
    this._backFemale,
    this._backShinyFemale,
    this._other,
  );

  PokemonSprites.fromJson(Map<String, dynamic> parsedJson) {
    _frontDefault = parsedJson['front_default'];
    _frontShiny = parsedJson['front_shiny'];
    _frontFemale = parsedJson['front_female'];
    _frontShinyFemale = parsedJson['front_shiny_female'];
    _backDefault = parsedJson['back_default'];
    _backShiny = parsedJson['back_shiny'];
    _backFemale = parsedJson['back_female'];
    _backShinyFemale = parsedJson['back_shiny_female'];
    _other = Other.fromJson(parsedJson['other']);
  }

  String? get frontDefault => _frontDefault;
  String? get frontShiny => _frontShiny;
  String? get frontFemale => _frontFemale;
  String? get frontShinyFemale => _frontShinyFemale;
  String? get backDefault => _backDefault;
  String? get backShiny => _backShiny;
  String? get backFemale => _backFemale;
  String? get backShinyFemale => _backShinyFemale;
  Other get other => _other;
}

@JsonSerializable()
class PokemonStat {
  late NamedAPIResource _stat;
  late int _effort;
  late int _baseStat;

  PokemonStat(this._stat, this._effort, this._baseStat);

  PokemonStat.fromJson(Map<String, dynamic> parsedJson) {
    _stat = NamedAPIResource.fromJson(parsedJson['stat']);
    _effort = parsedJson['effort'];
    _baseStat = parsedJson['base_stat'];
  }

  NamedAPIResource get stat => _stat;
  int get effort => _effort;
  int get baseStat => _baseStat;
}

@JsonSerializable()
class PokemonType {
  late int _slot;
  late NamedAPIResource _type;

  PokemonType(this._slot, this._type);

  PokemonType.fromJson(Map<String, dynamic> parsedJson) {
    _slot = parsedJson['slot'];
    _type = NamedAPIResource.fromJson(parsedJson['type']);
  }

  int get slot => _slot;
  NamedAPIResource get type => _type;
}

@JsonSerializable()
class PokemonModel {
  late int _id;
  late String _name;
  late int _baseExperience;
  late int _height;
  late bool _isDefault;
  late int _order;
  late int _weight;
  late List<PokemonAbility> _abilities;
  late List<NamedAPIResource> _forms;
  late List<VersionGameIndex> _gameIndices;
  late List<PokemonHeldItem> _heldItems;
  late String _locationAreaEncounters;
  late List<PokemonMove> _moves;
  late PokemonSprites _sprites;
  late NamedAPIResource _species;
  late List<PokemonStat> _stats;
  late List<PokemonType> _types;

  PokemonModel(
    this._id,
    this._name,
    this._baseExperience,
    this._height,
    this._isDefault,
    this._order,
    this._weight,
    this._abilities,
    this._forms,
    this._gameIndices,
    this._heldItems,
    this._locationAreaEncounters,
    this._moves,
    this._sprites,
    this._species,
    this._stats,
    this._types,
  );

  PokemonModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name = parsedJson['name'];
    _baseExperience = parsedJson['base_experience'];
    _height = parsedJson['height'];
    _isDefault = parsedJson['is_default'];
    _order = parsedJson['order'];
    _weight = parsedJson['weight'];
    _locationAreaEncounters = parsedJson['location_area_encounters'];
    _sprites = PokemonSprites.fromJson(parsedJson['sprites']);
    _species = NamedAPIResource.fromJson(parsedJson['species']);

    List<PokemonAbility> abilities = [];
    List<NamedAPIResource> forms = [];
    List<VersionGameIndex> gameIndices = [];
    List<PokemonHeldItem> heldItems = [];
    List<PokemonMove> moves = [];
    List<PokemonStat> stats = [];
    List<PokemonType> types = [];

    for (int i = 0; i < parsedJson['abilities'].length; i++) {
      PokemonAbility item = PokemonAbility.fromJson(parsedJson['abilities'][i]);
      abilities.add(item);
    }

    for (int i = 0; i < parsedJson['forms'].length; i++) {
      NamedAPIResource item = NamedAPIResource.fromJson(parsedJson['forms'][i]);
      forms.add(item);
    }

    for (int i = 0; i < parsedJson['game_indices'].length; i++) {
      VersionGameIndex item =
          VersionGameIndex.fromJson(parsedJson['game_indices'][i]);
      gameIndices.add(item);
    }

    for (int i = 0; i < parsedJson['held_items'].length; i++) {
      PokemonHeldItem item =
          PokemonHeldItem.fromJson(parsedJson['held_items'][i]);
      heldItems.add(item);
    }

    for (int i = 0; i < parsedJson['moves'].length; i++) {
      PokemonMove item = PokemonMove.fromJson(parsedJson['moves'][i]);
      moves.add(item);
    }

    for (int i = 0; i < parsedJson['stats'].length; i++) {
      PokemonStat item = PokemonStat.fromJson(parsedJson['stats'][i]);
      stats.add(item);
    }

    for (int i = 0; i < parsedJson['types'].length; i++) {
      PokemonType item = PokemonType.fromJson(parsedJson['types'][i]);
      types.add(item);
    }

    _abilities = abilities;
    _forms = forms;
    _gameIndices = gameIndices;
    _heldItems = heldItems;
    _moves = moves;
    _stats = stats;
    _types = types;
  }

  int get id => _id;
  String get name => _name;
  int get baseExperience => _baseExperience;
  int get height => _height;
  bool get isDefault => _isDefault;
  int get order => _order;
  int get weight => _weight;
  List<PokemonAbility> get abilities => _abilities;
  List<NamedAPIResource> get forms => _forms;
  List<VersionGameIndex> get gameIndices => _gameIndices;
  List<PokemonHeldItem> get heldItem => _heldItems;
  String get locationAreaEncounters => _locationAreaEncounters;
  List<PokemonMove> get moves => _moves;
  PokemonSprites get sprites => _sprites;
  NamedAPIResource get species => _species;
  List<PokemonStat> get stats => _stats;
  List<PokemonType> get types => _types;
}
