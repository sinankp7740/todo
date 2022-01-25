import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/model/model.dart';
import 'package:todo_list/screens/viewPage.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class AddText extends StatelessWidget {
  final TextEditingController _titletextController = TextEditingController();
  final TextEditingController _contenttextController = TextEditingController();

  void _clearText() {
    _titletextController.clear();
    _contenttextController.clear();
  }

  String name = "";
  @override
  Widget build(BuildContext context) {
    void _addTask() async {
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
      await FirebaseFirestore.instance.collection("todolist").add({
        "title": _titletextController.text,
        "content": _contenttextController.text
      });
      //   // FirebaseFirestore.instance
      //   //     .collection("todolist")
      //   //     .add({"content": _contenttextController.text});
    }

    final ModelTodo _data = ModelTodo();
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[900],
          actions: [
            TextButton(
                onPressed: () {
                  _data.title = _titletextController.text;
                  _data.content = _contenttextController.text;

                  if (_data.content == "") {
                    SnackBar snackBar = SnackBar(
                      backgroundColor: Colors.red.shade600,
                      content: const Text("content couldn't empty"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    _addTask();

                    _clearText();
                    Navigator.pop(
                        context);
                  }
                },
                child: Icon(
                  Icons.done,
                  size: 30.sp,
                  color: Colors.white,
                ))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 5.0.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 5.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 19.sp, color: Colors.white),
                    controller: _titletextController,
                    decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle:
                            TextStyle(fontSize: 19.sp, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 80.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          textInputAction: TextInputAction.newline,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                          controller: _contenttextController,
                          decoration: InputDecoration(
                              hintText: "Content",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontSize: 14.sp, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
