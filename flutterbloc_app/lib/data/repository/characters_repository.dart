import 'package:flutterbloc_app/data/models/characters.dart';
import 'package:flutterbloc_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacters() async {
    // نفس اللى فال webservices
    final characters = await charactersWebServices
        .getAllCharacters(); // هيخزن الحاجات اللى جت من get all
    return characters
        .map((character) =>
            Character.fromJson(character as Map<String, dynamic>))
        .toList(); // كل character  ثغنن هاخده و اجوله from json
  }
}
