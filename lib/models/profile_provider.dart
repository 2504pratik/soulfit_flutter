import 'package:flutter/material.dart';
import 'package:soulfit/models/profile.dart';

class ProfileProvider extends ChangeNotifier {
  late Profile _profile;

  Profile get profile => _profile;

  void updateProfile(Profile profile) {
    _profile = profile;
    notifyListeners();
  }
}
