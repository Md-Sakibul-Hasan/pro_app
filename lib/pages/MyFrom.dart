import 'package:flutter/material.dart';
import 'package:pro_app/pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_button.dart';

class MyCustomFormState extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final user_controller= TextEditingController();
  final mail_controller= TextEditingController();
  final pass_controller= TextEditingController();

  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
  }

  String? validateEmail(String value) {
    RegExp regex =
    RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(value)) {
        return 'Enter valid Email';
      } else {
        return null;
      }

  }




  MyCustomFormState({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.symmetric(horizontal: 25),
      child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                controller: user_controller,
                obscureText: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Enter your name",
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              SizedBox(height: 25,),

              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return validateEmail(value);
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return validatePassword(value);
                },
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
                    if (_formkey.currentState!.validate()){

                      var mail= mail_controller.text.toString();
                      var pass= pass_controller.text.toString();
                      var prefs = await SharedPreferences.getInstance();

                      await prefs.setBool('Login',true);

                      await prefs.setString("mail", mail);
                      await prefs.setString("pass", pass);


                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                    }
                  },
                  child: MyButton(),
              ),
            ],
          )),
    );
  }
}
