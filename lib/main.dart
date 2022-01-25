import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/model.dart';
import 'package:todo_list/screens/viewPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
        
      ),
    );
  }
}
//hellooo


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
      Timer(const Duration(seconds: 2), (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){ return const ViewPage();}));
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Center(child: Text("ToDo",style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),)),
             const Image(height: 150,width: 200,
            image:AssetImage("assets/todo.png",
          	),
             ),
             const SizedBox(height: 10,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
             
          ],
        ),
      ),
    );
  }
}
