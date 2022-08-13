import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../config/app_config.dart';
import '../models/post.dart';
import 'abstractions/post_service.dart';

part 'rest_post_service.g.dart';

@RestApi()
@Injectable(as: PostService)
abstract class RestPostService implements PostService {
  @factoryMethod
  factory RestPostService(Dio dio, AppConfig appConfig) =>
    _RestPostService(dio, baseUrl: appConfig.apiUrl); // I can inject baseUrl here
  
  @override
  @GET('/posts')
  Future<List<Post>> getPosts();

  @override
  @GET('/posts/{id}')
  Future<Post> getPost(@Path('id') int id);
}
