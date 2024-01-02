import 'package:flutter/widgets.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';
import 'package:image_search_app_practice/data/repository/image_search_repositoryimpl.dart';

import '../data/model/image_model.dart';

class MainScreenViewModel extends ChangeNotifier{
  final ImageSearchRepository _repository = ImageSearchRepositoryImpl();

  List<Image> _imageList = [];
  List<Image> get imageList => List.unmodifiable(_imageList);

  Future<void> getImageList() async {
    _imageList = await _repository.getImage();
  }
}