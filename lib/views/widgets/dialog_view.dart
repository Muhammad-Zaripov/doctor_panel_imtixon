import 'package:exam_3/models/appoinment_models.dart';
import 'package:exam_3/models/user_model.dart';
import 'package:exam_3/viewmodels/user_viewmodel.dart';
import 'package:exam_3/views/widgets/retsept_dialog.dart';
import 'package:flutter/material.dart';

dialog(BuildContext context, AppointmentModel appo) {
  UserModel? user = UserViewmodel().getApFromId(appo.userId);
  TimeOfDay end = TimeOfDay(
    hour: appo.time.hour,
    minute: appo.time.minute + 30,
  );

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Malumot"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ismi: ${user!.name}"),
            Text("email: ${user.email}"),
            Text("kontakt: ${user.phone}"),
            Text("jinsi: ${user.gender}"),
            Text("sababi: ${appo.notes}"),
            Text("kuni: ${appo.date.toIso8601String().split("T")[0]}"),
            Text("Qabul vaqti:"),
            Text(
              "boshlanishi: ${appo.time.hour.toString().padLeft(2, "0")}:${appo.time.minute.toString().padLeft(2, "0")} dan",
            ),
            Text(
              "tugashi:  ${end.hour.toString().padLeft(2, "0")}:${end.minute.toString().padLeft(2, "0")} gacha",
            ),
          ],
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
                  await showDialog(
                    context: context,
                    builder: (context) => RetseptDialog(appo: appo),
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: Text("Retsept yuborish"),
              ),
            ],
          ),
        ],
      );
    },
  );
}
