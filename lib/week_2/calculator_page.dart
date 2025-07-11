// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class CalculatorPage extends StatefulWidget {
//   const CalculatorPage({super.key});
//
//   @override
//   State<CalculatorPage> createState() => _CalculatorPageState();
// }
//
// class _CalculatorPageState extends State<CalculatorPage> {
//   final calculatorFormKey = GlobalKey<FormState>();
//   String calculatorText = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculator'),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         elevation: 8.0,
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 100.0,
//             padding: const EdgeInsets.all(16.0),
//             child: Align(
//               alignment: AlignmentDirectional.centerEnd,
//               child: Text(calculatorText, style: TextStyle(fontSize: 50.0)),
//             ),
//           ),
//           const SizedBox(height: 70.0),
//           Center(
//             child: Container(
//               height: 10.0,
//               width: 40.0,
//               margin: EdgeInsets.symmetric(vertical: 5.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade400,
//                 borderRadius: BorderRadius.circular(50.0),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(top: 10.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(8.0),
//                   topRight: Radius.circular(8.0),
//                 ),
//               ),
//
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildClearButton(),
//                         buildNumberButton(text: '7'),
//                         buildNumberButton(text: '4'),
//                         buildNumberButton(text: '1'),
//                         buildNumberButton(text: '%'),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildNumberButton(text: '÷', color: Colors.indigo),
//                         buildNumberButton(text: '8'),
//                         buildNumberButton(text: '5'),
//                         buildNumberButton(text: '2'),
//                         buildNumberButton(text: '0'),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildNumberButton(text: '×', color: Colors.indigo),
//                         buildNumberButton(text: '9'),
//                         buildNumberButton(text: '6'),
//                         buildNumberButton(text: '3'),
//                         buildNumberButton(text: '.'),
//                       ],
//                     ),
//
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildClearOneButton(),
//                         buildNumberButton(text: '—', color: Colors.indigo),
//                         buildNumberButton(text: '+', color: Colors.indigo),
//                         buildNumberButton(text: 'M-'),
//                         buildNumberButton(text: '⟌'),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildNumberButton(text: 'MC', color: Colors.indigo),
//                         buildNumberButton(text: 'MR'),
//                         buildNumberButton(text: 'M+'),
//                         SizedBox(),
//                         Container(
//                           padding: const EdgeInsets.symmetric(vertical: 24.0),
//                           decoration: BoxDecoration(
//                             color: Colors.indigo,
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: Center(child: buildNumberButton(text: '=', color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildNumberButton({required String text, Color color = Colors.black}) => TextButton(
//     onPressed:
//         () => setState(() {
//           calculatorText = text;
//         }),
//     child: Text(text, style: TextStyle(color: color, fontSize: 24.0)),
//   );
//
//   Widget buildClearButton() => TextButton(
//     onPressed:
//         () => setState(() {
//           calculatorText = '';
//         }),
//     child: Text('C', style: TextStyle(fontSize: 24.0, color: Colors.indigo)),
//   );
//
//   Widget buildClearOneButton() => TextButton(
//     onPressed:
//         () => setState(() {
//           final cleanedText = calculatorText.replaceAll(RegExp(r'[^\d]'), '');
//
//           if (cleanedText.isNotEmpty) {
//             int newText = cleanedText.length;
//             newText--;
//
//             calculatorText = newText.toString(); // optionally update the UI
//           }
//         }),
//     child: Text('CE', style: TextStyle(fontSize: 24.0, color: Colors.indigo)),
//   );
// }
