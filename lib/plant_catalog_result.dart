import 'package:flutter/material.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:provider/provider.dart';
import 'plant_details_page.dart';

class PlantCatalogResult extends StatelessWidget {
  final int index;
  const PlantCatalogResult({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final plantViewModel = context.watch<PlantViewModel>();
    final plantURL = plantViewModel.catalog[index].picture.path;
    List<Widget> children = [
      Row(
        children: [
          if(plantURL != "Unknown.jpg")...[
            Image.network(
              plantURL,
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
          ]else ...[
            const Icon(
              Icons.image_not_supported,
              size: 100,
              color: Colors.grey,
            ),
          ],
          const SizedBox(width: 8), // Add some spacing between the image and text
          Flexible(
            child: Text(
              plantViewModel.catalog[index].name,
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis, // Truncate text with ellipsis (...) if it overflows
            ),
          ),
        ],
      ),
      Text(plantViewModel.catalog[index].species),
      Text(plantViewModel.catalog[index].location),
      Text(plantViewModel.catalog[index].lighting),
      // test date 2023-05-06
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailPage(plant: plantViewModel.catalog[index]),
            // Here, 'PlantDetailPage' is the new page which will show the details of the plant.
            // You have to create this page and make sure to add a parameter to the constructor
            // which will accept the plant you are passing.
          ),
        );
      },
      child: Card(
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
      ),
    );
  }
}

