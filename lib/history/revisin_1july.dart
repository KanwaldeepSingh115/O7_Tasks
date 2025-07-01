import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class User {
  final String name;
  final DateTime timestamp;

  const User({required this.name, required this.timestamp});
}

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<User> allUsers = [
    User(name: 'Anmol', timestamp: DateTime(2025, 05, 30)),
    User(name: 'Ravi', timestamp: DateTime(2025, 06, 25)),
    User(name: 'Hritik', timestamp: DateTime(2025, 04, 17)),
  ];

  final formatDate = DateFormat('yyyy/MM/dd');

  DateTime? startDate;
  DateTime? endDate;

  List<User> get filteredUsers {
    return allUsers.where((user) {
      final matchName = user.name.toLowerCase().contains(
        nameController.text.toLowerCase(),
      );
      final matchSDate =
          startDate == null ||
          user.timestamp.isAfter(startDate!.subtract(Duration(days: 1)));
      final matchEDate =
          endDate == null ||
          user.timestamp.isBefore(endDate!.add(Duration(days: 1)));
      return matchName && matchSDate && matchEDate;
    }).toList();
  }

  Future<void> datePick({
    required bool isStart,
    required TextEditingController controller,
  }) async {
    final DateTime? selectDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (selectDate != null) {
      setState(() {
        controller.text = formatDate.format(selectDate);
        if (isStart) {
          startDate = selectDate;
        } else {
          endDate = selectDate;
        }
      });
    }
  }

  final nameController = TextEditingController();
  final sDateController = TextEditingController();
  final eDateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    sDateController.dispose();
    eDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtering Usernames with Timestamps'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: 'Search by Username',
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sDateController,
                    onTap:
                        () => datePick(
                          controller: sDateController,
                          isStart: true,
                        ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Start Date',
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: eDateController,
                    onTap:
                        () => datePick(
                          controller: eDateController,
                          isStart: false,
                        ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'End Date',
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(user.name),
                      subtitle: Text(formatDate.format(user.timestamp)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
