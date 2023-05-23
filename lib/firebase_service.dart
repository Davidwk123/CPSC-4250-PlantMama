import 'package:cloud_firestore/cloud_firestore.dart';
import 'plant_profile.dart';

class FirebaseService {

  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<List<PlantProfile>> getFirebasePlants() async {
    QuerySnapshot snapshot = await _firebase.collection('gallery').get();
    return snapshot.docs.map((doc) => PlantProfile.fromFirestore(doc)).toList();
  }

  Future<void> addPlant(PlantProfile plant) async {
    try {
      await _firebase.collection('gallery').add({
        'name': plant.name,
        'species': plant.species,
        'location': plant.location,
        'lighting': plant.lighting,
        'plantBought': Timestamp.fromDate(plant.plantBought),
        'picture': plant.picture.path
        // Include other event properties in the map
      });
    } catch (e) {
      // Handle any errors that occurred during the addition
      print('Error adding event: $e');
      rethrow;
    }
  }

  Future<void> deletePlant(String id) async {
    try {
      await _firebase.collection('gallery').doc(id).delete();
    } catch (e) {
      print('Error deleting event: $e');
      rethrow;
    }
  }

}
