import 'package:flutter/material.dart';


import 'package:game/data/repositories/games/games.dart';

import 'bloc/home_page_bloc.dart';

class HomeController extends ChangeNotifier {
  final GamesListRepository _gamesRepository;
  HomeController(this._gamesRepository);

  Future<void> handleStateUpdate(
    BuildContext context,
    HomePageState state,
  ) async {
    if (state is HomePageLoading) {}
    if (state is HomePageError) {}
  }
}
