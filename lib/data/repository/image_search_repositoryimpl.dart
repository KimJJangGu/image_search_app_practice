import 'package:image_search_app_practice/core/result.dart';
import 'package:image_search_app_practice/data/api/image_api.dart';
import 'package:image_search_app_practice/data/mapper/image_mapper.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';

class ImageSearchRepositoryImpl implements ImageSearchRepository {
  final ImageApi _imageApi;

  ImageSearchRepositoryImpl({required imageApi}) : _imageApi = imageApi;

  @override
  Future<Result<List<ImageModel>>> getImageModel(String query) async {
    try {
      final dto = await _imageApi.getImageResult(query);

      // API 응답에서 hits 필드가 null이면 빈 리스트를 반환
      if (dto.hits == null) {
        return Result.success([]);
      }

      // API 응답에서 hits 필드가 존재하면 e.mapper()를 통해 ImageModel 객체로 변환
      // 변환된 리스트를 Result.success()에 담아 반환
      return Result.success(dto.hits!.map((e) => e.mapper()).toList());

      // 에러 발생 시 Result.error()에 담아 반환
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}