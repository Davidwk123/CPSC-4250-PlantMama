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
        'common_name': 'Rose',
        'scientific_name': ['Rosa'],
        'sunlight': ['Full sunlight'],
        'default_image': {
          'thumbnail': 'path/to/rose.jpg',
        },
      };

      final plant = PlantProfile.fromJson(json);

      expect(plant.name, 'Rose');
      expect(plant.species, 'Rosa');
      expect(plant.location, 'N/A');
      expect(plant.lighting, 'Full sunlight');
      expect(plant.plantBought, DateTime(0, 0, 0));
      expect(plant.picture.path, 'path/to/rose.jpg');
    });

  });
}

