import 'package:image_search_app_practice/data/dto/image_dto.dart';
import 'package:image_search_app_practice/data/model/image.dart';

extension ImageMapper on ImageDto {
  ImageModel dtoToImageModel() {
    return ImageModel(
      imageUrl: 'imageUrl',
      tags: 'tags',
    );
  }
}