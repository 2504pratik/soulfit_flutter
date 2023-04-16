import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soulfit/home_page/home_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../models/dbHelper.dart';

class IntroPage3 extends StatefulWidget {
  String name;
  IntroPage3({required this.name, super.key});

  @override
  State<IntroPage3> createState() => _MyAppState();
}

class _MyAppState extends State<IntroPage3> {
  double widgetPointerValue = 30;
  double widgetPointerValue2 = 15;
  late String gender;
  late double weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false);
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(26, 76, 91, 1)),
        ),
        child: Image.asset('assets/images/next_btn.png'),
      ),
      backgroundColor: const Color(0xFF1A4C5B),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              Row(
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
                            const Text(
                              "Gender",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  gender = 'Female';
                                });
                                await SQLHelper.updateGender(
                                    widget.name, gender);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF1A4C5B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: const Center(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  gender = 'Male';
                                });
                                await SQLHelper.updateGender(
                                    widget.name, gender);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF1A4C5B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: const Center(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  gender = 'Others';
                                });
                                await SQLHelper.updateGender(
                                    widget.name, gender);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF1A4C5B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: const Center(
                                child: Text(
                                  'Others',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
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
                                  const TextSpan(
                                      text: 'Weight',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, 2),
                                      child: const Text(
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
                                style: const TextStyle(color: Colors.white),
                                cursorColor:
                                    Colors.white, // set the input color to red
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF1A4C5B),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black),
                                  ),
                                ),
                                onSubmitted: (value) async {
                                  final weight = double.parse(value);
                                  setState(() {
                                    this.weight = weight;
                                  });
                                  await SQLHelper.updateWeight(
                                      weight, widget.name);
                                },
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'Age',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, 2),
                                      child: const Text(
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
                                      onChanged: (value) async {
                                        setState(() {
                                          widgetPointerValue2 = value;
                                        });
                                        await SQLHelper.updateAge(
                                            widgetPointerValue2, widget.name);
                                      },
                                      color: widgetPointerValue2 < 70
                                          ? const Color(0xFF1A4C5B)
                                          : widgetPointerValue < 50
                                              ? const Color(0xFF1A4C5B)
                                                  .withOpacity(0.3)
                                              : const Color(0xFF1A4C5B)
                                                  .withOpacity(0.1)),
                                  LinearWidgetPointer(
                                    value: widgetPointerValue2,
                                    onChanged: (value1) {
                                      setState(() {
                                        widgetPointerValue2 = value1;
                                      });
                                    },
                                    position: LinearElementPosition.inside,
                                    child: SizedBox(
                                      width: 40,
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          widgetPointerValue2
                                              .toStringAsFixed(0),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: widgetPointerValue < 70
                                                ? const Color(0xFF1A4C5B)
                                                    .withOpacity(0.2)
                                                : widgetPointerValue < 50
                                                    ? const Color(0xFF1A4C5B)
                                                        .withOpacity(0.4)
                                                    : const Color(0xFF1A4C5B)
                                                        .withOpacity(0.3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                ranges: [
                                  LinearGaugeRange(
                                    endValue: widgetPointerValue,
                                    color: widgetPointerValue < 200
                                        ? const Color(0xFF1A4C5B)
                                            .withOpacity(0.5)
                                        : widgetPointerValue < 450
                                            ? const Color(0xFF1A4C5B)
                                                .withOpacity(0.8)
                                            : const Color(0xFF1A4C5B)
                                                .withOpacity(0.9),
                                    position: LinearElementPosition.cross,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 510,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffffffff),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
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
                                    onChanged: (value) async {
                                      setState(() {
                                        widgetPointerValue = value;
                                      });
                                      await SQLHelper.updateHeight(
                                          value, widget.name);
                                    },
                                    color: widgetPointerValue < 300
                                        ? const Color(0xFF1A4C5B)
                                        : widgetPointerValue < 150
                                            ? const Color(0xFF1A4C5B)
                                                .withOpacity(0.3)
                                            : const Color(0xFF1A4C5B)
                                                .withOpacity(0.1)),
                                LinearWidgetPointer(
                                  value: widgetPointerValue,
                                  onChanged: (value) {
                                    setState(() {
                                      widgetPointerValue = value;
                                    });
                                  },
                                  position: LinearElementPosition.inside,
                                  child: SizedBox(
                                    width: 40,
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        widgetPointerValue.toStringAsFixed(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: widgetPointerValue < 300
                                                ? const Color(0xFF1A4C5B)
                                                    .withOpacity(0.5)
                                                : widgetPointerValue < 150
                                                    ? const Color(0xFF1A4C5B)
                                                        .withOpacity(0.4)
                                                    : const Color(0xFF1A4C5B)
                                                        .withOpacity(0.3)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              ranges: [
                                LinearGaugeRange(
                                    endValue: widgetPointerValue,
                                    color: widgetPointerValue < 200
                                        ? const Color(0xFF1A4C5B)
                                            .withOpacity(0.5)
                                        : widgetPointerValue < 450
                                            ? const Color(0xFF1A4C5B)
                                                .withOpacity(0.8)
                                            : const Color(0xFF1A4C5B)
                                                .withOpacity(0.9),
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
            ],
          ),
        ),
      ),
    );
  }
}
