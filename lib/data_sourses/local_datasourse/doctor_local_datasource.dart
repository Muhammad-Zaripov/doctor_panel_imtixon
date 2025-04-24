import 'dart:convert';
import 'package:exam_3/models/doctor_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorLocalDatasource {
  Future<void> setDoctor(DoctorModel doctor) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    final data = doctor.toJson();
    data["id"] = doctor.id;
    await shp.setString("doctor", jsonEncode(data));
  }

  Future<DoctorModel?> getDoctor() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    final data = shp.getString("doctor");
    if (data != null) {
      DoctorModel doctor = DoctorModel.fromJson(
        jsonDecode(data) as Map<String, dynamic>,
      );

      return doctor;
    }
    return null;
  }

  Future<bool> clear() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.clear();
  }
}
