import 'package:flutter/material.dart';

class ThirdPart extends StatelessWidget {
  const ThirdPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Start your meditation session: ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            DefaultTabController(
              length: 3,
              child: TabBar(tabs: [
                Tab(
                  child: Text(
                    '2 min',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    '5 min',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    '8 min',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
