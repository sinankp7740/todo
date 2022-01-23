//import 'dart:html';

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list/screens/addText.dart';
import 'package:todo_list/screens/detailed.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    String docid = "";
    void delete(String id ) async{
      
       await FirebaseFirestore.instance.collection("todolist")
                    .doc(id)
                    .delete();
                       
               
    }
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.yellow[900],
            elevation: 10,
            title: Text("Todo",
                style:
                    TextStyle(fontSize: 19.0.sp, fontWeight: FontWeight.w400))),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[900],
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddText()));
          },
          child: Icon(Icons.add, size: 35.sp, color: Colors.white),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[850],
            child: Column(
              children: [
               Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("todolist").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView(
                      children: snapshot.data!.docs.map((document) {
                        return Container(
                          
                         padding: EdgeInsets.symmetric(horizontal: 3.w),
                          
                          width: double.infinity.w,
                          child: Column(
                            children: [
                              SizedBox(height: 1.h,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1),
                                  color: const Color(0xff121211),
                                ),
                                child: ListTile(
                                  
                                  title: Text(document["title"],style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                                  subtitle: Text(document["content"],style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                                  onLongPress: (){
                                    docid = document.id;
          
                                    delete(docid);
                                    
                                  },
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Details(title:document["title"] ,content: document["content"],)));
                                  },//
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          
          
          
          
          
          
          
          
          
          
                // Center(child: ElevatedButton(onPressed: () async{
                //   DocumentSnapshot variable =await FirebaseFirestore.instance.collection("todolist").doc().get();
                //   print(variable['content']);
                //   print(variable['title']);
                // }, child: Text("getdata"))),
                // Expanded(child: 
                //  ListView.builder(itemBuilder: (context, index){
                //    return ListTile();
                //  })
                // ,)
              ],
            )
          ),
        ),
      );
    });
  }
}
