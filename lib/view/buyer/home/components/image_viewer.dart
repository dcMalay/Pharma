import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;
  ImageViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinchZoomImage(
      image: Image.network(
        imageUrl,
      ),
      zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
      hideStatusBarWhileZooming: true,
    );
  }
}
