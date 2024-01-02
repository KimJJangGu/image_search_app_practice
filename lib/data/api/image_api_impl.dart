import 'dart:convert';
import 'package:image_search_app_practice/data/api/image_api.dart';
import 'package:image_search_app_practice/data/dto/image_dto.dart';
import 'package:http/http.dart' as http;

class ImageApiImpl implements ImageApi {
  @override
  Future<ImageDto> getImageResult(String query) async {
    final http.Response response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));

    return ImageDto.fromJson(jsonDecode(response.body));
  }
}
