import 'package:flutter/material.dart';

class User {
  final String name;
  final TimeOfDay timestamp;
  const User({required this.name, required this.timestamp});
}

class CodeTesting extends StatefulWidget {
  const CodeTesting({super.key});

  @override
  State<CodeTesting> createState() => _CodeTestingState();
}

class _CodeTestingState extends State<CodeTesting> {
  final nameController = TextEditingController();
  final sTimeController = TextEditingController();
  final eTimeController = TextEditingController();

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  List<User> myUsers = [
    User(name: 'Lucy', timestamp: TimeOfDay(hour: 12, minute: 24)),
    User(name: 'Smith', timestamp: TimeOfDay(hour: 09, minute: 50)),
    User(name: 'David', timestamp: TimeOfDay(hour: 17, minute: 11)),
    User(name: 'Bhumika Sharma', timestamp: TimeOfDay(hour: 10, minute: 17)),
  ];

  int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

  List<User> get filterData {
    return myUsers.where((user) {
      final matchName = user.name.toLowerCase().contains(
        nameController.text.toLowerCase(),
      );
      final matchSTime =
          startTime == null ||
          toMinutes(user.timestamp) >= toMinutes(startTime!);

      final matchETime =
          endTime == null || toMinutes(user.timestamp) <= toMinutes(endTime!);
      return matchName && matchSTime && matchETime;
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    sTimeController.dispose();
    eTimeController.dispose();
  }

  Future<void> selectTime({
    required bool isStart,
    required TextEditingController controller,
  }) async {
    final TimeOfDay? pickDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickDate != null) {
      setState(() {
        controller.text = pickDate.format(context);
        if (isStart) {
          startTime = pickDate;
        } else {
          endTime = pickDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtering Names with Real TimeStamps'),
        backgroundColor: Colors.blue,
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
                labelText: 'Enter Name to filter',
              ),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sTimeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.timer),
                      labelText: 'Start Time',
                    ),
                    onTap:
                        () => selectTime(
                          controller: sTimeController,
                          isStart: true,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: eTimeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.timer_outlined),
                      labelText: 'End Time',
                    ),
                    onTap:
                        () => selectTime(
                          isStart: false,
                          controller: eTimeController,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filterData.length,
                itemBuilder: (context, index) {
                  final users = filterData[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(users.name),
                      subtitle: Text(users.timestamp.format(context)),
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
