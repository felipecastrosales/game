import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:game/data/models/game/game_model.dart';
import 'package:game/data/repositories/games_list_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GamesListRepository _gamesRepository;

  HomePageBloc({
    required GamesListRepository gamesRepository,
  })  : _gamesRepository = gamesRepository,
        super(HomePageInitial()) {
    on<ListGamesEvent>(_getListGames);
  }

  FutureOr<void> _getListGames(
    ListGamesEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(
      HomePageLoading(),
    );
    try {
      final games = await _gamesRepository.getGamesList(
        idPlatform: event.idPlatform,
        offset: event.offset,
        limit: event.limit,
      );
      emit(
        HomePageSuccess(games: games),
      );
    } catch (e) {
      emit(
        HomePageError(e.toString()),
      );
    }
  }
}
