import 'package:flutter/material.dart';

class BottomNavBars extends StatefulWidget {
  const BottomNavBars({super.key});

  @override
  State<BottomNavBars> createState() => _BottomNavBarsState();
}

class _BottomNavBarsState extends State<BottomNavBars> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomewithTabs(),
    Center(child: Text('Chat Screen')),
    Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        selectedFontSize: 18,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomewithTabs extends StatelessWidget {
  const HomewithTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          bottom: TabBar(
            labelColor: Colors.brown,
            tabs: const [
              Tab(
                text: 'Today Tasks',
                icon: Icon(Icons.wysiwyg_sharp, color: Colors.blue),
              ),
              Tab(
                text: 'Completed Tasks',
                icon: Icon(Icons.yard_rounded, color: Colors.red),
              ),
              Tab(
                text: 'Upcoming Tasks',
                icon: Icon(Icons.work_outlined, color: Colors.purple),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('No task for today!')),
            Center(
              child: Text(
                'Integrated Bottom Navigation with Bar Items with Tab Layout Combination',
              ),
            ),
            Center(child: Text('You have no Upcoming Tasks!')),
          ],
        ),
      ),
    );
  }
}
