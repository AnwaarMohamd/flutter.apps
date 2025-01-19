import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_app/busniess_logic/cubit/characters_cubit.dart';
import 'package:flutterbloc_app/constants/strings.dart';
import 'package:flutterbloc_app/data/models/characters.dart';
import 'package:flutterbloc_app/data/repository/characters_repository.dart';
import 'package:flutterbloc_app/data/web_services/characters_web_services.dart';
import 'package:flutterbloc_app/presentation/screens/characters_details_screen.dart';
import 'package:flutterbloc_app/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      charactersCubit, // هباصي فيها ال cubit
                  child: const CharactersScreen(),
                ));

      case charactersDetailsScreen:
        final character =
            settings.arguments as Character; //characterهباصيه ك argument
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(
                  character: character,
                ));
    }
    return null;
  }
}
