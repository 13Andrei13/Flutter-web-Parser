import 'package:flutter_xis/classes/animal_class.dart';
import 'package:flutter_xis/classes/mancare_class.dart';
import 'package:flutter_xis/classes/produs_class.dart';
import 'package:xml/xml.dart';

class Petshop {
  List<Produs>? produseAnimale;
  List<Produs>? produseHrana;

  Petshop({
    required this.produseAnimale,
    required this.produseHrana,
  });

  factory Petshop.fromJson(Map<String, dynamic> json) {
    List<dynamic> produseAnimaleJson = json['petshop']['produs_animal'] as List<dynamic>;
    List<Produs> produseAnimale =
        produseAnimaleJson.map((produsAnimalJson) => Produs.fromJson(produsAnimalJson)).toList();

    List<dynamic> produseHranaJson = json['petshop']['produs_hrana'];
    List<Produs> produseHrana = produseHranaJson.map((produsHranaJson) => Produs.fromJson(produsHranaJson)).toList();

    return Petshop(
      produseAnimale: produseAnimale,
      produseHrana: produseHrana,
    );
  }

// Petshop.fromXML(String str){
//
// }
}

void printPetshop(Petshop petshop) {
  for (int i = 0; i < petshop.produseAnimale!.length; i++) {
    printProdus(petshop.produseAnimale![i], 'animal');
  }
  for (int i = 0; i < petshop.produseHrana!.length; i++) {
    printProdus(petshop.produseHrana![i], 'hrana');
  }
}

Petshop PetshopfromXML(String str) {
  //INITIALIZARE LISTE
  List<Produs>? produseAnimale = <Produs>[];
  List<Produs>? produseHrana = <Produs>[];
  //PARSARE XML
  XmlDocument document = XmlDocument.parse(str);
  final Iterable<XmlElement> produse_animale = document.findAllElements('produs_animal');
  for (int i = 0; i < produse_animale.length; i++) {
    Produs produs = ProdusfromXML(produse_animale.elementAt(i), 'animal');
    produseAnimale.add(produs);
  }
  final Iterable<XmlElement> produs_hrana = document.findAllElements('produs_hrana');
  for (int i = 0; i < produs_hrana.length; i++) {
    Produs produs = ProdusfromXML(produs_hrana.elementAt(i), 'hrana');
    produseHrana.add(produs);
  }

  return Petshop(
    produseAnimale: produseAnimale,
    produseHrana: produseHrana,
  );
}
