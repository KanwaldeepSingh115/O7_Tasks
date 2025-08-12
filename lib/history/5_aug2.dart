import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Aug5_2 extends StatefulWidget {
  const Aug5_2({super.key});

  @override
  State<Aug5_2> createState() => _Aug5_2State();
}

class _Aug5_2State extends State<Aug5_2> {
  final items = List.generate(12, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Grid')),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Card(
                    color: Colors.teal,
                    child: Center(child: Text(items[index])),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
