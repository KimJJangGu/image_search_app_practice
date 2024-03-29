import 'package:image_search_app_practice/data/dto/image_dto.dart';

abstract interface class ImageApi {
  Future<ImageDto> getImageResult(String query);
}
