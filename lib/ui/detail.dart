import 'package:flutter/material.dart';
import 'package:flutter_pharmacies_2023/models/pharmacie.dart';

class DetailPhar extends StatelessWidget {
  const DetailPhar({super.key, required this.pharmacie});

  final Pharmacie pharmacie;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 136, 151),
          title: Text(
            'Détails de la pharmacie',
            style: TextStyle(
              color: Color.fromARGB(255, 206, 241, 245),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontFamily: 'Robboto',
            ),
          ),
        ),
        body: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage(pharmacie.image ?? "https://images.unsplash.com/photo-1604145942179-63cd583fcf64?q=80&w=1882&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              pharmacie.nom,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 136, 151),
              ),
            ),
            Text(
              pharmacie.quartier,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 22, 136, 151),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                pharmacie.adresse,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 22, 136, 151),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                pharmacie.telephone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 22, 136, 151),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                pharmacie.horaire,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
