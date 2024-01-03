import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/main_state.dart';
import '../data/model/image.dart';
import '../data/repository/image_search_repository.dart';

// ChangeNotifier를 상속
class MainScreenViewModel extends ChangeNotifier {
  //final ImageSearchRepository _repository = ImageSearchRepositoryImpl();
  final ImageSearchRepository _repository;

  MainState _state = MainState(
    imageModel: List.unmodifiable([]),
    isLoading: false,
  );

  MainState get state => _state;

  // 클래스의 인스턴스를 생성할 때 외부(di)에서 repository 주입 가능
  MainScreenViewModel({required ImageSearchRepository repository}) : _repository = repository;

  // bool _isLoading = false; // 로딩 상태 초기 값을 false로 설정
  // bool get isLoading => _isLoading; // _isLoading을 MainScreenViewModel에서 호출 할 수 있도록 만든다
  //
  // List<ImageModel> _imageList = [];
  // List<ImageModel> get imageList => List.unmodifiable(_imageList);

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    _state = state.copyWith(
      isLoading: false,
      imageModels: List.unmodifiable((await _repository.getImageModel(query)).take(3).toList()),
    );
    notifyListeners();
  }

// Future<void> getImageList(String query) async {
//   _isLoading = true;
//   notifyListeners(); // 상태 업데이트(Provider), setState와 같음, UI에서 분리
//   _imageList = await _repository.getImageModel(query);
//   _isLoading = false;
//   notifyListeners(); // 상태 업데이트(Provider), setState와 같음, UI에서 분리
// }
}
