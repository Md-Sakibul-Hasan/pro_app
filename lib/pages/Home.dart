import 'package:flutter/material.dart';
import 'package:pro_app/pages/Login_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'My_Profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Home"),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
              },
              child:Text("View Profile")
          ),
          SizedBox(
            height: 25,
          ),

          ElevatedButton(
              onPressed: ()async{
                var prefs = await SharedPreferences.getInstance();

                await prefs.setBool('Login', true);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text('LogOut')
          )
        ],
      ),
    );
  }
}
