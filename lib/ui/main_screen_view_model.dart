import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/main_state.dart';
import '../data/repository/image_search_repository.dart';

final class MainScreenViewModel extends ChangeNotifier {
  final ImageSearchRepository _repository;

  MainState _state = const MainState();
  MainState get state => _state;

  MainScreenViewModel({
    required ImageSearchRepository repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final results = (await _repository.getImageModel(query)).toList();
    _state = state.copyWith(
      isLoading: false,
      imageItems: results,
    );
    notifyListeners();
  }
}