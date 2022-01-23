// //import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_list/model/model.dart';
// import 'package:todo_list/textBox.dart';

// class TodoListPage extends StatelessWidget {
//   const TodoListPage({Key? key}) : super(key: key);

//   Widget _buildBody(BuildContext context) {
//      final TextEditingController _textController = TextEditingController();
//      final TextEditingController _contenttextController = TextEditingController();
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
//           FirebaseFirestore.instance
//           .collection("todo")
//           .add({"title": _contenttextController.text});
//     }

//     onDelete(String id) {
//       FirebaseFirestore.instance.collection("todos").doc(id).delete();
//     }

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => TextBox1()));},
//       //  child: const Icon(Icons.add,size: 40,color: Colors.white,),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//              Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: TextField(
//                       controller: _textController,
//                       decoration: InputDecoration(
//                         hintText: "Type here",
//                       ),
//                     ),
//                   ),
//                 ),
//                  Expanded(
//                   flex: 2,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: TextField(
//                       controller: _contenttextController,
//                       decoration: InputDecoration(
//                         hintText: "Type here",
//                       ),
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
          
           
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection("todos").snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return const CircularProgressIndicator();
//                   } else {
//                     return Expanded(
//                       child: ListView(
//                         children: snapshot.data!.docs.map((document) {
//                           return ListTile(
//                             title: Text(document["title"]),
//                           );
//                         }).toList(),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Todo List")),
//       ),
//       body: _buildBody(context),
//     );
//   }
// }
