import 'package:exam_3/models/appoinment_models.dart';
import 'package:exam_3/repository/appoinment_repository.dart';

class AppointmentViewmodel {
  static final _instance = AppointmentViewmodel._privateConstructor();

  AppointmentViewmodel._privateConstructor();

  factory AppointmentViewmodel() => _instance;

  final AppoinmentRepository _repo = AppoinmentRepository();

  List<AppointmentModel> _appointments = [];

  Future<void> init() async {
    _appointments = await _repo.getAppoinments();
  }

  List<AppointmentModel> getByStatus(String status) {
    return _appointments.where((e) => e.status == status).toList();
  }

  Future<bool> updateStatus(String id, String newStatus) async {
    final index = _appointments.indexWhere((e) => e.id == id);
    if (index == -1) return false;

    final updated = _appointments[index].copyWith(status: newStatus);
    final success = await _repo.updateAppoinment(updated);

    if (success) {
      _appointments[index] = updated;
    }

    return success;
  }

  Future<void> refresh() async {
    await init();
  }

  Future<bool> add(AppointmentModel model) async {
    final success = await _repo.addAppoinment(model);
    if (success) {
      await refresh();
    }
    return success;
  }

  List<AppointmentModel> get all => _appointments;

  AppointmentModel? getApFromId(String id) {
    final index = _appointments.indexWhere((e) => e.id == id);
    if (index != -1) {
      return _appointments[index];
    }
    _repo.getAppFromId(id).then((value) {
      return value;
    });
    return null;
  }

  List<AppointmentModel> getAppoFromDoctorId(String doctorId) {
    return _appointments
        .where((element) => element.doctorId == doctorId)
        .toList();
  }

  Future<bool> delete(String id) async {
    final index = _appointments.indexWhere((e) => e.id == id);
    if (index == -1) return false;

    final success = await _repo.deleteAppoinment(id);
    if (success) {
      _appointments.removeAt(index);
    }

    return success;
  }
}
