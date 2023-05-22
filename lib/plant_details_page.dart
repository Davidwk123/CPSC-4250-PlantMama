import 'package:flutter/material.dart';
import 'plant_profile.dart';
import 'package:intl/intl.dart';
//import 'package:provider/provider.dart';
//import 'plant_view_model.dart';

class PlantDetailPage extends StatelessWidget {
  final PlantProfile plant;

  const PlantDetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final plantViewModel = context.watch<PlantViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name), // Just an example, replace with actual plant attribute
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Make column stretch in width
                children: <Widget>[
                  Image.file(
                    plant.picture,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(width: 8),
                  Text(plant.species),
                  Text(plant.location),
                  Text(plant.lighting),
                  // test date 2023-05-06
                  Text(DateFormat('MMM dd, yyyy hh:mm a').format(plant.plantBought)),// Replace with actual plant attribute
                  // Add other plant details here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
