part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final List<GameModel> games;
  const HomePageSuccess({required this.games});
}

class HomePageError extends HomePageState {
  final String message;
  const HomePageError(this.message);
}
