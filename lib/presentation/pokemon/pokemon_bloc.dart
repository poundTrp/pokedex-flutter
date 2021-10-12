import 'dart:async';

import 'package:pokedex_flutter/api/api_provider.dart';
import 'package:pokedex_flutter/api/api_response.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/models/pokemon_model.dart';

class PokemonBloc {
  late ApiProvider _apiProvider;

  late StreamController<ApiResponse<PokemonModel>> _pokemonController;

  StreamSink<ApiResponse<PokemonModel>> get pokemonSink =>
      _pokemonController.sink;

  Stream<ApiResponse<PokemonModel>> get pokemonStream =>
      _pokemonController.stream;

  PokemonBloc(String path) {
    _pokemonController = StreamController<ApiResponse<PokemonModel>>();
    _apiProvider = ApiProvider();
  }

  Future<void> fetchPokemon(String path) async {
    pokemonSink.add(ApiResponse.loading(AppDefaultValue.loadingMessage));
    try {
      Map<String, dynamic> items = await _apiProvider.getDataByUrl(path);

      PokemonModel pokemon = PokemonModel.fromJson(items);
      pokemonSink.add(ApiResponse.completed(pokemon));
    } catch (event) {
      pokemonSink.add(ApiResponse.error(event.toString()));
      print(event);
    }
  }

  dispose() {
    _pokemonController.close();
  }
}
