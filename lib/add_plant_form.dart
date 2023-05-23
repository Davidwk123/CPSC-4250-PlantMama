import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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
  final _speciesController = TextEditingController(text:null);
  final _locationController  = TextEditingController(text:null);
  final _lightingController  = TextEditingController(text:null);
  final _plantBoughtController  = TextEditingController(text:null);
  File?  _profilePicture;

  _getFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _profilePicture = imageTemp;
      });
    } on PlatformException catch (e){return;}
  }

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
      if(_profilePicture == null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please take a plant photo.')),
        );
        return;
      }
      final plant = PlantProfile.create(
        _nameController.text,
        _speciesController.text,
        _locationController.text,
        _lightingController.text,
        DateTime.parse(_plantBoughtController.text),
        _profilePicture!,
      );
      widget.plantViewModel.addPlant(plant);
      _formKey.currentState!.reset();
      _nameController.clear();
      _speciesController.clear();
      _locationController.clear();
      _lightingController.clear();
      _plantBoughtController.clear();
      setState(() {
        _profilePicture = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _profilePicture != null
                ? Image.file(
              _profilePicture!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
                : const Icon(Icons.image_not_supported, size: 100),
            ElevatedButton(
              onPressed: _getFromCamera,
              child: const Text('Take Photo'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _nameController,
              validator: _validateTitle,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Species'),
              controller: _speciesController,
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
              decoration: const InputDecoration(labelText: 'Date Bought (yyyy-mm-dd)'),
              controller: _plantBoughtController,
              validator: _validateDate,
            ),
            ElevatedButton(
              onPressed: _addPlant,
              child: const Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }
}