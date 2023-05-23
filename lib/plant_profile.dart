import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PlantProfile {
  final String id;
  final String name;
  final String species;
  final String location;
  final String lighting;
  final DateTime plantBought;
  final File picture;

  PlantProfile(this.id, this.name, this.species, this.location, this.lighting,
      this.plantBought, this.picture);

  factory PlantProfile.create(String name, String species, String location,
      String lighting, DateTime plantBought, File picture) {
    const uuid = Uuid();
    final id = uuid.v4();
    return PlantProfile(id, name, species, location, lighting, plantBought, picture);
  }

  factory PlantProfile.fromJson(Map<String, dynamic> json){
    //print(json['sunlight'].join(,));
    const uuid = Uuid();
    final id = uuid.v4();
    return PlantProfile(
        id,
        json['common_name'],
        json['scientific_name'].join(', '),
        "N/A",
        json['sunlight'].join(', '),
        DateTime(0,0,0),
        File(json['default_image']['thumbnail'])
    );
  }

  factory PlantProfile.fromFirestore(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    final id = document.id;
    final name = data['name'] as String;
    final species = data['species'] as String;
    final location = data['location'] as String;
    final lighting = data['lighting'] as String;
    final plantBought = (data['plantBought'] as Timestamp).toDate();
    final picture = data['picture'] as String;
    return PlantProfile(id, name, species, location, lighting, plantBought, File(picture));
  }
}