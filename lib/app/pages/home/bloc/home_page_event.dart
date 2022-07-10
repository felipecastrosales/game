part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GamesListEvent extends HomePageEvent {
  final int limit;
  final int offset;
  final int idPlatform;

  const GamesListEvent({
    required this.limit,
    required this.offset,
    required this.idPlatform,
  });

  const GamesListEvent.id({
    required this.idPlatform,
  })  : limit = 10,
        offset = 10;
}
