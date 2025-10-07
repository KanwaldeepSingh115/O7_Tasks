import 'package:flutter/material.dart';

class Revision29July extends StatefulWidget {
  const Revision29July({super.key});

  @override
  State<Revision29July> createState() => _Revision29JulyState();
}

class _Revision29JulyState extends State<Revision29July> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar Example'),
              background: Image.network(
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #${index + 1}')),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
