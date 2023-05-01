import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'add_plant_form.dart';
import 'plant_profile.dart'

class PlantViewModel extends ChangeNotifier {
  List<PlantProfile> plants = [];

  void addPlant(PlantProfile plant){
    plants.add(plant);
    notifyListeners();
  }
  int get numberOfPlants => plants.length;

  List<String> get plantDetails => plants.map((plant) => plant.plantDetails).toList();
}