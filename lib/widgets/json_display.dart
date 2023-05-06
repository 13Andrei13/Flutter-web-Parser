// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_xis/classes/petshop_class.dart';
//
// class PetshopWidget extends StatelessWidget {
//   final String jsonString;
//
//   PetshopWidget({required this.jsonString});
//
//   @override
//   Widget build(BuildContext context) {
//     Petshop petshop = Petshop.fromJson(json.decode(jsonString));
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Produs animal:',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: petshop.produseAnimale!.length,
//           itemBuilder: (BuildContext context, int index) {
//             final produs = petshop.produseAnimale![index];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Specie: ${produs.animal!.specie}'),
//                 Text('Rasa: ${produs.animal!.rasa}'),
//                 Text('Anul nasterii: ${produs.animal!.anulNasterii}'),
//                 Text('Tip animal: ${produs.animal!.tipAnimal}'),
//                 Text('Sex: ${produs.animal!.sex}'),
//                 Text('Pret initial: ${produs.pretInitial.moneda} ${produs.pretInitial.valoare}'),
//
//
//                 Text('Moneda: ${produs.moneda}'),
//                 Text('Valoare: ${produs.valoare}'),
//                 Text('Cantitate: ${produs.cantitate}'),
//                 Text('Descriere: ${produs.descriere}'),
//                 Text('Greutate: ${produs.valoareGreutate} ${produs.unitateGreutate}'),
//                 Divider(),
//               ],
//             );
//           },
//         ),
//         Text(
//           'Produs hrana:',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           itemCount: petshop.produsHrana.length,
//           itemBuilder: (BuildContext context, int index) {
//             final produs = petshop.produsHrana[index];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Tip mancare: ${produs.mancare.tip}'),
//                 Text('Animal destinat: ${produs.mancare.animalDestinat}'),
//                 Text('Marime animal: ${produs.mancare.marimeAnimal}'),
//                 Text('Aroma: ${produs.mancare.aroma}'),
//                 Text('Rasa: ${produs.mancare.rasa}'),
//                 Text('Pret initial: ${produs.pretInitial.moneda} ${produs.pretInitial.valoare}'),
//                 Text('Cantitate: ${produs.cantitate}'),
//                 Text('Descriere: ${produs.descriere}'),
//                 Text('Greutate: ${produs.greutate.valoare} ${produs.greutate.unitate}'),
//                 Divider(),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
