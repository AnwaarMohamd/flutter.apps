import 'package:bloc/bloc.dart';
import 'package:flutterbloc_app/data/models/characters.dart';
import 'package:flutterbloc_app/data/repository/characters_repository.dart';
import 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(
          characters)); // characters اللى جتلى من ال repository
//start
      this.characters = characters; // بتشير لل characters اللى فوق
    });
    return characters;
  }
}
