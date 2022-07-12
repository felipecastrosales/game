import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/pages/home/bloc/home_page_bloc.dart';

import 'package:game/app/pages/home/components/components.dart';

class GamesTabBar<B extends StateStreamable<S>, S> extends StatelessWidget {
  const GamesTabBar({
    Key? key,
    required this.listener,
    required this.bloc,
    required this.homePageBloc,
  }) : super(key: key);

  final BlocWidgetListener<S> listener;
  final B bloc;
  final HomePageBloc homePageBloc;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        BlocConsumer(
          listener: listener,
          bloc: bloc,
          builder: (context, state) {
            return GamesGridTile(homePageBloc, idPlatform: 49);
          },
        ),
        BlocConsumer(
          listener: listener,
          bloc: bloc,
          builder: (context, state) {
            return GamesGridTile(homePageBloc, idPlatform: 130);
          },
        ),
        BlocConsumer(
          listener: listener,
          bloc: bloc,
          builder: (context, state) {
            return GamesGridTile(homePageBloc, idPlatform: 6);
          },
        ),
        BlocConsumer(
          listener: listener,
          bloc: bloc,
          builder: (context, state) {
            return GamesGridTile(homePageBloc, idPlatform: 82);
          },
        ),
        BlocConsumer(
          listener: listener,
          bloc: bloc,
          builder: (context, state) {
            return GamesGridTile(homePageBloc, idPlatform: 48);
          },
        ),
      ],
    );
  }
}
