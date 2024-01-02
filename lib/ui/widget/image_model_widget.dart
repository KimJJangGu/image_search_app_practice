import 'package:flutter/material.dart';
import '../../data/model/image.dart';

class ImageModelWidget extends StatelessWidget {
  final ImageModel imageModel;

  const ImageModelWidget({
    super.key,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageModel.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}