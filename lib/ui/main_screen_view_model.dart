import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/repository/image_search_repositoryimpl.dart';
import '../data/model/image.dart';
import '../data/repository/image_search_repository.dart';

class MainScreenViewModel extends ChangeNotifier{ // ChangeNotifier를 상속
  final ImageSearchRepository _repository = ImageSearchRepositoryImpl();

  bool _isLoading = false; // 로딩 상태 초기 값을 false로 설정
  bool get isLoading => _isLoading; // _isLoading을 MainScreenViewModel에서 호출 할 수 있도록 만든다

  List<ImageModel> _imageList = [];
  List<ImageModel> get imageList => List.unmodifiable(_imageList);

  Future<void> getImageList(String query) async {
    _isLoading = true;
    notifyListeners(); // 상태 업데이트, setState와 같음, UI에서 분리
    _imageList = await _repository.getImageModel(query);
    _isLoading = false;
    notifyListeners(); // 상태 업데이트, setState와 같음, UI에서 분리
  }
}