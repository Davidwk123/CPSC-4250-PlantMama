import 'package:flutter/material.dart';
import 'plant_profile.dart';
import 'plant_view_model.dart';


class AddPlantForm extends StatefulWidget {
  final PlantViewModel plantViewModel;

  const AddPlantForm({super.key, required this.plantViewModel});

  @override
  State<AddPlantForm> createState() => _AddPlantFormState();
}

class _AddPlantFormState extends State<AddPlantForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text:null);
  final _speciesontroller = TextEditingController(text:null);
  final _locationController  = TextEditingController(text:null);
  final _lightingController  = TextEditingController(text:null);
  final _plantBoughtController  = TextEditingController(text:null);
  // late var _profilePicture= "string";
  String? _validateTitle(String? title) {
    if(title == null || title.isEmpty) {
      return 'Please fill in a name.';
    }
    return null;
  }

  String? _validateSpecies(String? species) {
    if(species == null || species.isEmpty) {
      return 'Please fill in a species.';
    }
    return null;
  }

  String? _validateLocation(String? location) {
      if(location == null || location.isEmpty) {
      return 'Please fill in a location.';
      }
      return null;
  }

    String? _validateLighting(String? lighting) {
    if(lighting == null || lighting.isEmpty) {
      return 'Please fill in a lighting.';
    }
    return null;
  }
  String? _validateDate(String? date) {
    if(date == null || date.isEmpty) {
      return 'Please fill in a date.';
    }
    return null;
  }
  _addPlant() {
    if(_formKey.currentState!.validate()){
      final plant = PlantProfile(
        _nameController.text,
        _speciesontroller.text,
        _locationController.text,
        _lightingController.text,
        DateTime.parse(_plantBoughtController.text),
        // _profilePicture,
      );
      widget.plantViewModel.addPlant(plant);
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _nameController,
            validator: _validateTitle,
          ),
           TextFormField(
            decoration: const InputDecoration(labelText: 'Species'),
            controller: _speciesontroller,
            validator: _validateSpecies,
          ),
           TextFormField(
            decoration: const InputDecoration(labelText: 'Location'),
            controller: _locationController,
            validator: _validateLocation,
          ),
            TextFormField(
            decoration: const InputDecoration(labelText: 'Lighting'),
            controller: _lightingController,
            validator: _validateLighting,
          ),
            TextFormField(
            decoration: const InputDecoration(labelText: 'Date Bought'),
            controller: _plantBoughtController,
            validator: _validateDate,
          ),
          ElevatedButton(
              onPressed: _addPlant,
              child: const Text('Add Plant'))
        ],
      ),
    );
  }
}