import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiComponents9June extends StatefulWidget {
  const UiComponents9June({super.key});

  @override
  State<UiComponents9June> createState() => _UiComponents9JuneState();
}

class _UiComponents9JuneState extends State<UiComponents9June> {
  String dropdownValue = 'Option 1';
  int selectedToggle = 0;
  bool switchValue = false;

  bool validate = false;

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  void showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: controller1.text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(controller2.text),
        backgroundColor: Colors.indigoAccent,
        duration: Duration(seconds: 3),
        elevation: 108,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            Fluttertoast.showToast(msg: 'Toast invoked by SnackBar');
          },
        ),
        animation: CurvedAnimation(
          parent: kAlwaysCompleteAnimation,
          curve: Curves.bounceInOut,
        ),
        dismissDirection: DismissDirection.endToStart,
        onVisible: () => print('Snackbar is visible'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("UI Components")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/image2.png',
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TextField(
                controller: controller1,
                decoration: const InputDecoration(
                  labelText: 'Enter Text 1 (for Toast)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  labelText: 'Enter Text 2 (for SnackBar)',
                  border: OutlineInputBorder(),
                  errorText:
                      validate ? 'Please,Enter text for snack bar' : null,
                ),
              ),
              const SizedBox(height: 20),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Elevated Button'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Text Button'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Outlined Button'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.amber,
                    child: const Text('Material Button'),
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    color: Colors.green,
                    child: const Text('Cupertino Button'),
                  ),
                  InkWell(
                    onTap: () => showToast(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.tealAccent,
                      child: const Text('Show Toast\n(InkWell)'),
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () => showSnackBar(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.deepOrange,
                      child: const Text('Show SnackBar\n(GestureDetector)'),
                    ),
                  ),

                  FloatingActionButton(
                    onPressed: () {},
                    child: Text('Floating Action Button'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller2.text.isEmpty
                            ? validate = true
                            : validate = false;
                      });
                    },
                    child: Text('Validate Snack Field'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ToggleButtons(
                    isSelected: [selectedToggle == 0, selectedToggle == 1],
                    onPressed: (index) {
                      setState(() {
                        selectedToggle = index;
                      });
                    },
                    children: const [Text('Toggle 1'), Text('Toggle 2')],
                  ),
                  SwitchListTile(
                    title: const Text('Switch Tile'),
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    items:
                        ['Option 1', 'Option 2', 'Option 3']
                            .map(
                              (String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Selected: $value")),
                      );
                    },
                    itemBuilder:
                        (context) => [
                          const PopupMenuItem(
                            value: 'Menu 1',
                            child: Text('Menu 1'),
                          ),
                          const PopupMenuItem(
                            value: 'Menu 2',
                            child: Text('Menu 2'),
                          ),
                        ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
