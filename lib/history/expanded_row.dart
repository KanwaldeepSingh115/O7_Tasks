import 'package:flutter/material.dart';

class ExpandedRowScreen extends StatefulWidget {
  const ExpandedRowScreen({super.key});

  @override
  State<ExpandedRowScreen> createState() => _ExpandedRowScreenState();
}

class _ExpandedRowScreenState extends State<ExpandedRowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Row Container'),
        shadowColor: Colors.indigoAccent,
        backgroundColor: Colors.teal,
        leading: Icon(Icons.settings_power_outlined),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Wallet'),
                  backgroundColor: Colors.purpleAccent[200],
                  elevation: 7,
                ),
              );
            },
            icon: Icon(Icons.wallet),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: 150,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 60,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Container 1',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 120,
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Expanded Container 1',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Container(
                width: 90,
                height: 40,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Container 2',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(minHeight: 70, minWidth: 50),
                  height: 150,
                  color: Colors.purple,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Text(
                      'Expanded Container 2',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
