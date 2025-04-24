import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:exam_3/repository/doctor_local_repository.dart';
import 'package:exam_3/views/auth/login.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sozlanmalar")),
      body: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            title: Text("Tungi mavzu", style: TextStyle(fontSize: 20)),
            trailing: IconButton(
              onPressed: () {
                if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
              icon: Icon(
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 36,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              return logout(context);
            },
            child: Row(
              children: [
                SizedBox(width: 15),
                Transform(
                  transform: Matrix4.rotationY(3.14),
                  alignment: Alignment.center,
                  child: Icon(Icons.logout),
                ),
                SizedBox(width: 8),
                Text("Chiqish", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void logout(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Chiqmoqchimisiz',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('yoq'),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DoctorLocalRepository().clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text('ha'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
