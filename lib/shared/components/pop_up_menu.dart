//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PopupMenuExample extends StatefulWidget {
//   const PopupMenuExample({super.key});
//
//   @override
//   State<PopupMenuExample> createState() => _PopupMenuExampleState();
// }
//
// class _PopupMenuExampleState extends State<PopupMenuExample> {
//   SampleItem? selectedMenu;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('PopupMenuButton')),
//       body: Center(
//         child: PopupMenuButton(
//           initialValue: selectedMenu,
//           // Callback that sets the selected popup menu item.
//           onSelected: (SampleItem item) {
//             setState(() {
//               selectedMenu = item;
//             });
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
//             const PopupMenuItem<int>(
//               value: 1,
//               child: Text('Item 1'),
//             ),
//             const PopupMenuItem(
//               value: 2,
//               child: Text('Item 2'),
//             ),
//             const PopupMenuItem(
//               value: 1,
//               child: Text('Item 3'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
