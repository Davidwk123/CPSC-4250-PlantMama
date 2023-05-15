import 'package:flutter/material.dart';
import 'plant_profile.dart';
import 'dart:convert';


class PlantViewModel extends ChangeNotifier {
  List<PlantProfile> plants = [];
  List<PlantProfile> catalog = [];

  void addPlant(PlantProfile plant){
    plants.add(plant);
    notifyListeners();
  }

  void addCatalog(List<PlantProfile> catalogPlants){
    catalog = catalogPlants;
    notifyListeners();
  }

  void clearCatalog() {
    catalog = [];
    notifyListeners();
  }

  List<PlantProfile> plantCatalogFromJson(String str) {
    final List<dynamic> parsed = jsonDecode(str)['data'];
    // parsed.forEach((element) {print(element);});
    //parsed.map((json) => print(json));
    //return [];
    //print(parsed[0]['default_image']['thumbnail']);
    return parsed.map((json) => PlantProfile.fromJson(json)).toList();
  }

  int get numberOfPlants => plants.length;
  int get numberOfCatalogPlants => catalog.length;

  // List get plantDetails => plants.map((plant) => plant.plantDetails).toList();
}
