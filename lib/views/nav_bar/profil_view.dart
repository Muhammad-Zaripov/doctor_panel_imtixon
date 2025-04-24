import 'package:exam_3/data_sourses/local_datasourse/doctor_local_datasource.dart';
import 'package:exam_3/models/doctor_models.dart';
import 'package:exam_3/views/widgets/edit_profil.dart';
import 'package:flutter/material.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  DoctorModel? doctor;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    doctor = await DoctorLocalDatasource().getDoctor();
    if (doctor == null) {}
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : doctor == null
                ? Center(child: Text("Malumot topilmadi"))
                : Column(
                  children: [
                    SizedBox(height: 30),

                    Text(
                      "Profil",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            doctor!.locationImage,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder:
                                    (context) => EditProfil(doctor: doctor!),
                              );
                              await _loadData();
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 25,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    Text(
                      doctor!.name,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.verified, size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          doctor!.speciality,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: theme.cardColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12,
                              offset: Offset(0, -5),
                              color:
                                  isDark
                                      ? Colors.black12
                                      : Colors.grey.shade300,
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Malumotlar",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 15),
                              Divider(),
                              SizedBox(height: 15),
                              Text(
                                "description: ${doctor!.description}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 15),
                              Divider(),
                              SizedBox(height: 15),
                              Text(
                                "location: ${doctor!.location}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 15),
                              Divider(),
                              SizedBox(height: 15),
                              Text(
                                "experience: ${doctor!.experience} year",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 15),
                              Divider(),
                              SizedBox(height: 15),
                              Text("Ish vaqti", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 15),
                              Text(
                                "${doctor!.start.hour.toString().padLeft(2, "0")}:${doctor!.start.minute.toString().padLeft(2, "0")} / ${doctor!.end.hour.toString().padLeft(2, "0")}:${doctor!.end.minute.toString().padLeft(2, "0")}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
