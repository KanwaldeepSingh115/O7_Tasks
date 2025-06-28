import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({super.key});

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  List<String> items = ['One', 'Two', 'Three'];
  String selectedValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Types")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Action
              },
              onLongPress: () {
                // Long press action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: Colors.red, width: 1),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                minimumSize: Size(100, 50),
              ),
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text("Login"),
            ),
            OutlinedButton(
              onPressed: () {},
              // style:ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.blue),         // Background color of the button
              //   foregroundColor: MaterialStateProperty.all(Colors.white),        // Text/Icon color
              //   overlayColor: MaterialStateProperty.resolveWith((states) {
              //     if (states.contains(MaterialState.pressed)) return Colors.red; // Ripple color when pressed
              //     return null;
              //   }),
              //   padding: MaterialStateProperty.all(EdgeInsets.all(16)),          // Padding inside the button
              //   textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),   // Font styling
              //   shape: MaterialStateProperty.all(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),                      // Rounded corners
              //     ),
              //   ),
              // )
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(color: Colors.green, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text("Sign Up"),
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Colors.red,
              iconSize: 30,
              tooltip: 'Like',
              splashColor: Colors.blue,
              hoverColor: Colors.grey,
              highlightColor: Colors.orange,
              focusColor: Colors.purple,
            ),
            FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add Item',
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              heroTag: "fab1",
              child: Icon(Icons.add),
            ),
            DropdownButton<String>(
              value: selectedValue,
              items:
                  items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              underline: Container(height: 2, color: Colors.deepPurpleAccent),
            ),
          ],
        ),
      ),
    );
  }
}
