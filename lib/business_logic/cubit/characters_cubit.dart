import 'package:bloc/bloc.dart';
import 'package:blocflutter/data/model/character.dart';
import 'package:blocflutter/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository characterRepository;
   List<Character>_character=[];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacter() {
    characterRepository.getAllCharacters().then((character) {
      emit(CharactersLoading(character));
      _character = character;
    });
    return _character;
  }
}
