import 'package:flutter/material.dart';
import 'package:pro_app/pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/Login_Page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {




  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool Login = false;


  void initState() {
    super.initState();
    Check_Login();
  }

  void Check_Login()async{
    
    await Future.delayed(Duration(seconds:5));

    var prefs = await SharedPreferences.getInstance();
    bool? L = await prefs.getBool('Login');

    var t = L==true?Login=true:Login=false;
    setState(() {

    });
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Login?Home():LoginPage() ,

    );
  }
}
