import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/user.dart';
import '../../../services/abstractions/user_service.dart';

class MainBloc {
  final _userService = GetIt.I.get<UserService>();

  final _loading = BehaviorSubject<bool>.seeded(false);
  final _users = BehaviorSubject<List<User>>();

  Stream<bool> get loading => _loading.stream;
  Stream<List<User>> get users => _users.stream;

  void loadUsers() async {
    try {
      _loading.add(true);
      final users = await _userService.getUsers();
      _users.add(users);
    } finally {
      _loading.add(false);
    }
  }

  void dispose() {
    _users.close();
  }
}
