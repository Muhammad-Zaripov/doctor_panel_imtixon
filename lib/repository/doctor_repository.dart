import 'package:exam_3/data_sourses/remote_datasoerse/doctor_remote_datasource.dart';
import 'package:exam_3/models/doctor_models.dart';

class DoctorRepository {
  final DoctorRemoteDatasource doctorRemote = DoctorRemoteDatasource();

  Future<List<DoctorModel>> getDoctors() async {
    return doctorRemote.getDoctors();
  }

  Future<bool> addDoctor(DoctorModel doctor) async {
    return doctorRemote.addDoctor(doctor);
  }

  Future<bool> updateDoctor(DoctorModel doctor) async {
    return doctorRemote.updateDoctor(doctor);
  }

  Future<DoctorModel?> getDoctorFromId(String id) async {
    return doctorRemote.getDoctorFromId(id);
  }
}
