import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_mama/plant_gallery_page.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'plant_gallery_page_test.mocks.dart';

@GenerateMocks([PlantViewModel, NavigatorObserver])
main() {
  testWidgets(
      'The page will display no plants when provided a view model containing 0 plants',
          (WidgetTester tester) async {
        final mockPlantViewModel = MockPlantViewModel();
        const numberOfPlants = 0;

        when(mockPlantViewModel.numberOfPlants).thenReturn(numberOfPlants);

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
        expect(find.text('No plants'), findsOneWidget);
      });
}