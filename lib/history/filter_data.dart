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

//Filtering with Time Picker

// import 'package:flutter/material.dart';
// class User {
//   final String name;
//   final TimeOfDay timestamp;
//   const User({required this.name, required this.timestamp});
// }

// class CodeTesting extends StatefulWidget {
//   const CodeTesting({super.key});

//   @override
//   State<CodeTesting> createState() => _CodeTestingState();
// }

// class _CodeTestingState extends State<CodeTesting> {
//   final nameController = TextEditingController();
//   final sTimeController = TextEditingController();
//   final eTimeController = TextEditingController();

//   TimeOfDay? startTime;
//   TimeOfDay? endTime;

//   List<User> myUsers = [
//     User(name: 'Lucy', timestamp: TimeOfDay(hour: 12, minute: 24)),
//     User(name: 'Smith', timestamp: TimeOfDay(hour: 09, minute: 50)),
//     User(name: 'David', timestamp: TimeOfDay(hour: 17, minute: 11)),
//     User(name: 'Bhumika Sharma', timestamp: TimeOfDay(hour: 10, minute: 17)),
//   ];

//   int toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

//   List<User> get filterData {
//     return myUsers.where((user) {
//       final matchName = user.name.toLowerCase().contains(
//         nameController.text.toLowerCase(),
//       );
//       final matchSTime =
//           startTime == null ||
//           toMinutes(user.timestamp) >= toMinutes(startTime!);

//       final matchETime =
//           endTime == null || toMinutes(user.timestamp) <= toMinutes(endTime!);
//       return matchName && matchSTime && matchETime;
//     }).toList();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     nameController.dispose();
//     sTimeController.dispose();
//     eTimeController.dispose();
//   }

//   Future<void> selectTime({
//     required bool isStart,
//     required TextEditingController controller,
//   }) async {
//     final TimeOfDay? pickDate = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (pickDate != null) {
//       setState(() {
//         controller.text = pickDate.format(context);
//         if (isStart) {
//           startTime = pickDate;
//         } else {
//           endTime = pickDate;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filtering Names with Real TimeStamps'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(24),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//                 labelText: 'Enter Name to filter',
//               ),
//               onChanged: (value) => setState(() {}),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: sTimeController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.timer),
//                       labelText: 'Start Time',
//                     ),
//                     onTap:
//                         () => selectTime(
//                           controller: sTimeController,
//                           isStart: true,
//                         ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Expanded(
//                   child: TextField(
//                     controller: eTimeController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.timer_outlined),
//                       labelText: 'End Time',
//                     ),
//                     onTap:
//                         () => selectTime(
//                           isStart: false,
//                           controller: eTimeController,
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             Expanded(
//               child: ListView.builder(
//                 itemCount: filterData.length,
//                 itemBuilder: (context, index) {
//                   final users = filterData[index];
//                   return Card(
//                     child: ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text(users.name),
//                       subtitle: Text(users.timestamp.format(context)),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
