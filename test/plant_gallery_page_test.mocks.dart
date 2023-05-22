// Mocks generated by Mockito 5.4.0 from annotations
// in plant_mama/test/plant_gallery_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i4;

import 'package:flutter/material.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:plant_mama/plant_profile.dart' as _i2;
import 'package:plant_mama/plant_view_model.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePlantProfile_0 extends _i1.SmartFake implements _i2.PlantProfile {
  _FakePlantProfile_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PlantViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlantViewModel extends _i1.Mock implements _i3.PlantViewModel {
  MockPlantViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.PlantProfile> get plants => (super.noSuchMethod(
        Invocation.getter(#plants),
        returnValue: <_i2.PlantProfile>[],
      ) as List<_i2.PlantProfile>);
  @override
  set plants(List<_i2.PlantProfile>? _plants) => super.noSuchMethod(
        Invocation.setter(
          #plants,
          _plants,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i2.PlantProfile> get catalog => (super.noSuchMethod(
        Invocation.getter(#catalog),
        returnValue: <_i2.PlantProfile>[],
      ) as List<_i2.PlantProfile>);
  @override
  set catalog(List<_i2.PlantProfile>? _catalog) => super.noSuchMethod(
        Invocation.setter(
          #catalog,
          _catalog,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get numberOfPlants => (super.noSuchMethod(
        Invocation.getter(#numberOfPlants),
        returnValue: 0,
      ) as int);
  @override
  int get numberOfCatalogPlants => (super.noSuchMethod(
        Invocation.getter(#numberOfCatalogPlants),
        returnValue: 0,
      ) as int);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void addPlant(_i2.PlantProfile? plant) => super.noSuchMethod(
        Invocation.method(
          #addPlant,
          [plant],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addCatalog(List<_i2.PlantProfile>? catalogPlants) => super.noSuchMethod(
        Invocation.method(
          #addCatalog,
          [catalogPlants],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clearCatalog() => super.noSuchMethod(
        Invocation.method(
          #clearCatalog,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.PlantProfile getPlant(int? index) => (super.noSuchMethod(
        Invocation.method(
          #getPlant,
          [index],
        ),
        returnValue: _FakePlantProfile_0(
          this,
          Invocation.method(
            #getPlant,
            [index],
          ),
        ),
      ) as _i2.PlantProfile);
  @override
  List<_i2.PlantProfile> plantCatalogFromJson(String? str) =>
      (super.noSuchMethod(
        Invocation.method(
          #plantCatalogFromJson,
          [str],
        ),
        returnValue: <_i2.PlantProfile>[],
      ) as List<_i2.PlantProfile>);
  @override
  void addListener(_i4.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i4.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i5.NavigatorObserver {
  MockNavigatorObserver() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void didPush(
    _i5.Route<dynamic>? route,
    _i5.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPush,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didPop(
    _i5.Route<dynamic>? route,
    _i5.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPop,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didRemove(
    _i5.Route<dynamic>? route,
    _i5.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didRemove,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didReplace({
    _i5.Route<dynamic>? newRoute,
    _i5.Route<dynamic>? oldRoute,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #didReplace,
          [],
          {
            #newRoute: newRoute,
            #oldRoute: oldRoute,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didStartUserGesture(
    _i5.Route<dynamic>? route,
    _i5.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didStartUserGesture,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didStopUserGesture() => super.noSuchMethod(
        Invocation.method(
          #didStopUserGesture,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
