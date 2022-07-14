import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game/app/config/pages/pages.dart';
import 'package:game/app/pages/details/details_page.dart';
import 'package:game/app/pages/home/bloc/home_page_bloc.dart';

import 'package:game/app/pages/home/home_page.dart';
import 'package:game/data/models/game/game_model.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Pages.home: (context) => const HomePage(),
      Pages.details: (context) {
        final game = ModalRoute.of(context)!.settings.arguments as GameModel;
        return BlocProvider(
          create: (context) => HomePageBloc(
            gamesRepository: context.read(),
          ),
          child: DetailsPage(game: game),
        );
      }
    };
  }
}
