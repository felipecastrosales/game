import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/pages/home/bloc/home_page_bloc.dart';
import 'package:game/app/pages/home/components/components.dart';
import 'package:game/data/models/game/game_model.dart';

class GamesTabItem<B extends StateStreamable<S>, S> extends StatelessWidget {
  const GamesTabItem({
    Key? key,
    required this.bloc,
    required this.homePageBloc,
    required this.listener,
    required this.idPlatform,
    required List<GameModel> games,
  }) : super(key: key);

  final B bloc;
  final HomePageBloc homePageBloc;
  final BlocWidgetListener<S> listener;
  final int idPlatform;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener: listener,
      builder: (context, state) {
        return GamesGridTile(homePageBloc, idPlatform);
      },
    );
  }
}
