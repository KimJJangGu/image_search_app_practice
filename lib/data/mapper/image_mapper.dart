import 'package:image_search_app_practice/data/dto/image_dto.dart';
import 'package:image_search_app_practice/data/model/image_model.dart';

extension ImageMapper on ImageDto {
  Image dtoToImageModel() {
    return Image(
      imageUrl: 'imageUrl',
      tags: 'tags',
    );
  }
}