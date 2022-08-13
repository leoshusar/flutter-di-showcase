import '../../models/user.dart';

abstract class UserService {
  Future<List<User>> getUsers();
  Future<User> getUser(int id);
}
