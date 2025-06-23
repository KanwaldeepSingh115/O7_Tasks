import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  int? selectedIndex;

  void addItem() {
    setState(() {
      items.add('Item ${items.length + 1}');
    });
  }

  void removeItem() {}
  void updateItem() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop Menu Integration'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: addItem,
            icon: Icon(Icons.add),
            tooltip: 'Add Item',
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),

            itemBuilder:
                (context) => [
                  PopupMenuItem(value: 'edit', child: Text('Edit Item')),
                  PopupMenuItem(value: 'remove', child: Text('Remove Item')),
                ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(items[index]),
              selected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
      ),
    );
  }
}
