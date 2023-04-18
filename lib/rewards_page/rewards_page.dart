import 'package:flutter/material.dart';
import 'package:soulfit/rewards_page/daily_rewards.dart';
import 'package:soulfit/rewards_page/monthly_rewards.dart';
import 'package:soulfit/rewards_page/rewards_appbar.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 105, 117, 1),
      body: SingleChildScrollView(
          child: Column(
        children: const [RewardsAppBar(), DailyRewards(), MonthlyRewards()],
      )),
    );
  }
}
