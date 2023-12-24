import 'dart:convert';
import 'package:flutter_pharmacies_2023/models/pharmacie.dart';
import 'package:http/http.dart' as http;

class PharmacieService {
  final String baseUrl = 'http://192.168.1.37:3000/pharmacies';

  Future<List<Pharmacie>> chargerPharmacies() async {
    final reponse = await http.get(Uri.parse(baseUrl));

    final List<dynamic> donnees = json.decode(reponse.body);
    return donnees.map((json) => Pharmacie.fromJson(json)).toList();
  }

// Ajouter les méthodes creerPharmacie et supprimerPharmacie
  Future<Pharmacie> creerPharmacie(Pharmacie pharmacie) async {
    try {
      final reponse = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(pharmacie.toJson()),
      );

      if (reponse.statusCode == 201) {
        return Pharmacie.fromJson(jsonDecode(reponse.body));
      } else {
        throw Exception('Échec de la création de la pharmacie');
      }
    } catch (e) {
      throw Exception('Une erreur s\'est produite: $e');
    }
  }

  Future<void> supprimerPharmacie(String id) async {
    try {
      final reponse = await http.delete(Uri.parse('$baseUrl/$id'));

      if (reponse.statusCode != 200) {
        throw Exception('Échec de la suppression de la pharmacie');
      }
    } catch (e) {
      throw Exception('Une erreur s\'est produite: $e');
    }
  }
}
