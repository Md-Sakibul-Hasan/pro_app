import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class SignIn extends StatelessWidget {


   SignIn({super.key});

  final _formkey = GlobalKey<FormState>();

  final user_controller= TextEditingController();

  final mail_controller= TextEditingController();

  final pass_controller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            //logo
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(
              height: 50,
            ),

            Text(
              'Welcome Back , You\'ve been missed!',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: mail_controller,
                        obscureText: false,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade400)),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Enter Your Email",
                            hintStyle: TextStyle(color: Colors.grey[500])),
                      ),
                      SizedBox(height: 25,),

                      TextFormField(

                        controller: pass_controller,
                        obscureText: false,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade400)),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(color: Colors.grey[500])),
                      ),


                      SizedBox(height: 25,),
                      GestureDetector(
                        onTap: ()async{

                          var prefs = await SharedPreferences.getInstance();
                          var getMail= await prefs.getString("mail");
                          var getPass= await prefs.getString("pass");

                          await prefs.setBool('Login',true);

                          if (getMail==mail_controller.text && getPass==pass_controller.text){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          } else{
                            "Value Not Matched";
                          }

                          },

                        child: Container(
                          padding: EdgeInsets.all(25),

                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            ),
                          ),

                        ),
                      ),

                    ],
                  )
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
