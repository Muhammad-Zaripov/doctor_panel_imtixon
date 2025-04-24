import 'package:exam_3/repository/doctor_local_repository.dart';
import 'package:exam_3/viewmodels/doctor_viewmodel.dart';
import 'package:exam_3/views/nav_bar/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? error;

  void login() async {
    if (_formKey.currentState!.validate()) {
      error = await DoctorViewmodel().checkdoctor(
        emailController.text,
        int.parse(passwordController.text),
      );
      setState(() {});

      if (error == null) {
        final doctor = DoctorViewmodel().getFromEmail(emailController.text);
        await DoctorLocalRepository().setUser(doctor!);

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationBarView()),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tizimga kirish',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  errorText: error,
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: isDark ? null : Colors.blueGrey.shade50,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'emailni kiriting';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return "email yaroqsiz";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Parol',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: isDark ? null : Colors.blueGrey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'parol kiriting';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kirish',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
