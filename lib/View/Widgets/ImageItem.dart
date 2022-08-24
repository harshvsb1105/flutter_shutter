import 'package:flutter/material.dart';
import 'package:flutter_shutter/Model/DataModel/DataModel.dart';

class ImageItem extends StatelessWidget {
  final Data? imageModelData;
  const ImageItem({Key? key, required this.imageModelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: NetworkImage(imageModelData!.assets.preview.url),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}
