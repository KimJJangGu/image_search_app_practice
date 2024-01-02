import 'dart:convert';
import 'package:image_search_app_practice/data/api/image_api.dart';
import 'package:image_search_app_practice/data/dto/image_dto.dart';
import 'package:http/http.dart' as http;

class ImageApiImpl implements ImageApi {
  @override
  Future<List<ImageDto>> getImageResult() async {
    final response = await http
        .get(Uri.parse('https://pixabay.com/api/?key=32075607-7810ff192f11e24fad242db56&q=baseball'));
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((e) => ImageDto.fromJson(e)).toList();
  }
}
