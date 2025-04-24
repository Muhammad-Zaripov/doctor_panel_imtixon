import 'package:exam_3/models/user_model.dart';
import 'package:exam_3/repository/user_remote_repository.dart';

class UserViewmodel {
  static final _singleton = UserViewmodel._private();

  UserViewmodel._private();

  factory UserViewmodel() {
    return _singleton;
  }

  final userRepo = UserRemoteRepository();
  List<UserModel> users = [];

  Future<void> init() async {
    await getUsers();
  }

  bool haveUser(String email) {
    for (var element in users) {
      if (element.email.toLowerCase() == email.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  Future<void> getUsers() async {
    users = await userRepo.getUser();
  }

  UserModel? getApFromId(String id) {
    final index = users.indexWhere((e) => e.id == id);
    if (index != -1) {
      return users[index];
    }
    userRepo.getUserFromId(id).then((value) {
      return value;
    });
    return null;
  }
}
