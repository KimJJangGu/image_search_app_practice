import 'package:image_search_app_practice/data/api/image_api.dart';
import 'package:image_search_app_practice/data/dto/image_dto.dart';
import 'package:image_search_app_practice/data/mapper/image_mapper.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';

class ImageSearchRepositoryImpl implements ImageSearchRepository {
  final ImageApi _imageApi;

  ImageSearchRepositoryImpl({required imageApi}) : _imageApi = imageApi;

  @override
  Future<List<ImageModel>> getImageModel(String query) async {
    final ImageDto imageDto = await _imageApi.getImageResult(query);

    if (imageDto.hits == null) {
      return [];
    }

    return imageDto.hits!.map((hit) => hit.mapper()).toList();
  }
}
