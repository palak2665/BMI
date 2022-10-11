import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class StateData extends ChangeNotifier {
  Gender? selectedGender;
  void updateMaleColor() {
    selectedGender = Gender.male;
    notifyListeners();
  }

  void updateFemaleColor() {
    selectedGender = Gender.female;
    notifyListeners();
  }

  double value = 150;
  void setValue(double newValue) {
    value = newValue;
    notifyListeners();
  }

  double getValue() {
    return value;
  }

  int weight = 55;
  int age = 18;

  int get getWeight => weight;
  int get getAge => age;

  void increaseWeight() {
    weight++;
    notifyListeners();
  }

  void decreaseWeight() {
    weight--;
    notifyListeners();
  }

  void increaseAge() {
    age++;
    notifyListeners();
  }

  void decreaseAge() {
    age--;
    notifyListeners();
  }
}
