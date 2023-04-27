import 'package:flutter/material.dart';

class PlantGalleryPage extends StatefulWidget {
  const PlantGalleryPage({Key? key}) : super(key: key);

  @override
  State<PlantGalleryPage> createState() => _PlantGalleryPageState();
}

class _PlantGalleryPageState extends State<PlantGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Gallery'),
        ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
