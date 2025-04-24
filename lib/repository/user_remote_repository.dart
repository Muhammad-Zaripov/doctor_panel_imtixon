import 'package:exam_3/data_sourses/remote_datasoerse/user_remote_datasource.dart';
import 'package:exam_3/models/user_model.dart';

class UserRemoteRepository {
  final UserRemoteDatasource userRemote = UserRemoteDatasource();

  Future<List<UserModel>> getUser() async {
    return userRemote.getUsers();
  }

  Future<bool> addUser(UserModel user) async {
    return userRemote.addUser(user);
  }

  Future<bool> updateUser(UserModel user) async {
    return userRemote.updateUser(user);
  }

  Future<UserModel?> getUserFromId(String id) async {
    return userRemote.getUserFromId(id);
  }
}
