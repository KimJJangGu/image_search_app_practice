import 'package:image_search_app_practice/data/model/image.dart';

abstract interface class ImageSearchRepository {
  Future<List<ImageModel>> getImageModel(String query);
}