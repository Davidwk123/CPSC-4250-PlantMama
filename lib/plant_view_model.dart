import 'package:flutter/material.dart';
import 'plant_profile.dart';
import 'firebase_service.dart';
import 'dart:convert';


class PlantViewModel extends ChangeNotifier {
  final firebaseService = FirebaseService();
  List<PlantProfile> plants = [];
  List<PlantProfile> catalog = [];

  Future<void> getFirebasePlants()async {
    plants = await firebaseService.getFirebasePlants();
    notifyListeners();
  }

  Future<void> addPlant(PlantProfile plant)async {
    //plants.add(plant);
    firebaseService.addPlant(plant);
    notifyListeners();
  }

  Future<void> removePlant(int index)async {
    firebaseService.deletePlant(plants[index].id);
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

  PlantProfile getPlant(int index) {
    return plants[index];
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
