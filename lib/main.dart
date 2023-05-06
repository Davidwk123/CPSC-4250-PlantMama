import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_mama/home_page.dart';
import 'package:plant_mama/plant_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, _) => const HomePage(),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PlantViewModel(),
        child: MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          routerConfig: router,
        )
    );
  }
}