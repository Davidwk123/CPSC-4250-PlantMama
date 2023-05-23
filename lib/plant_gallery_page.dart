import 'package:flutter/material.dart';
import 'package:plant_mama/plant_result.dart';
import 'package:provider/provider.dart';
import 'plant_view_model.dart';
import 'plant_details_page.dart'; // Import your detail page

class PlantGalleryPage extends StatefulWidget {
  const PlantGalleryPage({Key? key}) : super(key: key);

  @override
  State<PlantGalleryPage> createState() => _PlantGalleryPageState();
}

class _PlantGalleryPageState extends State<PlantGalleryPage> {
  @override
  Widget build(BuildContext context) {
    final plantViewModel = context.watch<PlantViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      plantViewModel.getFirebasePlants();
    });
    return plantViewModel.numberOfPlants == 0
        ? const Center(child: Text('No plants'))
        : ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlantDetailPage(plant: plantViewModel.getPlant(index)),
              // Here, 'PlantDetailPage' is the new page which will show the details of the plant.
              // You have to create this page and make sure to add a parameter to the constructor
              // which will accept the plant you are passing.
            ),
          );
        },
        child: PlantResult(index: index),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: plantViewModel.numberOfPlants,
    );
  }
}
