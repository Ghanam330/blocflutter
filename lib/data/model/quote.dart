class QuoteModel{
  late String quote;


  QuoteModel.fromJson(Map<String,dynamic>json){
    quote=json['quote'];

  }
}