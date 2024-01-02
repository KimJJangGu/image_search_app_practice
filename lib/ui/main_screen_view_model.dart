import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/repository/image_search_repositoryimpl.dart';
import '../data/model/image.dart';
import '../data/repository/image_search_repository.dart';

class MainScreenViewModel extends ChangeNotifier{
  final ImageSearchRepository _repository = ImageSearchRepositoryImpl();

  List<ImageModel> _imageList = [];
  List<ImageModel> get imageList => List.unmodifiable(_imageList);

  Future<void> getImageList() async {
    _imageList = await _repository.getImageModel();
  }
}