import 'package:blocflutter/constants/string.dart';
import 'package:dio/dio.dart';

class CharacterWebServer {
  late Dio dio;

  CharacterWebServer() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000, // 60 secound
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try{
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    }catch (e){
      print(e.toString());
      return[];
    }
   
  }
}
