part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {
  final List<Character> character;
  CharactersLoading(this.character);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is CharactersLoading && o.character == character;
  }

  @override
  int get hashCode => character.hashCode;
  
}

class CharacterErrorCase extends CharactersState{
  final String message;
  CharacterErrorCase(this.message);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CharacterErrorCase && o.message == message;
  }
  @override
  int get hashCode => message.hashCode;
}

 // new Cubit

class QuoteLoading extends CharactersState {
  final List<QuoteModel> quote;
  QuoteLoading(this.quote);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is QuoteLoading && o.quote == quote;
  }

  @override
  int get hashCode => quote.hashCode;

}