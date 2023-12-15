import 'package:flutter/material.dart';

import 'Home.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/pic1.jpg'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "MD Sakibul Hasan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text("Hi, I\'m Md Sakibul Hasan, I completed my Graduation in CSE from Varendra University"),
            SizedBox(height: 25,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Text("Go-Back")
            )
          ],
        ),
      ),
    );
  }
}
