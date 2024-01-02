import 'package:image_search_app_practice/data/model/image_model.dart';

abstract interface class ImageSearchRepository {
  Future<List<Image>> getImage();
}