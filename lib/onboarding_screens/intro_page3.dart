// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(intro_page3());

class intro_page3 extends StatefulWidget {
  const intro_page3({super.key});

  @override
  State<intro_page3> createState() => _MyAppState();
}

class _MyAppState extends State<intro_page3> {
  double widgetPointerValue = 30;
  double widgetPointerValue2=15;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF1A4C5B),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 250,
                        width: 175,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A4C5B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Female",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A4C5B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Male",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A4C5B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Others",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        width: 175,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Weight',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, 2),
                                      child: Text(
                                        '(Kgs)',
                                        //superscript is usually smaller in size
                                        textScaleFactor: 0.8,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //SizedBox(height: 50),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(color: Colors.white),
                                cursorColor:
                                    Colors.white, // set the input color to red
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF1A4C5B),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 2, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Age',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, 2),
                                      child: Text(
                                        '(Yrs)',
                                        textScaleFactor: 0.8,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
          
                                  
                                ],
                              ),
                            ),
          
          
                            GestureDetector(
                            child: SfLinearGauge(
                              minimum: 15,
                              maximum: 70,
                              orientation: LinearGaugeOrientation.horizontal,
                              markerPointers: [
                                LinearShapePointer(
                                    elevation: 3,
                                    elevationColor: Colors.blueGrey,
                                    value: widgetPointerValue2,
                                    onChanged: (value1) {
                                      setState(
                                        () {
                                          widgetPointerValue2 = value1;
                                        },
                                      );
                                    },
                                    color: widgetPointerValue2 < 70
                                        ? Color(0xFF1A4C5B)
                                        : widgetPointerValue < 50
                                            ? Color(0xFF1A4C5B).withOpacity(0.3)
                                            : Color(0xFF1A4C5B).withOpacity(0.1)),
                                LinearWidgetPointer(
                                  value: widgetPointerValue2,
                                  onChanged: (value1) {
                                    setState(() {
                                      widgetPointerValue2 = value1;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        widgetPointerValue2.toStringAsFixed(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: widgetPointerValue < 70
                                                ? Color(0xFF1A4C5B)
                                                    .withOpacity(0.2)
                                                : widgetPointerValue < 50
                                                    ? Color(0xFF1A4C5B)
                                                        .withOpacity(0.4)
                                                    : Color(0xFF1A4C5B)
                                                        .withOpacity(0.3)),
                                      ),
                                    ),
                                  ),
                                  position: LinearElementPosition.inside,
                                ),
                              ],
                              ranges: [
                                LinearGaugeRange(
                                    endValue: widgetPointerValue,
                                    color: widgetPointerValue < 200
                                        ? Color(0xFF1A4C5B).withOpacity(0.5)
                                        : widgetPointerValue < 450
                                            ? Color(0xFF1A4C5B).withOpacity(0.8)
                                            : Color(0xFF1A4C5B).withOpacity(0.9),
                                    position: LinearElementPosition.cross)
                              ],
                            ),
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0,0),
                    child: Container(
                      height: 510,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            child: SfLinearGauge(
                              minimum: 100,
                              maximum: 300,
                              orientation: LinearGaugeOrientation.vertical,
                              markerPointers: [
                                LinearShapePointer(
                                    elevation: 3,
                                    elevationColor: Colors.blueGrey,
                                    value: widgetPointerValue,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          widgetPointerValue = value;
                                        },
                                      );
                                    },
                                    color: widgetPointerValue < 300
                                        ? Color(0xFF1A4C5B)
                                        : widgetPointerValue < 150
                                            ? Color(0xFF1A4C5B).withOpacity(0.3)
                                            : Color(0xFF1A4C5B).withOpacity(0.1)),
                                LinearWidgetPointer(
                                  value: widgetPointerValue,
                                  onChanged: (value) {
                                    setState(() {
                                      widgetPointerValue = value;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        widgetPointerValue.toStringAsFixed(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: widgetPointerValue < 300
                                                ? Color(0xFF1A4C5B)
                                                    .withOpacity(0.5)
                                                : widgetPointerValue < 150
                                                    ? Color(0xFF1A4C5B)
                                                        .withOpacity(0.4)
                                                    : Color(0xFF1A4C5B)
                                                        .withOpacity(0.3)),
                                      ),
                                    ),
                                  ),
                                  position: LinearElementPosition.inside,
                                ),
                              ],
                              ranges: [
                                LinearGaugeRange(
                                    endValue: widgetPointerValue,
                                    color: widgetPointerValue < 200
                                        ? Color(0xFF1A4C5B).withOpacity(0.5)
                                        : widgetPointerValue < 450
                                            ? Color(0xFF1A4C5B).withOpacity(0.8)
                                            : Color(0xFF1A4C5B).withOpacity(0.9),
                                    position: LinearElementPosition.cross)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

