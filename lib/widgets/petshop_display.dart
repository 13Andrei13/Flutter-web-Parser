import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_xis/classes/animal_class.dart';
import 'package:flutter_xis/classes/mancare_class.dart';
import 'package:flutter_xis/classes/petshop_class.dart';

import '../classes/produs_class.dart';

class PetshopWidget extends StatelessWidget {
  final Petshop petshop;

  PetshopWidget({required this.petshop});

  Widget buildTableProduse(List<Produs>? produse, String category) {
    final rows = <TableRow>[];
    rows.add(
      const TableRow(
        children: [
          Text('Tip produs'),
          Text('Pret initial'),
          Text('Cantitate'),
          Text('Descriere'),
          Text('Greutate'),
        ],
      ),
    );
    for (int i = 0; i < produse!.length; i++) {
      final produs = produse[i];
      final String pret = '${produs.valoare.toString()} ${produs.moneda.toString()}';
      final String greutate = '${produs.valoareGreutate.toString()} ${produs.unitateGreutate.toString()}';
      rows.add(TableRow(children: [
        Text(category),
        Text(pret),
        Text(produs.cantitate.toString()),
        Text(produs.descriere.toString()),
        Text(greutate)
      ]));
    }
    return Table(
      border: TableBorder.all(),
      children: rows,
    );
  }

  Widget buildTableAnimale(List<Produs>? produse) {
    //INIALIZARE ANIMALE
    List<Animal?>? animale = produse?.map((Produs produs) => produs.animal).toList();
    final rows = <TableRow>[];
    rows.add(
      const TableRow(
        children: [
          Text('Specie'),
          Text('Rasa'),
          Text('Anul nasterii'),
          Text('Tipul animal'),
          Text('Sex'),
        ],
      ),
    );
    for (int i = 0; i < animale!.length; i++) {
      Animal animal = animale[i]!;
      rows.add(TableRow(children: [
        Text(animal.specie.toString()),
        Text(animal.rasa.toString()),
        Text(animal.anulNasterii.toString()),
        Text(animal.tipAnimal.toString()),
        Text(animal.sex.toString())
      ]));
    }
    return Table(
      border: TableBorder.all(),
      children: rows,
    );
  }

  Widget buildTableHrana(List<Produs>? produse) {
    //INIALIZARE ANIMALE
    List<Mancare?>? hrana = produse?.map((Produs produs) => produs.mancare).toList();
    final rows = <TableRow>[];
    rows.add(
      const TableRow(
        children: [
          Text('Tip mancare'),
          Text('Animal destinal '),
          Text('Marime animal'),
          Text('Aroma'),
          Text('Rasa'),
        ],
      ),
    );
    for (int i = 0; i < hrana!.length; i++) {
      Mancare mancare = hrana[i]!;
      rows.add(TableRow(children: [
        Text(mancare.tip.toString()),
        Text(mancare.animalDestinat.toString()),
        Text(mancare.marimeAnimal.toString()),
        Text(mancare.aroma.toString()),
        Text(mancare.rasa.toString())
      ]));
    }
    return Table(
      border: TableBorder.all(),
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Produse de tip animal:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        buildTableProduse(petshop.produseAnimale, 'Animal'),
        const Text(
          'Detaliile despre animalute in ordinea produselor de mai sus:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        buildTableAnimale(petshop.produseAnimale),
        const Text(
          'Produs de tip hrana:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        buildTableProduse(petshop.produseHrana, 'Hrana'),
        const Text(
          'Detaliile despre hrana in ordinea produselor de mai sus:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        buildTableHrana(petshop.produseHrana),
      ],
    );
  }
}
