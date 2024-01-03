import 'package:get_it/get_it.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';
import 'package:image_search_app_practice/data/repository/image_search_repositoryimpl.dart';
import 'package:image_search_app_practice/ui/main_screen_view_model.dart';

// 어디서든 접근 가능하게 작성
final getIt = GetIt.instance;

void diSetup() {
  // 싱글턴: 객체의 인스턴스를 1개만 생성
  // 전역에서 하나의 인스턴스만을 사용하도록 ImageSearchRepositoryImpl 인스턴스 생성
  // 동일한 repository 인스턴스를 공유
  getIt.registerSingleton<ImageSearchRepository>(ImageSearchRepositoryImpl());

  // 매번 새로운 인스턴스 생성
  // 필요할 때마다 새로운 MainScreenViewModel 인스턴스를 생성
  // repository 매개변수에 getIt<ImageSearchRepository>()를 통해 등록된 싱글턴 repository 주입
  getIt.registerFactory<MainScreenViewModel>(
      () => MainScreenViewModel(repository: getIt<ImageSearchRepository>()));
}
