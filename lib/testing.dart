import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key});

  @override
  State<MyFormFields> createState() => _MyFormFieldsState();
}

class _MyFormFieldsState extends State<MyFormFields> {
  final _formkey = GlobalKey<FormState>();

  String name = '';
  String email = '';

  String? selectedCategory;
  String? selectedItem;

  List<List<String>> data = [
    ['Fruits', 'Strawberry', 'Apple', 'Mango'],
    ['Vegetables', 'Tomato', 'Potato', 'Cauliflower'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onSaved: (value) => name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Name required!!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                ),
                onSaved: (value) => email = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email required!!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
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
                        value == null ? "Please select a Category" : null,
              ),
              SizedBox(height: 10),
              selectedCategory != null
                  ? DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
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
                            value == null ? "Please Select an item" : null,
                  )
                  : SizedBox(),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState?.save();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Form Submitted')));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
