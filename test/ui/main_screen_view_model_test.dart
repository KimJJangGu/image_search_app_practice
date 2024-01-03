import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';
import 'package:image_search_app_practice/di/di_steup.dart';
import 'package:image_search_app_practice/ui/main_screen_view_model.dart';

void main() {
  setUp(() {
    getIt.registerSingleton<ImageSearchRepository>(MockRepository());

    getIt.registerFactory(
            () => MainScreenViewModel(repository: getIt<ImageSearchRepository>()));
  });

  test('이미지는 3개만 반환되어야 한다', () async {
    final viewModel = getIt<MainScreenViewModel>();

    expect(viewModel.state.imageModel.length, 0);

    await viewModel.searchImage('query');

    expect(viewModel.state.imageModel.length, 3);
  });
}

class MockRepository implements ImageSearchRepository {
  @override
  Future<List<ImageModel>> getImageModel(String query) async {
    return List.generate(20, (index) =>
        ImageModel(
            imageUrl:
            "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
            tags: ''));
  }
}
