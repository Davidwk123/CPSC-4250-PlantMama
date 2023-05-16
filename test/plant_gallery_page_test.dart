import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_mama/home_page.dart';
import 'package:plant_mama/plant_gallery_page.dart';
import 'package:plant_mama/plant_profile.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'plant_gallery_page_test.mocks.dart';

@GenerateMocks([PlantViewModel, NavigatorObserver])
main() {
  testWidgets(
      'The page will display no plants when navigated to and provided a view model containing 0 plants',
          (WidgetTester tester) async {
        final mockPlantViewModel = MockPlantViewModel();
        when(mockPlantViewModel.numberOfPlants).thenReturn(0);
        when(mockPlantViewModel.numberOfCatalogPlants).thenReturn(0);

        await tester.pumpWidget(
            ChangeNotifierProvider<PlantViewModel>.value(
              value: mockPlantViewModel,
              child: const MaterialApp(
                home: Scaffold(
                  body: HomePage(),
                ),
              ),
            )
        );
        await tester.tap(find.text("Gallery"));
        await tester.pump();
        expect(find.text('No plants'), findsOneWidget);
      });

  testWidgets(
      'The page will display no plants when navigated to and provided a view model containing 0 catalog plants',
          (WidgetTester tester) async {
        final mockPlantViewModel = MockPlantViewModel();
        when(mockPlantViewModel.numberOfPlants).thenReturn(0);
        when(mockPlantViewModel.numberOfCatalogPlants).thenReturn(0);

        await tester.pumpWidget(
            ChangeNotifierProvider<PlantViewModel>.value(
              value: mockPlantViewModel,
              child: const MaterialApp(
                home: Scaffold(
                  body: HomePage(),
                ),
              ),
            )
        );
        await tester.pump();
        expect(find.text('No plants'), findsOneWidget);
      });

  testWidgets(
      'The page will display 1 plant when provided a view model containing 1 plant',
          (WidgetTester tester) async {
        final mockPlantViewModel = MockPlantViewModel();
        final plants = [
          PlantProfile('rose', 'rosa', 'garden', 'full sunlight', DateTime(2023, 5, 7), File('path/rose.jpg')),
        ];
        when(mockPlantViewModel.plants).thenReturn(plants);
        when(mockPlantViewModel.numberOfPlants).thenReturn(1);
        when(mockPlantViewModel.numberOfCatalogPlants).thenReturn(0);

        await tester.pumpWidget(
            ChangeNotifierProvider<PlantViewModel>.value(
              value: mockPlantViewModel,
              child: const MaterialApp(
                home: Scaffold(
                  body: PlantGalleryPage(),
                ),
              ),
            )
        );
        expect(find.text('rose'), findsOneWidget);
      });

  testWidgets(
      'The page will display multiple plant when provided a searchterm from the api',
          (WidgetTester tester) async {
        final mockPlantViewModel = MockPlantViewModel();
        final plants = [
          PlantProfile('White Fir', 'abies concolor', 'N/A', 'Full sun, part shade', DateTime(2023, 5, 7), File('path/rose.jpg')),
        ];
        when(mockPlantViewModel.catalog).thenReturn(plants);
        when(mockPlantViewModel.numberOfPlants).thenReturn(0);
        when(mockPlantViewModel.numberOfCatalogPlants).thenReturn(1);

        await tester.pumpWidget(
            ChangeNotifierProvider<PlantViewModel>.value(
              value: mockPlantViewModel,
              child: const MaterialApp(
                home: Scaffold(
                  body: HomePage(),
                ),
              ),
            )
        );

        await tester.enterText(find.byType(TextField).at(0), 'Noble Fir');
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pump();
        expect(find.text('Noble Fir'), findsOneWidget);
      });
}