import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class addPhar extends StatelessWidget {
  final name_controller;
  final quartier_controller;
  VoidCallback onAdd;
  VoidCallback onCancel;

  addPhar(
      {super.key,
      required this.name_controller,
      required this.quartier_controller,
      required this.onAdd,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 136, 151),
        title: Text(
          'Ajouter Une pharmacie',
          style: TextStyle(
            color: Color.fromARGB(255, 206, 241, 245),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'Robboto',
          ),
        ),
      ),
      body: AlertDialog(
        content: SizedBox(
          height: 320,
          width: 400,
          child: Column(children: [
            Text("Nom de la pharmacie :"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: name_controller),
            ),
            Text("Quartier :"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: quartier_controller),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: onAdd,
                    child: Text("Ajouter Pharmacie"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 22, 136, 151),
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text("Cancel"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 22, 136, 151),
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
