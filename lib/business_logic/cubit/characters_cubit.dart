import 'package:bloc/bloc.dart';
import 'package:blocflutter/data/model/character.dart';
import 'package:blocflutter/data/model/quote.dart';
import 'package:blocflutter/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository characterRepository;
  List<Character> _character = [];
  List<QuoteModel> _quote = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacter() {
    characterRepository.getAllCharacters().then((character) {
      emit(CharactersLoading(character));
      _character = character;
    });
    return _character;
  }



  List<QuoteModel> getQuoteCharacter(String charName) {
    characterRepository.getCharactersQuote(charName).then((quote) {
      emit(QuoteLoading(quote));
      _quote = quote;
    });
    return _quote;
  }

  // or

void getQuote(String charName){
    characterRepository.getCharactersQuote(charName)
        .then((value) {
          emit(QuoteLoading(value));
    });
}
}
