import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_mama/plant_catalog_list.dart';
import 'package:plant_mama/plant_profile.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:provider/provider.dart';

class PlantCatalogPage extends StatefulWidget {
  const PlantCatalogPage({Key? key}) : super(key: key);

  @override
  State<PlantCatalogPage> createState() => _PlantCatalogPageState();
}

class _PlantCatalogPageState extends State<PlantCatalogPage> {
  //final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  String plantURL = "";

  _plantSearch() {
    String searchTerm = _nameController.text;
    //https://trefle.io/api/v1/plants?token=OJfbxm-MVyJ4zhDeYXlQdLIjlHvu6BBtMrDMDuOYOwc/search?q=$searchTerm
    //"https://perenual.com/api/species-list?key=sk-fC7m645ec1f6613b1786&q=$searchTerm"
    plantURL = "https://trefle.io/api/v1/plants/search?token=OJfbxm-MVyJ4zhDeYXlQdLIjlHvu6BBtMrDMDuOYOwc&q=$searchTerm";
    //print(plantURL);
  }

  Future<void> _fetchPlants(PlantViewModel plantViewModel) async {
    try {
      final response = await http.get(Uri.parse(plantURL));
      List<PlantProfile> listCatalog = plantViewModel.plantCatalogFromJson(response.body);
      plantViewModel.addCatalog(listCatalog);
      //print(listCatalog.runtimeType);
      //for (var plant in plantViewModel.catalog){print(plant.name);}
    }catch (e) {return;}
  }
  @override
  Widget build(BuildContext context) {
    final plantViewModel = context.watch<PlantViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a search term',
              suffixIcon: IconButton(
                onPressed: () {
                  _nameController.clear();
                  plantViewModel.clearCatalog();
                  },
                icon: const Icon(Icons.clear)
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _plantSearch();
                  _fetchPlants(plantViewModel);
                  },
              ),
            ),
            controller: _nameController,
          )
        ),
        const Expanded(child: PlantCatalogList(),)
      ],
    );
  }
}
