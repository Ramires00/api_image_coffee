import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:coffee_api/model/model_coffee.dart';

part 'repository_coffee.g.dart';

@RestApi(baseUrl: 'https://coffee.alexflipnote.dev/')
abstract class Repository {
  factory Repository(Dio dio, {String baseUrl}) = _Repository;

  @GET("random.json")
  Future<Model> coffeeImages();
}
