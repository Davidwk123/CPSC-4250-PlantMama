import 'package:flutter/material.dart';
import 'plant_profile.dart';

class PlantViewModel extends ChangeNotifier {
  List<PlantProfile> plants = [];

  void addPlant(PlantProfile plant){
    plants.add(plant);
    notifyListeners();
  }
  int get numberOfPlants => plants.length;

  // List get plantDetails => plants.map((plant) => plant.plantDetails).toList();
}
