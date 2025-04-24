import 'package:exam_3/models/doctor_models.dart';
import 'package:exam_3/repository/doctor_repository.dart';

class DoctorViewmodel {
  static final _singleton = DoctorViewmodel._private();

  DoctorViewmodel._private();

  factory DoctorViewmodel() {
    return _singleton;
  }

  List<DoctorModel> doctors = [];
  DoctorRepository doctorRepo = DoctorRepository();

  Future<void> init() async {
    doctors = await doctorRepo.getDoctors();
  }

  Future<void> refresh() async {
    await init();
  }

  Future<bool> add(DoctorModel model) async {
    final success = await doctorRepo.addDoctor(model);
    if (success) {
      await refresh();
    }
    return success;
  }

  Future<bool> updateDoctor(DoctorModel doctor) async {
    bool status = await doctorRepo.updateDoctor(doctor);
    if (status) {
      final index = doctors.indexWhere((e) => e.id == doctor.id);
      doctors[index] = doctor;
    }
    return status;
  }

  List<DoctorModel> get all => doctors;

  DoctorModel? getDoctorFromId(String id) {
    final index = doctors.indexWhere((e) => e.id == id);
    if (index != -1) {
      return doctors[index];
    }
    doctorRepo.getDoctorFromId(id).then((value) {
      return value;
    });
    return null;
  }

  DoctorModel? getFromEmail(String email) {
    final index = doctors.indexWhere((e) => e.email == email);
    if (index != -1) {
      return doctors[index];
    }
    return null;
  }

  Future<String?> checkdoctor(String email, int experience) async {
    if (doctors.isEmpty) {
      return "Tizimda foydalanuvchilar yo'q";
    }
    for (var element in doctors) {
      if (element.email.toLowerCase() == email.toLowerCase()) {
        if (element.experience == experience) {
          return null;
        }
        return "Experience xato";
      }
    }

    return "Bunday foydalanuvchi tizimda mavjud emas";
  }
}
