import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plant_mama/plant_view_model.dart';

class PlantGalleryPage extends StatefulWidget {
  const PlantGalleryPage({Key? key}) : super(key: key);

  @override
  State<PlantGalleryPage> createState() => _PlantGalleryPageState();
}

class _PlantGalleryPageState extends State<PlantGalleryPage> {
  @override
  Widget build(BuildContext context) {
    final plantViewModel = context.watch<PlantViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Gallery'),
        ),
      body: plantViewModel.numberOfPlants == 0
          ? const Center(child: Text('No plants'))
          : ListView.builder(
        itemBuilder: (context, index) {
          // build your list item here
        },
        itemCount: plantViewModel.numberOfPlants,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
