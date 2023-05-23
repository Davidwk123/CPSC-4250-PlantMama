import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_mama/add_plant_form.dart';
import 'package:plant_mama/firebase_options.dart';
import 'package:plant_mama/home_page.dart';
import 'package:plant_mama/plant_gallery_page.dart';
import 'package:plant_mama/plant_profile.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'plant_gallery_page_test.mocks.dart';

main() {
  testWidgets("Adding a plant to to plantViewModel using plantForm", (tester) async{
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    final mockPlantViewModel = MockPlantViewModel();
    final plants = [
      PlantProfile.create('rose', 'rosa', 'garden', 'full sunlight', DateTime(2023, 5, 7), File('path/rose.jpg')),
      PlantProfile.create('rose2', 'rosa', 'garden', 'full sunlight', DateTime(2023, 5, 7), File('path/rose.jpg'))
    ];
    when(mockPlantViewModel.plants).thenReturn(plants);
    when(mockPlantViewModel.numberOfPlants).thenReturn(2);
    AddPlantForm form = AddPlantForm(plantViewModel: mockPlantViewModel);
    await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: mockPlantViewModel,
          child: MaterialApp(
              home: Scaffold(
                body: form
              )
          ),
        )
    );
    await tester.tap(find.text("Take Photo"));
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(0), 'rose');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(1), 'rose');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(2), 'garden');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(3), 'full sunlight');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(4), '2023-05-06');
    await tester.pump();
    mockPlantViewModel.addPlant(plants[1]);
    verify(mockPlantViewModel.addPlant(any)).called(1);
    expect(mockPlantViewModel.numberOfPlants, 2);
  });

  testWidgets("Failing to Add a plant to to plantViewModel using plantForm", (tester) async{
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    final mockPlantViewModel = MockPlantViewModel();
    final plants = [
      PlantProfile.create('rose', 'rosa', 'garden', 'full sunlight', DateTime(2023, 5, 7), File('path/rose.jpg')),
      PlantProfile.create('rose2', 'rosa', 'garden', 'full sunlight', DateTime(2023, 5, 7), File('path/rose.jpg'))
    ];
    when(mockPlantViewModel.plants).thenReturn(plants);
    when(mockPlantViewModel.numberOfPlants).thenReturn(2);
    AddPlantForm form = AddPlantForm(plantViewModel: mockPlantViewModel);
    await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: mockPlantViewModel,
          child: MaterialApp(
              home: Scaffold(
                  body: form
              )
          ),
        )
    );
    await tester.tap(find.text("Take Photo"));
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(0), 'rose');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(1), 'rose');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(2), 'garden');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(3), 'full sunlight');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(4), '2023-05-06');
    await tester.pump();
    await tester.tap(find.widgetWithText(ElevatedButton, "Add Plant"));
    await tester.pump();
    expect(find.text("Please take a plant photo."), findsOneWidget);
  });
}