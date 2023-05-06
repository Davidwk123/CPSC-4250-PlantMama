import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:plant_mama/plant_view_model.dart';

class PlantResult extends StatelessWidget{
  final int index;
  const PlantResult({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final plantViewModel = context.watch<PlantViewModel>();
    List<Text> children = [
      Text(
          plantViewModel.getName(index),
          style: Theme.of(context).textTheme.headlineSmall
      ),
      Text(plantViewModel.getSpecies(index)),
      Text(plantViewModel.getLocation(index)),
      Text(plantViewModel.getLighting(index)),
      Text(DateFormat('MMM dd, yyyy hh:mm a').format(plantViewModel.getPlantBought(index))),
    ];

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: children.length,
              itemBuilder: (context, index) => children[index],
              separatorBuilder: (context, index) => const SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }
}