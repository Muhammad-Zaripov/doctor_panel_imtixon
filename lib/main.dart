import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:exam_3/models/doctor_models.dart';
import 'package:exam_3/repository/doctor_local_repository.dart';
import 'package:exam_3/viewmodels/appointment_viewmodel.dart';
import 'package:exam_3/viewmodels/doctor_viewmodel.dart';
import 'package:exam_3/viewmodels/treatment_viewmodel.dart';
import 'package:exam_3/viewmodels/user_viewmodel.dart';
import 'package:exam_3/views/auth/login.dart';
import 'package:exam_3/views/nav_bar/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserViewmodel().init();
  await DoctorViewmodel().init();
  await AppointmentViewmodel().init();
  await TreatmentViewmodel().init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DoctorModel? doctor;
  bool isloading = true;

  bool isLogin = false;
  Future<void> load() async {
    doctor = await DoctorLocalRepository().getUser();
    if (doctor == null) {
      isLogin = false;
      setState(() {});
    }
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    load().then((value) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      builder: (light, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: light,
          darkTheme: dark,
          home:
              isloading == true
                  ? Scaffold(body: Center(child: CircularProgressIndicator()))
                  : isLogin
                  ? BottomNavigationBarView()
                  : Login(),
        );
      },
    );
  }
}
