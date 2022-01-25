import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/model/model.dart';

import 'package:todo_list/screens/viewPage.dart';

class Details extends StatelessWidget {
  String content;
  String title;
  String docid;
  Details({this.content = "content", this.title = "title", this.docid = ""});

  @override
  Widget build(BuildContext context) {
    ModelTodo _data = ModelTodo();
    final titletextcontroller = TextEditingController(text: title);
    final contenttextcontroller = TextEditingController(text: content);
    void clearText() {
      titletextcontroller.clear();
      contenttextcontroller.clear();
    }

    void updateTask(String id) async {
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
      await FirebaseFirestore.instance.collection("todolist").doc(id).update({
        "title": titletextcontroller.text,
        "content": contenttextcontroller.text
      });

      //   // FirebaseFirestore.instance
      //   //     .collection("todolist")
      //   //     .add({"content": _contenttextController.text});
    }

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[900],
            elevation: 10,
            actions: [
              TextButton(
                onPressed: () {
                  _data.content = contenttextcontroller.text;
                  _data.title = titletextcontroller.text;
                  if (_data.content == "") {
                    SnackBar snackBar = SnackBar(
                      backgroundColor: Colors.red.shade600,
                      content: const Text("content couldn't empty"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    updateTask(docid);

                    clearText();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ViewPage()));
                    Navigator.pop(context);
                  }
                },
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 19.sp, color: Colors.white),
                      controller: titletextcontroller,
                      decoration: const InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      height: 80.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              textInputAction: TextInputAction.newline,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                              controller: contenttextcontroller,
                              decoration: InputDecoration(
                                  hintText: "Content",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 16.sp, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),

                 
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
