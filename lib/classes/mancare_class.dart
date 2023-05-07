import 'package:xml/xml.dart';

class Mancare {
  Mancare({
    required this.tip,
    required this.animalDestinat,
    required this.marimeAnimal,
    required this.aroma,
    required this.rasa,
  });

  String? tip;
  String? animalDestinat;
  String? marimeAnimal;
  String? aroma;
  String? rasa;

  factory Mancare.fromJson(Map<String, dynamic> json) {
    String tip = json['tip'].toString();
    String animalDestinat = json['animal_destinat'].toString();
    String marimeAnimal = json['marime_animal'].toString();
    String aroma = json['aroma'].toString();
    String rasa = json['rasa'].toString();

    return Mancare(
      tip: tip,
      animalDestinat: animalDestinat,
      marimeAnimal: marimeAnimal,
      aroma: aroma,
      rasa: rasa,
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

void printMancare(Mancare mancare) {
  print('tip = ${mancare.tip}');
  print('animalDestinat = ${mancare.animalDestinat}');
  print('marimeAnimal = ${mancare.marimeAnimal}');
  print('aroma = ${mancare.aroma}');
  print('rasa = ${mancare.rasa}');
}

Mancare MancarefromXML(XmlElement produs) {
  String tip = getAtribut(produs.attributes.toString());
  String animalDestinat = getNumber(produs.findElements('animal_destinat').elementAt(0).children.toString());
  String marimeAnimal = getNumber(produs.findElements('marime_animal').elementAt(0).children.toString());
  String aroma = getNumber(produs.findElements('aroma').elementAt(0).children.toString());
  String rasa = getNumber(produs.findElements('rasa').elementAt(0).children.toString());
  return Mancare(
    tip: tip,
    animalDestinat: animalDestinat,
    marimeAnimal: marimeAnimal,
    aroma: aroma,
    rasa: rasa,
  );
}
