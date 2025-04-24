import 'package:exam_3/models/appoinment_models.dart';
import 'package:exam_3/models/treatment_model.dart';
import 'package:exam_3/viewmodels/appointment_viewmodel.dart';
import 'package:exam_3/viewmodels/treatment_viewmodel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RetseptDialog extends StatelessWidget {
  final AppointmentModel appo;
  RetseptDialog({super.key, required this.appo});

  final tashxisController = TextEditingController();
  final doriController = TextEditingController();
  final rezultController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Retsept kiriting"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator:
                  (value) =>
                      value == null
                          ? "Malumot kiriting"
                          : value.isEmpty
                          ? "Malumot kiriting"
                          : null,
              controller: tashxisController,
              decoration: InputDecoration(labelText: 'tashxis'),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator:
                  (value) =>
                      value == null
                          ? "Malumot kiriting"
                          : value.isEmpty
                          ? "Malumot kiriting"
                          : null,
              controller: doriController,
              decoration: InputDecoration(labelText: 'dori-darmon'),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator:
                  (value) =>
                      value == null
                          ? "Malumot kiriting"
                          : value.isEmpty
                          ? "Malumot kiriting"
                          : null,
              controller: rezultController,
              decoration: InputDecoration(
                errorText: error,
                labelText: "Natija",
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ortga"),
            ),
            FilledButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final treat = TreatmentModel(
                    id: "id",
                    appoinmentId: appo.id,
                    diagnosis: tashxisController.text,
                    prescription: doriController.text,
                    result: rezultController.text,
                  );
                  await TreatmentViewmodel().addTreatment(treat);
                  await AppointmentViewmodel().delete(appo.id);
                }

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: Text("Yuborish"),
            ),
          ],
        ),
      ],
    );
  }
}
