import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_mama/plant_profile.dart';

void main() {
  group('PlantProfile', () {
    test('Create PlantProfile using factory constructor', () {
      final plant = PlantProfile.create(
        'Rose',
        'Rosa',
        'Garden',
        'Full sunlight',
        DateTime(2023, 5, 7),
        File('path/to/rose.jpg'),
      );

      expect(plant.name, 'Rose');
      expect(plant.species, 'Rosa');
      expect(plant.location, 'Garden');
      expect(plant.lighting, 'Full sunlight');
      expect(plant.plantBought, DateTime(2023, 5, 7));
      expect(plant.picture.path, 'path/to/rose.jpg');
    });

    test('Create PlantProfile from JSON using fromJson factory constructor', () {
      final json = {
        "author": "L.",
        "bibliography": "Sp. pl. 2:1188.  1753",
        "common_name": "coconut palm",
        "image_url": "path/to/plant.jpg",
        "scientific_name": "Cocos nucifera",
      };

      final plant = PlantProfile.fromJson(json);

      expect(plant.name, 'coconut palm');
      expect(plant.species, 'Cocos nucifera');
      expect(plant.location, 'Bibliography: Sp. pl. 2:1188.  1753');
      expect(plant.lighting, 'Author: L.');
      expect(plant.plantBought, DateTime(0, 0, 0));
      expect(plant.picture.path, 'path/to/plant.jpg');
    });

  });
}

