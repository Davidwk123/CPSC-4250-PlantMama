import 'dart:io';

class PlantProfile {
  final String name;
  final String species;
  final String location;
  final String lighting;
  final DateTime plantBought;
  final File picture;

  PlantProfile(this.name, this.species, this.location, this.lighting,
      this.plantBought, this.picture);

  factory PlantProfile.fromMap(Map<String, dynamic> json){
    return PlantProfile(
        json['data']['common_name'],
        json['data']['scientific_name'],
        "N/A",
        json['data']['sunlight'],
        DateTime(0,0,0),
        json['data']['default_image']['thumbnail']);
  }

  factory PlantProfile.fromJson(Map<String, dynamic> json){
    return PlantProfile(
        json['data']['common_name'],
        json['data']['scientific_name'],
        "N/A",
        json['data']['sunlight'],
        DateTime(0,0,0),
        json['data']['default_image']['thumbnail']);
  }
}