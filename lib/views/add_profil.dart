// import 'package:exam_3/models/profil_model.dart';
// import 'package:exam_3/viewmodels/profil_viewmodel.dart';
// import 'package:exam_3/views/nav_bar/bottom_navigation_bar_view.dart';
// import 'package:flutter/material.dart';

// class InputPage extends StatefulWidget {
//   const InputPage({super.key});
//   @override
//   _InputPageState createState() => _InputPageState();
// }

// class _InputPageState extends State<InputPage> {
//   ProfilViewmodel profilViewmodel = ProfilViewmodel();

//   final _formKey = GlobalKey<FormState>();

//   final field1Controller = TextEditingController();
//   final field2Controller = TextEditingController();
//   final field3Controller = TextEditingController();
//   final field4Controller = TextEditingController();
//   final field5Controller = TextEditingController();
//   final field6Controller = TextEditingController();
//   final field7Controller = TextEditingController();

//   @override
//   void dispose() {
//     field1Controller.dispose();
//     field2Controller.dispose();
//     field3Controller.dispose();
//     field4Controller.dispose();
//     field5Controller.dispose();
//     field6Controller.dispose();
//     field7Controller.dispose();
//     super.dispose();
//   }

//   Future<void> _saveData() async {
//     if (_formKey.currentState!.validate()) {
//       final userData = UserData(
//         field1: field1Controller.text,
//         field2: field2Controller.text,
//         field3: field3Controller.text,
//         field4: field4Controller.text,
//         field5: field5Controller.text,
//         field6: field6Controller.text,
//         field7: field7Controller.text,
//       );

//       print(
//         ".............................$userData...........................",
//       );

//       await profilViewmodel.insert(userData.toMap());
//       field1Controller.clear();
//       field2Controller.clear();
//       field3Controller.clear();
//       field4Controller.clear();
//       field5Controller.clear();
//       field6Controller.clear();
//       field7Controller.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profil yaratish")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: field1Controller,
//                   decoration: InputDecoration(labelText: 'Ism'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Ism kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   controller: field2Controller,
//                   decoration: InputDecoration(labelText: 'Tavsif'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Tavsi kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   controller: field3Controller,
//                   decoration: InputDecoration(labelText: 'Mutaxassislik'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Mutaxassislik kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   controller: field4Controller,
//                   decoration: InputDecoration(labelText: 'Tajriba'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Tajriba  kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   controller: field5Controller,
//                   decoration: InputDecoration(labelText: 'Joylashuv'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Joylashuv kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text("Ish vaqt"),
//                 SizedBox(height: 16),
//                 Row(
//                   spacing: 50,
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: field6Controller,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText: 'Boshlanish vaqti',
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Boshlanish vaqti kiriting";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         controller: field7Controller,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(labelText: 'Tugash vaqti'),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Tugash vaqti kiriting";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: _saveData,
//                       child: Text('Saqlash'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => BottomNavigationBarView(),
//                           ),
//                         );
//                       },
//                       child: Text("otish"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
