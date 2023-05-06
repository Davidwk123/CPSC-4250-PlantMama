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
    List<Widget> children = [
      Row(
        children: [
          Image.file(
            plantViewModel.plants[index].picture,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 8), // Add some spacing between the image and text
          Text(
            plantViewModel.plants[index].name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
      Text(plantViewModel.plants[index].species),
      Text(plantViewModel.plants[index].location),
      Text(plantViewModel.plants[index].lighting),
      // test date 2023-05-06
      Text(DateFormat('MMM dd, yyyy hh:mm a').format(plantViewModel.plants[index].plantBought)),
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