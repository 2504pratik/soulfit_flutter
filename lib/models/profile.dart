import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  String? name;
  double? height;
  double? weight;
  String? profession;

  Profile({this.name, this.height, this.weight, this.profession});
  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  void updateHeight(double height) {
    this.height = height;
    notifyListeners();
  }

  void updateWeight(double weight) {
    this.weight = weight;
    notifyListeners();
  }

  void updateProfession(String profession) {
    this.profession = profession;
    notifyListeners();
  }
}
