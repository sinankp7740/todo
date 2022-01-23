// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_list/model/model.dart';

// class TextBox1 extends StatelessWidget {
//   const TextBox1({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _textController = TextEditingController();
//     final ModelData _data = ModelData();
//     void clearText() {
//       _textController.clear();
//     }

//     void _addTask() {
//       WidgetsFlutterBinding.ensureInitialized();
//       Firebase.initializeApp();
//       FirebaseFirestore.instance
//           .collection("todos")
//           .add({"title": _textController.text});
//     }

//     onDelete(String id) {
//       FirebaseFirestore.instance.collection("todos").doc(id).delete();
//     }
//     return Container(
//       child:  Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: TextField(
//                     controller: _textController,
//                     decoration: InputDecoration(
//                       hintText: "Type here",
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     flex: 1,
//                     child: TextButton(
//                       onPressed: () {
//                         _data.todo = _textController.text;
//                         _addTask();
//                         clearText();
//                       },
//                       child: Text("Add Text"),
//                     )),
//               ],
//             ),
      
//     );
//   }
// }