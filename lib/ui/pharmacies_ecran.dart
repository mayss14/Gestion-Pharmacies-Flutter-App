// lib/screens/pharmacies_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_pharmacies_2023/models/pharmacie.dart';
import 'package:flutter_pharmacies_2023/services/pharmacie_service.dart';
import 'package:flutter_pharmacies_2023/ui/addPhar.dart';
import 'package:flutter_pharmacies_2023/ui/detail.dart';

class PharmaciesEcran extends StatefulWidget {
  @override
  _PharmaciesEcranState createState() => _PharmaciesEcranState();
}

class _PharmaciesEcranState extends State<PharmaciesEcran> {
  final PharmacieService pharmacieService = PharmacieService();

  Future<List<Pharmacie>> chargerPharmacies() async {
    try {
      final pharmacies = await pharmacieService.chargerPharmacies();
      return pharmacies;
    } catch (e) {
      throw Exception('Erreur de chargement des pharmacies: $e');
    }
  }

  List<Pharmacie> _pharmacies = [];

  onAdd() {
    final pharmacie = Pharmacie(
        nom: name_controller.text,
        quartier: quartier_controller.text,
        latitude: 10.0,
        longitude: 10.0,
        image: "img",
        horaire: "122",
        adresse: "xxx",
        telephone: "097386873");

    pharmacieService.creerPharmacie(pharmacie);
    setState(() {
      _pharmacies.add(pharmacie);
    });
    Navigator.pop(context);
  }

  onCancel() {
    Navigator.pop(context);
  }

  final name_controller = TextEditingController();
  final quartier_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 136, 151),
        title: Text(
          'Liste des pharmacies',
          style: TextStyle(
            color: Color.fromARGB(255, 206, 241, 245),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'Robboto',
          ),
        ),
      ),
      body: FutureBuilder<List<Pharmacie>>(
        future: chargerPharmacies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Aucune pharmacie disponible.'),
            );
          } else {
            _pharmacies = snapshot.data!;
            return ListView.builder(
              itemCount: _pharmacies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 22, 136, 151),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      title: Text(
                        _pharmacies[index].nom,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_pharmacies[index].quartier),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 22, 136, 151),
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 234, 243, 245),
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        color: Color.fromARGB(255, 22, 136, 151),
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await pharmacieService
                              .supprimerPharmacie(_pharmacies[index].id);
                          setState(() {
                            _pharmacies.removeAt(index);
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPhar(
                              pharmacie: _pharmacies[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 22, 136, 151),
        foregroundColor: Colors.white,
        onPressed: //Ajout d'une pharmacie
            () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addPhar(
                      name_controller: name_controller,
                      quartier_controller: quartier_controller,
                      onAdd: onAdd,
                      onCancel: onCancel)));
        },
        tooltip: 'Ajouter une pharmacie',
        child: Icon(Icons.add),
      ),
    );
  }
}
