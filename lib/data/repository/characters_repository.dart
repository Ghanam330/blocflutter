import 'package:blocflutter/data/api/character_web_servies.dart';
import 'package:blocflutter/data/model/character.dart';
import 'package:blocflutter/data/model/quote.dart';

class CharactersRepository {
  final CharacterWebServer _webServer;

  CharactersRepository(this._webServer);

  Future<List<Character>> getAllCharacters() async {
    final characters = await _webServer.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<QuoteModel>> getCharactersQuote(String charName) async {
    final quotes = await _webServer.getCahracterQuote(charName);
    return quotes
        .map((quotes) => QuoteModel.fromJson(quotes))
        .toList();
  }
}
