import 'package:flutter/material.dart';
import 'package:pokedex_flutter/api/apiConfig.dart';
import 'package:pokedex_flutter/api/api_response.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/constants/statusCode.dart';
import 'package:pokedex_flutter/models/common_model.dart';
import 'package:pokedex_flutter/models/pokedex_model.dart';
import 'package:pokedex_flutter/models/pokemon_model.dart';
import 'package:pokedex_flutter/presentation/pokedex/pokedex_bloc.dart';
import 'package:pokedex_flutter/presentation/pokemon/pokemon_bloc.dart';
import 'package:pokedex_flutter/presentation/widgets/custom_bar.dart';
import 'package:pokedex_flutter/presentation/widgets/custom_modal.dart';
import 'package:pokedex_flutter/presentation/widgets/list_item.dart';
import 'package:pokedex_flutter/presentation/widgets/loader.dart';
import 'package:pokedex_flutter/presentation/widgets/loader_error.dart';
import 'package:pokedex_flutter/presentation/widgets/pokemon_detail.dart';

class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  late PokedexBloc _bloc;
  final PokemonBloc _pokemonBloc = PokemonBloc();
  late String _queryType;
  late String _nextPage;
  late List<NamedAPIResource> _data;

  ScrollController scrollController = ScrollController();

  void _lazyLoadHandler(PokedexModel data) {
    setState(() {
      if (_queryType != QueryType.URL) {
        _data = [];
        _data = [..._data];
      }
      _data = [..._data, ...data.results];
      _nextPage = data.next;
    });
  }

  Future<void> _onRefresh() {
    setState(() {
      _queryType = QueryType.POKEMON;
    });
    return _bloc.fetchPokedex(_queryType, Endpoint.POKEMON, _lazyLoadHandler);
  }

  Future<void> _onLoadMoreData() {
    return _bloc.fetchPokedex(_queryType, _nextPage, _lazyLoadHandler);
  }

  void onPressPokemon(String title, String url) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder<PokemonModel>(
            future: _pokemonBloc.fetchPokemon(url),
            builder: (context, snapshot) {
              final pokemon = snapshot.data;
              if (!snapshot.hasData || pokemon == null) {
                return CustomModal(
                  modalSize: ModalSize.halfSize,
                  widget: Column(
                    children: [
                      CustomBar(),
                      Loader(
                        loadingMessage: '',
                      ),
                    ],
                  ),
                );
              }
              return PokemonDetail(
                title: title,
                frontSprite: pokemon.sprites.frontDefault,
                backSprite: pokemon.sprites.backDefault,
                height: pokemon.height,
                weight: pokemon.weight,
              );
            });
      },
    );
  }

  Widget _renderBody() {
    return RefreshIndicator(
      child: StreamBuilder<ApiResponse<PokedexModel>>(
        stream: _bloc.pokedexStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
                return Loader(loadingMessage: snapshot.data!.message);
              case Status.COMPLETED:
                return ListView.builder(
                    controller: scrollController,
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        _data[index],
                        onPress: () =>
                            onPressPokemon(_data[index].name, _data[index].url),
                      );
                    });
              case Status.ERROR:
                return LoadingError(
                  errorMessage: snapshot.data!.message,
                  onRetryPressed: _onRefresh,
                );
            }
          }
          return Center(
            child: Text(AppDefaultValue.dataNotFound),
          );
        },
      ),
      onRefresh: _onRefresh,
    );
  }

  // Set initial state
  @override
  void initState() {
    super.initState();

    setState(() {
      _queryType = QueryType.POKEMON;
      _nextPage = Endpoint.POKEMON;
      _data = [];
    });

    // Set event on scroll end
    scrollController.addListener(() {
      double _maxScroll = scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels == _maxScroll) {
        setState(() {
          _queryType = QueryType.URL;
        });
        _onLoadMoreData();
      }
    });

    // init bloc
    _bloc = PokedexBloc(_queryType, _nextPage, _lazyLoadHandler);
    _bloc.fetchPokedex(_queryType, _nextPage, _lazyLoadHandler);
  }

  PreferredSizeWidget renderAppBar() {
    return AppBar(
      title: Text(
        '${AppTitle.pokedex} (${_data.length})',
        style: TextStyle(
          fontSize: AppFontSize.subtitle,
          color: AppColor.white,
        ),
      ),
    );
  }

// Rendering
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: renderAppBar(),
      body: SafeArea(
        child: _renderBody(),
      ),
    );
  }

  // Close bloc
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
