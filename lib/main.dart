import 'package:flutter/material.dart';
import 'package:flutter_pharmacies_2023/ui/pharmacies_ecran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacies 2023',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 42, 114, 123)),
        useMaterial3: true,
      ),
      home: PharmaciesEcran(),
    );
  }
}
