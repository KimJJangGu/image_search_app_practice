import 'package:go_router/go_router.dart';
import 'package:image_search_app_practice/di/di_steup.dart';
import 'package:provider/provider.dart';
import 'package:image_search_app_practice/ui/main_screen.dart';
import 'package:image_search_app_practice/ui/main_screen_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
          create: (_) => getIt<MainScreenViewModel>(),
      child: MainScreen(),
      )
    )
  ]
);