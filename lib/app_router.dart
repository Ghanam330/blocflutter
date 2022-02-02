import 'package:blocflutter/business_logic/cubit/characters_cubit.dart';
import 'package:blocflutter/data/api/character_web_servies.dart';
import 'package:blocflutter/data/repository/characters_repository.dart';
import 'package:blocflutter/ui/screens/characters_details_screen.dart';
import 'package:blocflutter/ui/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/string.dart';

class AppRouter {
   CharactersRepository? charactersRepository;
   CharactersCubit? charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServer());
    charactersCubit = CharactersCubit(charactersRepository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      charactersCubit!,
                  child: CharactersScreen(),
                ));
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
