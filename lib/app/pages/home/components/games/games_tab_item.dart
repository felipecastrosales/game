import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/pages/home/bloc/home_page_bloc.dart';
import 'package:game/app/pages/home/components/components.dart';
import 'package:game/data/models/game/game_model.dart';

class GamesTabItem<B extends StateStreamable<S>, S> extends StatelessWidget {
  final B bloc;
  final BlocWidgetListener<S> listener;
  final int idPlatform;
  final List<GameModel> games;

  const GamesTabItem({
    super.key,
    required this.bloc,
    required this.listener,
    required this.idPlatform,
    required this.games,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc, // B
      listener: listener,
      builder: (context, state) {
        return GamesGridTile(
          bloc as HomePageBloc, // HomePageBloc
          idPlatform,
        );
      },
    );
  }
}
