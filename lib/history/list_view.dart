import 'package:flutter/material.dart';

class ListView4July extends StatefulWidget {
  const ListView4July({super.key});

  @override
  State<ListView4July> createState() => _ListView4JulyState();
}

class _ListView4JulyState extends State<ListView4July> {
  List<String> verticalList = ['Item 1', 'Item2', 'Item3'];
  List<String> horizontalList = ['Box1', 'Box2', 'Box3'];

  final textController = TextEditingController();

  void addItem(List<String> list, String newItem) {
    setState(() {
      list.add(newItem);
    });
  }

  void updateItem(List<String> list, int index, String updatedItem) {
    setState(() {
      list[index] = updatedItem;
    });
  }

  void deleteItem(List<String> list, int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void showCrudDialog({required bool isVertical, int? index}) {
    bool isUpdate = index != null;
    final list = isVertical ? verticalList : horizontalList;
    textController.text = isUpdate ? list[index] : "";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(isUpdate ? 'Update Item' : 'Add Item'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(hintText: 'Enter item text'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (isUpdate) {
                    updateItem(list, index, textController.text);
                  } else {
                    addItem(list, textController.text);
                  }
                  Navigator.of(context).pop();
                },
                child: Text(isUpdate ? 'Update' : 'Add'),
              ),
            ],
          ),
    );
  }

  Widget buildListItem(List<String> list, bool isVertical, int index) {
    return GestureDetector(
      onTap: () => showCrudDialog(isVertical: isVertical, index: index),
      onLongPress: () => deleteItem(list, index),
      child: Container(
        margin: EdgeInsets.all(8),
        width: isVertical ? double.infinity : 120,
        height: 60,
        color: Colors.teal[100 * ((index % 8) + 1)],
        child: Center(child: Text(list[index])),
      ),
    );
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView CRUD'),
        actions: [
          IconButton(
            onPressed: () {
              showCrudDialog(isVertical: false);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text('Horizontal List'),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: horizontalList.length,
              itemBuilder:
                  (context, index) =>
                      buildListItem(horizontalList, false, index),
            ),
          ),
          Divider(),
          Text('Vertical List'),
          Expanded(
            child: ListView.builder(
              itemCount: verticalList.length,
              itemBuilder:
                  (context, index) => buildListItem(verticalList, true, index),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCrudDialog(isVertical: true);
        },
        tooltip: 'Add to Vertical List',
        child: Icon(Icons.add),
      ),
    );
  }
}
