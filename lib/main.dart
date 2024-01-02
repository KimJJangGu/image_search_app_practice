import 'package:flutter/material.dart';
import 'package:image_search_app_practice/ui/main_screen.dart';
import 'package:image_search_app_practice/ui/main_screen_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '이미지 검색 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider( // 상태 관리를 설정

        // MainScreenViewModel 클래스의 인스턴스를 생성
        // ChangeNotifier를 상속하므로 상태 변화를 인지하고 UI를 업데이트 가능
        create: (_) => MainScreenViewModel(),
        child: MainScreen(), // 하위에 MainScreen을 배치하여 UI를 구성
      ),
    );
  }
}
