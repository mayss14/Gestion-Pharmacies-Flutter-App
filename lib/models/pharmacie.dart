import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Pharmacie {
  String id; // Mappé à recordid
  String nom; // Mappé à pharmacie
  String quartier; // Mappé à quartier
  late double latitude;
  late double longitude;
  late String image;
  late String horaire;
  late String adresse;
  late String telephone;

  Pharmacie({
    String? id,
    required this.nom,
    required this.quartier,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.horaire,
    required this.adresse,
    required this.telephone,
  }) : id = id ?? Uuid().v4();

  //Ajouter ce qu'il faut pour les conversions JSON: Pharmacie.fromJson et toJson
  Pharmacie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['fields']['pharmacie'],
        quartier = json['fields']['quartier'],
        //latitude = double.parse(json['fields']['latitude']),
        //longitude = double.parse(json['fields']['longitude']),
        image = json['fields']['image'],
        horaire = json['fields']['horaires_d_ouverture'],
        adresse = json['fields']['adresse'],
        telephone = json['fields']['contact'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "fields": {
          "pharmacie": nom, "quartier": quartier,
          //"latitude": latitude.toString(), "longitude": longitude.toString(),
          "image": image,
          "horaires_d_ouverture": horaire, "adresse": adresse,
          "contact": telephone
        },
      };
}
