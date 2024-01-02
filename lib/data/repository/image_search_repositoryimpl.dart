import 'package:image_search_app_practice/data/api/image_api.dart';
import 'package:image_search_app_practice/data/api/image_api_impl.dart';
import 'package:image_search_app_practice/data/mapper/image_mapper.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';

class ImageSearchRepositoryImpl implements ImageSearchRepository {
  final ImageApi imageApi = ImageApiImpl();

  @override
  Future<List<ImageModel>> getImageModel() async {
    return (await imageApi.getImageResult()).map((e) => e.dtoToImageModel()).toList();
  }
}
