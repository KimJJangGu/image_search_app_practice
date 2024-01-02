import 'package:image_search_app_practice/data/dto/image_dto.dart';
import 'package:image_search_app_practice/data/model/image.dart';

extension ImageMappger on Hits {
  ImageModel mapper() {
    return ImageModel(
      imageUrl: previewURL ?? '',
      tags: '',
    );
  }
}
