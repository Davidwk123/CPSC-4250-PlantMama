import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_mama/add_plant_form.dart';
import 'package:plant_mama/home_page.dart';
import 'package:plant_mama/plant_gallery_page.dart';
import 'package:plant_mama/plant_profile.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

main() {
  testWidgets("Adding a plant to to plantViewModel using plantForm", (tester) async{
    final plantViewModel = PlantViewModel();
    final plants = [
      PlantProfile('rose', 'rosa', 'garden', 'full sunlight', DateTime(2023, 5, 7), File('path/rose.jpg')),
    ];
    AddPlantForm form = AddPlantForm(plantViewModel: plantViewModel);
    await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: plantViewModel,
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
    plantViewModel.addPlant(plants[0]);
    expect(plantViewModel.numberOfPlants, 1);
  });
}