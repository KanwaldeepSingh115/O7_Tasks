import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ZoomImage extends StatefulWidget {
  const ZoomImage({super.key});

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zoomy Image')),
      body: Center(
        child: WidgetZoom(
          heroAnimationTag: 'zoomy',
          minScaleEmbeddedView: 1,
          maxScaleEmbeddedView: 10,
          maxScaleFullscreen: 100,
          closeFullScreenImageOnDispose: false,
          fullScreenDoubleTapZoomScale: 1000,
          zoomWidget: Image.network(
            'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2021/04/zoom-effect-1.jpg?w=1500&ssl=1',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
