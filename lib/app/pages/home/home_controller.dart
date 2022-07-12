import 'package:flutter/material.dart';

import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/games/games.dart';

import 'bloc/home_page_bloc.dart';

class HomeController {
  final GamesListRepository _gamesRepository;

  HomeController(this._gamesRepository) {
    fetch();
  }

  ValueNotifier<List<GameModel?>> games = ValueNotifier<List<GameModel?>>([]);

  fetch() async {
    games.value = await _gamesRepository.getGamesList(
      idPlatform: 10,
      offset: 10,
      limit: 10,
    );
  }

  Future<void> handleStateUpdate(
    BuildContext context,
    HomePageState state,
  ) async {
    if (state is HomePageLoading) {}
    if (state is HomePageError) {}
  }
}
