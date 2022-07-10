part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class ListGamesEvent extends HomePageEvent {
  final int limit;
  final int offset;
  final int idPlatform;

  const ListGamesEvent({
    required this.limit,
    required this.offset,
    required this.idPlatform,
  });
}