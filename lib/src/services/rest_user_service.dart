import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user.dart';
import 'abstractions/user_service.dart';

part 'rest_user_service.g.dart';

@RestApi()
@Injectable(as: UserService)
abstract class RestUserService implements UserService {
  @factoryMethod
  factory RestUserService(Dio dio) =>
    _RestUserService(dio); // baseUrl is already injected in Dio in register_module
  
  @override
  @GET('/users')
  Future<List<User>> getUsers();

  @override
  @GET('/users/{id}')
  Future<User> getUser(@Path('id') int id);
}
