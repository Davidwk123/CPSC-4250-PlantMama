import 'package:flutter/material.dart';
import 'package:plant_mama/plant_catalog_result.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:provider/provider.dart';

class PlantCatalogList extends StatefulWidget {
  const PlantCatalogList({Key? key}) : super(key: key);

  @override
  State<PlantCatalogList> createState() => _PlantCatalogListState();
}

class _PlantCatalogListState extends State<PlantCatalogList> {
  @override
  Widget build(BuildContext context) {
    final plantViewModel = context.watch<PlantViewModel>();
    return plantViewModel.numberOfCatalogPlants == 0
        ? const Center(child: Text('No plants'))
        : ListView.separated(
      itemBuilder: (context, index) => PlantCatalogResult(index: index),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: plantViewModel.numberOfCatalogPlants,
      // build your list item here
    );
  }
}
