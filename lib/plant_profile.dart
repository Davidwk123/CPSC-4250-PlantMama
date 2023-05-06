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
}