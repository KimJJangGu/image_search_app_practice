import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app_practice/core/result.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/ui/main_event.dart';
import 'package:image_search_app_practice/ui/main_state.dart';
import '../data/repository/image_search_repository.dart';

final class MainScreenViewModel extends ChangeNotifier {
  final ImageSearchRepository _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  MainScreenViewModel({
    required ImageSearchRepository repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final result = await _repository.getImageModel(query);

    switch (result) {
      case Success<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.toList(),
        );
        notifyListeners();
        _eventController.add(MainEvent.showSnackBar('검색 완료'));
      case Error<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
        );
        notifyListeners();
        _eventController.add(MainEvent.showSnackBar('ㅋ 에 러 발 생 ㅋ'));
      case Loading<List<ImageModel>>():
    }
  }
}
