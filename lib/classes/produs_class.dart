import 'package:xml/xml.dart';

import 'animal_class.dart';
import 'mancare_class.dart';

class Produs {
  Produs({
    this.animal,
    this.mancare,
    required this.moneda,
    required this.valoare,
    required this.cantitate,
    required this.descriere,
    required this.unitateGreutate,
    required this.valoareGreutate,
  });

  Animal? animal;
  Mancare? mancare;
  String? moneda;
  int? valoare;
  int? cantitate;
  String? descriere;
  String? unitateGreutate;
  int? valoareGreutate;

  factory Produs.fromJson(Map<String, dynamic> json) {
    Animal? animalu;
    Mancare? mancare;
    if (json.containsKey('animal')) {
      animalu = Animal.fromJson(json['animal']);
    } else {
      mancare = Mancare.fromJson(json['mancare']);
    }

    String moneda = json['pret_initial']['moneda'].toString();
    int valoare = int.parse(json['pret_initial']['valoare']);
    int cantitate = int.parse(json['cantitate']);
    String descriere = json['descriere'].toString();
    String unitateGreutate = json['greutate']['unitate'].toString();
    int valoareGreutate = int.parse(json['greutate']['valoare']);
    return Produs(
      animal: animalu,
      mancare: mancare,
      moneda: moneda,
      valoare: valoare,
      cantitate: cantitate,
      descriere: descriere,
      unitateGreutate: unitateGreutate,
      valoareGreutate: valoareGreutate,
    );
  }
}

String getNumber(String number) {
  number = number.replaceAll('[', '').replaceAll(']', '');
  return number;
}

String getAtribut(String atribut) {
  String result = atribut.substring(atribut.indexOf('"') + 1, atribut.lastIndexOf('"'));

  return result;
}

void printProdus(Produs produs, String category) {
  print('------------------------------------------------');
  if (category == 'animal') {
    printAnimal(produs.animal!);
  } else {
    printMancare(produs.mancare!);
  }
  print('moneda = ${produs.moneda}');
  print('valoare = ${produs.valoare}');
  print('cantitate = ${produs.cantitate}');
  print('descriere = ${produs.descriere}');
  print('unitateGreutate = ${produs.unitateGreutate}');
  print('valoareGreutate = ${produs.valoareGreutate}');
  print('------------------------------------------------');
}

Produs ProdusfromXML(XmlElement produs, String category) {
  Animal? animalu;
  Mancare? mancare;
  if (category == 'animal') {
    animalu = AnimalfromXML(produs.findElements('animal').elementAt(0));
  } else {
    mancare = MancarefromXML(produs.findElements('mancare').elementAt(0));
  }
  String moneda = getAtribut(produs.findElements('pret_initial').elementAt(0).attributes.toString());
  int valoare = int.parse(getNumber(produs.findElements('pret_initial').elementAt(0).children.toString()));
  int cantitate = int.parse(getNumber(produs.findElements('cantitate').elementAt(0).children.toString()));
  String descriere = getNumber(produs.findElements('descriere').elementAt(0).children.toString());
  String unitateGreutate = getAtribut(produs.findElements('greutate').elementAt(0).attributes.toString());
  int valoareGreutate = int.parse(getNumber(produs.findElements('greutate').elementAt(0).children.toString()));

  return Produs(
    animal: animalu,
    mancare: mancare,
    moneda: moneda,
    valoare: valoare,
    cantitate: cantitate,
    descriere: descriere,
    unitateGreutate: unitateGreutate,
    valoareGreutate: valoareGreutate,
  );
}
