// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Calculatrice de Pourboire',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: TipCalculator(),
//     );
//   }
// }

// class TipCalculator extends StatefulWidget {
//   @override
//   _TipCalculatorState createState() => _TipCalculatorState();
// }

// class _TipCalculatorState extends State<TipCalculator> {
//   double billAmount = 0.0;
//   double tipPercentage = 15.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(70, 18, 234, 155),
//         title: Text('Calculateur de Pourboire'

//       ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//              Container(
//               height: 150,
//               width: 350,
//               decoration: BoxDecoration(color: Color.fromARGB(255, 174, 242, 210)),
//               child: Center(
//                 child: Text(
//                   '',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//              SizedBox(height: 20),
//             TextField(
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   billAmount = double.parse(value);
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Montant de la facture',
//                 border:
//                     OutlineInputBorder(), // Ajouter une bordure autour du champ de texte
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[

//                 Text('Pourcentage de pourboire: ${calculateTip()} FCFA'),
//                 DropdownButton(
//                   value: tipPercentage,
//                   items: [10, 15, 20, 25, 30].map((value) {
//                     return DropdownMenuItem(
//                       value: value.toDouble(),
//                       child: Text('$value%'),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       tipPercentage = value!;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Container(

//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color:
//                         Colors.purple),
//               ),
//               child: Text('Montant du pourboire: ${calculateTip()} FCFA'),
//             ),
//             SizedBox(height: 10),
//             Container(

//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color:
//                         Colors.purple),
//               ),
//               child: Text('Total à payer: ${calculateTotal()} FCFA'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   double calculateTip() {
//     return (billAmount * tipPercentage) / 100;
//   }

//   double calculateTotal() {
//     return billAmount + calculateTip();
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculateur de Pourboire',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Calculateur(),
    );
  }
}

class Calculateur extends StatefulWidget {
  @override
  _CalculateurState createState() => _CalculateurState();
}

class _CalculateurState extends State<Calculateur> {
  double somme = 0.0;
  double tipPercentage = 15.0;
  int numberOfPeople = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(70, 18, 234, 155),
        title: Text(
          'Calculateur de Pourboire',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  Image.asset('calcul'),
            Container(
              height: 130,
              width: 330,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 130, 236, 229)),
                  color: Color.fromARGB(255, 190, 240, 217)),
              child: Column(
                children: [
                  Text(
                    'Total par personne: ${(calculateurTotal() / numberOfPeople).toStringAsFixed(2)} FCFA',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pourboire: ${calculateurTip()} FCFA',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        'Total à payer: ${calculateurTotal()} FCFA',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  somme = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Montant de la facture',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(
                          154, 207, 249, 1)), // Couleur de la bordure
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Nombre de personnes: '),
                DropdownButton<int>(
                  value: numberOfPeople,
                  items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      numberOfPeople = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Pourcentage de pourboire: ${calculateurTip()} FCFA'),
                DropdownButton(
                  value: tipPercentage,
                  items: [10, 15, 20, 25, 30].map((value) {
                    return DropdownMenuItem(
                      value: value.toDouble(),
                      child: Text('$value%'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      tipPercentage = value!;
                    });
                  },
                ),
              ],
            ),
            // SizedBox(height: 10),
            // Container(
            //   padding: EdgeInsets.all(8.0),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.purple),
            //   ),
            //   child: Text('Montant du pourboire: ${calculateTip()} FCFA'),
            // ),
            // SizedBox(height: 10),
            // Container(
            //   padding: EdgeInsets.all(8.0),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.purple),
            //   ),
            //   child: Text('Total à payer: ${calculateTotal()} FCFA'),
            // ),
            // SizedBox(height: 10),
            // Container(
            //   padding: EdgeInsets.all(8.0),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.purple),
            //   ),
            //   child: Text(
            //       'Total par personne: ${(calculateTotal() / numberOfPeople).toStringAsFixed(2)} FCFA'),
            // ),
          ],
        ),
      ),
    );
  }

  double calculateurTip() {
    return (somme * tipPercentage) / 100;
  }

  double calculateurTotal() {
    return somme + calculateurTip();
  }
}
