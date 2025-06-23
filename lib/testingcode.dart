import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  final String mydata;
  const Testing({super.key, required this.mydata});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> with SingleTickerProviderStateMixin {
  String returnedData = 'Return From Second Screen';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          children: [
            Text('${widget.mydata}'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, returnedData),
              child: const Text('Go back with data'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class Popup extends StatefulWidget {
//   const Popup({super.key});

//   @override
//   State<Popup> createState() => _PopupState();
// }

// class _PopupState extends State<Popup> {
//   List<String> items = ['Item 1', 'Item 2', 'Item 3'];
//   int? selectedIndex;

//   void _addItem() {
//     setState(() {
//       items.add('Item ${items.length + 1}');
//     });
//   }

//   void _editItem(int index) {
//     final controller = TextEditingController(text: items[index]);

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Edit Item'),
//         content: TextField(
//           controller: controller,
//           decoration: const InputDecoration(labelText: 'Enter new value'),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 items[index] = controller.text;
//               });
//               Navigator.pop(context);
//             },
//             child: const Text('Update'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _deleteItem(int index) {
//     setState(() {
//       items.removeAt(index);
//       if (selectedIndex == index) {
//         selectedIndex = null;
//       } else if (selectedIndex != null && selectedIndex! > index) {
//         selectedIndex = selectedIndex! - 1;
//       }
//     });
//   }

//   void _showPopupMenu(BuildContext context, Offset offset, int index) async {
//     final selected = await showMenu<String>(
//       context: context,
//       position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
//       items: const [
//         PopupMenuItem(value: 'edit', child: Text('Edit')),
//         PopupMenuItem(value: 'delete', child: Text('Delete')),
//       ],
//     );

//     if (selected == 'edit') {
//       _editItem(index);
//     } else if (selected == 'delete') {
//       _deleteItem(index);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Persistent Item Selection'),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: _addItem,
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) => GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           onLongPressStart: (details) {
//             setState(() {
//               selectedIndex = index;
//             });
//             _showPopupMenu(context, details.globalPosition, index);
//           },
//           child: ListTile(
//             title: Text(items[index]),
//             selected: selectedIndex == index,
//             selectedTileColor: Colors.teal.withOpacity(0.2), // persistent effect
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class Popup extends StatefulWidget {
//   const Popup({super.key});

//   @override
//   State<Popup> createState() => _PopupState();
// }

// class _PopupState extends State<Popup> {
//   List<String> items = ['Item 1', 'Item 2', 'Item 3'];
//   int? selectedIndex; // Track the selected item index

//   // Add new item
//   void _addItem() {
//     setState(() {
//       items.add('Item ${items.length + 1}');
//     });
//   }

//   // Update item using a dialog
//   void _editItem(int index) {
//     TextEditingController controller = TextEditingController(
//       text: items[index],
//     );

//     showDialog(
//       context: context,
//       builder:
//           (_) => AlertDialog(
//             title: const Text('Edit Item'),
//             content: TextField(
//               controller: controller,
//               decoration: const InputDecoration(labelText: 'Enter new value'),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context), // Cancel
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     items[index] = controller.text;
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Update'),
//               ),
//             ],
//           ),
//     );
//   }

//   // Delete item
//   void _deleteItem(int index) {
//     setState(() {
//       items.removeAt(index);
//     });
//   }

//   // Handle popup menu actions
//   void _onMenuSelected(String value) {
//     if (selectedIndex == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please select an item first.")),
//       );
//       return;
//     }

//     switch (value) {
//       case 'edit':
//         _editItem(selectedIndex!);
//         break;
//       case 'delete':
//         _deleteItem(selectedIndex!);
//         selectedIndex = null;
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Popup Menu CRUD'),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: _addItem,
//             tooltip: 'Add Item',
//           ),
//           PopupMenuButton<String>(
//             onSelected: _onMenuSelected,
//             itemBuilder:
//                 (BuildContext context) => [
//                   const PopupMenuItem(
//                     value: 'edit',
//                     child: Text('Edit Selected Item'),
//                   ),
//                   const PopupMenuItem(
//                     value: 'delete',
//                     child: Text('Delete Selected Item'),
//                   ),
//                 ],
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder:
//             (context, index) => ListTile(
//               title: Text(items[index]),
//               selected: selectedIndex == index,
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//             ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Popup extends StatefulWidget {
//   const Popup({super.key});

//   @override
//   State<Popup> createState() => _PopupState();
// }

// class _PopupState extends State<Popup> {
//   // Sample data list to mimic CRUD
//   List<String> items = ['Item 1', 'Item 2'];

//   // Add item
//   void _addItem() {
//     setState(() {
//       items.add('Item ${items.length + 1}');
//     });
//   }

//   // Edit item (just updating first item for example)
//   void _editItem() {
//     if (items.isNotEmpty) {
//       setState(() {
//         items[0] = '${items[0]} (edited)';
//       });
//     }
//   }

//   // Delete item (just removing last item for example)
//   void _deleteItem() {
//     if (items.isNotEmpty) {
//       setState(() {
//         items.removeLast();
//       });
//     }
//   }

//   // Handle popup menu selection
//   void _onMenuSelected(String value) {
//     switch (value) {
//       case 'add':
//         _addItem();
//         break;
//       case 'edit':
//         _editItem();
//         break;
//       case 'delete':
//         _deleteItem();
//         break;
//     }

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text('Action: $value')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Popup Menu CRUD'),
//         backgroundColor: Colors.teal,
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _onMenuSelected,
//             itemBuilder:
//                 (BuildContext context) => [
//                   const PopupMenuItem(value: 'add', child: Text('Add Item')),
//                   const PopupMenuItem(
//                     value: 'edit',
//                     child: Text('Edit First Item'),
//                   ),
//                   const PopupMenuItem(
//                     value: 'delete',
//                     child: Text('Delete Last Item'),
//                   ),
//                 ],
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) => ListTile(title: Text(items[index])),
//       ),
//     );
//   }
// }

