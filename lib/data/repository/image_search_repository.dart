import 'package:image_search_app_practice/core/result.dart';
import 'package:image_search_app_practice/data/model/image.dart';

abstract interface class ImageSearchRepository {
  // Result class로 감싸기
  Future<Result<List<ImageModel>>> getImageModel(String query);
}