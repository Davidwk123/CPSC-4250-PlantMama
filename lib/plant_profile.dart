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
        json['common_name'],
        json['scientific_name'],
        "N/A",
        json['sunlight'],
        DateTime(0,0,0),
        json['default_image']['thumbnail']);
  }

  factory PlantProfile.fromJson(Map<String, dynamic> json){
    //print(json['sunlight'].join(,));
    return PlantProfile(
        json['common_name'],
        json['scientific_name'].join(', '),
        "N/A",
        json['sunlight'].join(', '),
        DateTime(0,0,0),
        File(json['default_image']['thumbnail'])
    );
  }
}