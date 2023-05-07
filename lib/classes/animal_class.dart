import 'package:xml/xml.dart';

class Animal {
  Animal({
    required this.specie,
    required this.rasa,
    required this.anulNasterii,
    required this.tipAnimal,
    required this.sex,
  });

  String? specie;
  String? rasa;
  int? anulNasterii;
  String? tipAnimal;
  String? sex;

  factory Animal.fromJson(Map<String, dynamic> json) {
    String specie = json['specie'];
    String rasa = json['rasa'];
    int anulNasterii = int.parse(json['anul_nastere']);
    String tipAnimal = json['tip_animal'];
    String sex = json['sex'];

    return Animal(
      specie: specie,
      rasa: rasa,
      anulNasterii: anulNasterii,
      tipAnimal: tipAnimal,
      sex: sex,
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

void printAnimal(Animal animal) {
  print('specie = ${animal.specie}');
  print('rasa = ${animal.rasa}');
  print('anulNasterii = ${animal.anulNasterii}');
  print('tipAnimal = ${animal.tipAnimal}');
  print('sex = ${animal.sex}');
}

Animal AnimalfromXML(XmlElement produs) {
  String specie = getAtribut(produs.attributes.toString());

  String rasa = getNumber(produs.findElements('rasa').elementAt(0).children.toString());
  int anulNasterii = int.parse(getNumber(produs.findElements('anul_nastere').elementAt(0).children.toString()));
  String tipAnimal = getNumber(produs.findElements('tip_animal').elementAt(0).children.toString());
  String sex = getNumber(produs.findElements('sex').elementAt(0).children.toString());
  return Animal(
    specie: specie,
    rasa: rasa,
    anulNasterii: anulNasterii,
    tipAnimal: tipAnimal,
    sex: sex,
  );
}
