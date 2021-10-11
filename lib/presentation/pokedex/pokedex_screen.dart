import 'package:flutter/material.dart';
import 'package:pokedex_flutter/api/apiConfig.dart';
import 'package:pokedex_flutter/api/api_response.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/constants/statusCode.dart';
import 'package:pokedex_flutter/models/common_model.dart';
import 'package:pokedex_flutter/models/pokedex_model.dart';
import 'package:pokedex_flutter/presentation/pokedex/pokedex_bloc.dart';
import 'package:pokedex_flutter/presentation/widgets/ListItem.dart';

class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  late PokedexBloc _bloc;

  late String _queryType;
  late String _nextPage;
  late List<NamedAPIResource> _data;

  ScrollController scrollController = ScrollController();

  void _lazyLoadHandler(PokedexModel data) {
    setState(() {
      _data = [..._data, ...data.results];
      _nextPage = data.next;
    });
  }

  Future<void> _onRefresh() {
    return _bloc.fetchPokedex(_queryType, _nextPage, _lazyLoadHandler);
  }

  void _navigationHandler(String title, String url) {}

  Widget _renderBody() {
    return RefreshIndicator(
      child: StreamBuilder<ApiResponse<PokedexModel>>(
        stream: _bloc.pokedexStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!.status) {
              case Status.LOADING:
              // TODO: Handle Loading
              case Status.COMPLETED:
                return ListItem(
                  _data,
                  _navigationHandler,
                  scrollController,
                );
              case Status.ERROR:
              //TODO: Handle Error
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

        _onRefresh();
      }
    });

    // init bloc
    _bloc = PokedexBloc(_queryType, _nextPage, _lazyLoadHandler);
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
