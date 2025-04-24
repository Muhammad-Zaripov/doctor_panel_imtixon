import 'package:exam_3/models/appoinment_models.dart';
import 'package:exam_3/models/user_model.dart';
import 'package:exam_3/viewmodels/appointment_viewmodel.dart';
import 'package:exam_3/viewmodels/user_viewmodel.dart';
import 'package:exam_3/views/widgets/dialog_view.dart';
import 'package:flutter/material.dart';

class SubmissionsView extends StatefulWidget {
  const SubmissionsView({super.key});

  @override
  State<SubmissionsView> createState() => _SubmissionsViewState();
}

class _SubmissionsViewState extends State<SubmissionsView> {
  List<AppointmentModel> data = [];

  @override
  void initState() {
    data = AppointmentViewmodel().getAppoFromDoctorId("doctor1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Xabarlar", style: TextStyle())),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    AppointmentModel appo = data[index];
                    UserModel? user = UserViewmodel().getApFromId(appo.userId);
                    // DoctorModel? doctor = DoctorViewmodel().getDoctorFromId(
                    //   appo.doctorId,
                    // );
                    return GestureDetector(
                      onTap: () async {
                        await dialog(context, appo);
                        setState(() {});
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(user!.name),
                                  Text(
                                    appo.date.toIso8601String().split("T")[0],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(appo.notes),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
