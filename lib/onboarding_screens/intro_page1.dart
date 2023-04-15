// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
class intro_page1 extends StatelessWidget {
  const intro_page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:const Color(0xFF1A4C5B) ,
        body:Padding(
          padding:const EdgeInsets.symmetric(horizontal:30,
          vertical:130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
              child:(const Image(
              image:AssetImage('assets/images/Ellipse 100.png'),        
              )),
              ),
              const Positioned(top:50,
              right:100, child: Text('Welcome!',style:TextStyle(fontSize: 30,color:Color(0xFF1A4C5B),fontWeight: FontWeight.bold))),
              ],
              ),
              const SizedBox(height:80),
              const Text('Start Your Journey to make a better you with SoulFit',
              style:TextStyle(fontSize:30,color:Colors.white,fontWeight:FontWeight.bold),
              textAlign:TextAlign.start ,
              ),
              const SizedBox(height:50),
              const Text('First, let\'s get to know you',
              style:TextStyle(fontSize:30,color:Colors.white,fontWeight: FontWeight.bold),
              textAlign:TextAlign.start ,
              )
              
              
            ],

            ),
        )

          )
            
        );
  }
}