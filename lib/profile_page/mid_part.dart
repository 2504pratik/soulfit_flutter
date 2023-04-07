import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class MidPart extends StatefulWidget {
  const MidPart({Key? key}) : super(key: key);

  @override
  State<MidPart> createState() => _MidPartState();
}

class _MidPartState extends State<MidPart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: DChartPie(
          animate: true,
          animationDuration: const Duration(milliseconds: 500),
          data: const [
            {'domain': 'Mental Fitness', 'measure': 3},
            {'domain': 'Meditation', 'measure': 3},
            {'domain': 'Physical Fitness', 'measure': 3},
          ],
          fillColor: (pieData, index) {
            switch (pieData['domain']) {
              case 'Physical Fitness':
                return const Color.fromRGBO(61, 82, 116, 1);
              case 'Mental Fitness':
                return const Color.fromRGBO(39, 101, 152, 1);
              case 'Meditation':
                return const Color.fromRGBO(12, 118, 131, 1);
              default:
                return Colors.grey;
            }
          },
          labelColor: Colors.white,
          pieLabel: (pieData, index) => '${pieData['domain']}',
          labelFontSize: 20,
        ),
      ),
    );
  }
}
