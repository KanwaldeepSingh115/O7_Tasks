import 'package:flutter/material.dart';
import 'success21june.dart';

class DropDownForm extends StatefulWidget {
  const DropDownForm({super.key});

  @override
  State<DropDownForm> createState() => _DropDownFormState();
}

class _DropDownFormState extends State<DropDownForm> {
  final _formkey = GlobalKey<FormState>();

  String? selectedCategory;
  String? selectedItem;

  var name = '';
  var item = '';
  var rollno = '';
  var email = '';
  var category = '';

  List<List<String>> data = [
    ['Sports', 'Cricket', 'Badminton', 'Football'],
    ['Smartphone', 'Samsung', 'Redmi', 'Apple'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  onSaved: (value) => name = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Uni.RollNo',
                  ),
                  onSaved: (value) => rollno = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your roll number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onSaved: (value) => email = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Category',
                  ),
                  value: selectedCategory,
                  items:
                      data
                          .map(
                            (row) => DropdownMenuItem(
                              value: row[0],
                              child: Text(row[0]),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      selectedItem = null;
                    });
                  },
                  validator:
                      (value) =>
                          value == null ? 'Please select a category' : null,
                ),
                const SizedBox(height: 20),

                selectedCategory != null
                    ? DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Select Item',
                      ),
                      value: selectedItem,
                      items:
                          data
                              .firstWhere((row) => row[0] == selectedCategory)
                              .sublist(1)
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? 'Please select an item' : null,
                    )
                    : const SizedBox(),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();

                      category = selectedCategory!;
                      item = selectedItem!;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Success(),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.deepPurpleAccent,
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
