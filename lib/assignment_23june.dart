import 'package:flutter/material.dart';

class PopupCrud extends StatefulWidget {
  const PopupCrud({super.key});

  @override
  State<PopupCrud> createState() => _PopupCrudState();
}

class _PopupCrudState extends State<PopupCrud> {
  List<String> menuItems = ['Item 1', 'Item 2', 'Item 3'];
  int? selectedItemIndex;

  void _addItem() {
    setState(() {
      menuItems.add('Item ${menuItems.length + 1}');
    });
  }

  void _editItem() {
    if (selectedItemIndex != null) {
      TextEditingController controller = TextEditingController(
        text: menuItems[selectedItemIndex!],
      );
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Edit Item'),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      menuItems[selectedItemIndex!] = controller.text;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
      );
    }
  }

  void _deleteItem() {
    if (selectedItemIndex != null) {
      setState(() {
        menuItems.removeAt(selectedItemIndex!);
        selectedItemIndex = null;
      });
    }
  }

  void _onSelectItem(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popup Menu CRUD"),
        actions: [
          PopupMenuButton<int>(
            onSelected: _onSelectItem,
            itemBuilder: (context) {
              return List.generate(
                menuItems.length,
                (index) => PopupMenuItem(
                  value: index,
                  child: Row(
                    children: [
                      Icon(
                        selectedItemIndex == index
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        size: 18,
                        color:
                            selectedItemIndex == index
                                ? Colors.green
                                : Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(menuItems[index]),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              selectedItemIndex != null
                  ? "Selected: ${menuItems[selectedItemIndex!]}"
                  : "No item selected",
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                ),
                ElevatedButton.icon(
                  onPressed: selectedItemIndex != null ? _editItem : null,
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"),
                ),
                ElevatedButton.icon(
                  onPressed: selectedItemIndex != null ? _deleteItem : null,
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
