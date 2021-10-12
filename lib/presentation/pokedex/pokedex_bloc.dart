import 'dart:async';

import 'package:pokedex_flutter/api/api_provider.dart';
import 'package:pokedex_flutter/api/api_response.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/models/pokedex_model.dart';

class PokedexBloc {
  late ApiProvider _apiProvider;
  late StreamController<ApiResponse<PokedexModel>> _pokedexController;

  StreamSink<ApiResponse<PokedexModel>> get pokedexSink =>
      _pokedexController.sink;

  Stream<ApiResponse<PokedexModel>> get pokedexStream =>
      _pokedexController.stream;

  PokedexBloc(
      String queryType, String path, Function(PokedexModel data) setState) {
    _pokedexController = StreamController<ApiResponse<PokedexModel>>();
    _apiProvider = ApiProvider();
  }

  Future<void> fetchPokedex(
    String queryType,
    String path,
    Function(PokedexModel data) setState,
  ) async {
    pokedexSink.add(ApiResponse.loading(AppDefaultValue.loadingMessage));
    try {
      Map<String, dynamic> items;
      if (queryType == QueryType.URL) {
        items = await _apiProvider.getDataByUrl(path);
      } else {
        items = await _apiProvider.getData(path);
      }
      PokedexModel pokedex = PokedexModel.fromJson(items);
      setState(pokedex);
      pokedexSink.add(ApiResponse.completed(pokedex));
    } catch (event) {
      pokedexSink.add(ApiResponse.error(event.toString()));
      print(event);
    }
  }

  void dispose() {
    _pokedexController.close();
  }
}
