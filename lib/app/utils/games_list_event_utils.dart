import 'package:game/app/pages/home/bloc/home_page_bloc.dart';

class GamesListEventUtils {
  static const xbox = GamesListEvent(
    limit: 10,
    offset: 10,
    idPlatform: 49,
  );

  static const nintendo = GamesListEvent(
    limit: 10,
    offset: 10,
    idPlatform: 130,
  );

  static const browser = GamesListEvent(
    limit: 10,
    offset: 10,
    idPlatform: 82,
  );

  static const playStation = GamesListEvent(
    limit: 10,
    offset: 10,
    idPlatform: 48,
  );

  static const pc = GamesListEvent(
    limit: 10,
    offset: 10,
    idPlatform: 6,
  );

}
