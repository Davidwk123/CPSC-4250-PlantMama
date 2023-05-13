import 'package:flutter/material.dart';
import 'package:plant_mama/add_plant_form.dart';
import 'package:plant_mama/plant_gallery_page.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:provider/provider.dart';

class PlantCatalogPage extends StatefulWidget {
  const PlantCatalogPage({Key? key}) : super(key: key);

  @override
  State<PlantCatalogPage> createState() => _PlantCatalogPageState();
}

class _PlantCatalogPageState extends State<PlantCatalogPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text:null);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a search term',
              suffixIcon: IconButton(
                onPressed: () {_nameController.clear();},
                icon: const Icon(Icons.clear)
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            controller: _nameController,
          )
        ),
      ],
    );
  }
}
