import 'package:exam_3/data_sourses/local_datasourse/doctor_local_datasource.dart';
import 'package:exam_3/models/doctor_models.dart';

class DoctorLocalRepository {
  final DoctorLocalDatasource userLocal = DoctorLocalDatasource();

  Future<void> setUser(DoctorModel doctor) async {
    userLocal.setDoctor(doctor);
  }

  Future<DoctorModel?> getUser() async {
    return userLocal.getDoctor();
  }

  Future<bool> clear() async {
    return userLocal.clear();
  }
}
