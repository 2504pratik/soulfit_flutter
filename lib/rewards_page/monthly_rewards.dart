import 'package:flutter/material.dart';

class MonthlyRewards extends StatelessWidget {
  const MonthlyRewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'April 2023',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            monthlyRewards(const Color.fromRGBO(204, 89, 112, 1),
                "assets/images/Image7.png"),
            const SizedBox(
              height: 20,
            ),
            monthlyRewards(const Color.fromRGBO(97, 159, 210, 1),
                "assets/images/Image14.png"),
            const SizedBox(
              height: 20,
            ),
            monthlyRewards(const Color.fromRGBO(77, 189, 139, 1),
                "assets/images/Image12.png"),
          ],
        ),
      ),
    );
  }

  Widget monthlyRewards(Color color, String image) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: 95,
            width: 95,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Challenges completed : 0',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rewards earned : 0',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
