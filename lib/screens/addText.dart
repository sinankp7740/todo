import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/screens/viewPage.dart';

class AddText extends StatelessWidget {
  const AddText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content;
    String title;
    TextEditingController _titletextController = TextEditingController();
    TextEditingController _contenttextController = TextEditingController();

    void clearText() {
      _titletextController.clear();
      _contenttextController.clear();
    }

    void _addTask() {
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
      FirebaseFirestore.instance
          .collection("todolist")
          .add({"title": _titletextController.text,"content": _contenttextController.text});
      // FirebaseFirestore.instance
      //     .collection("todolist")
      //     .add({"content": _contenttextController.text});
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[900],
          actions: [
            TextButton(
                onPressed: () {
                  title = _titletextController.text;
                  content = _contenttextController.text;

                 
                  if(content == "" ){
                    SnackBar snackBar = SnackBar(
                                      backgroundColor: Colors.red.shade600,
                                      content: Text(
                                          "content couldn't empty"),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                  }else{
                     _addTask();
                  clearText();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewPage()));
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
                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                  height: 5.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: TextField(
                    style: TextStyle(fontSize: 19.sp, color: Colors.white),
                    controller: _titletextController,
                    decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle:
                            TextStyle(fontSize: 19.sp, color: Colors.white)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: 16.sp, color: Colors.white),
                          controller: _contenttextController,
                          decoration: InputDecoration(
                              hintText: "Content",
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(fontSize: 16.sp, color: Colors.white)),
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
