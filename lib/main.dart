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
      home: ChangeNotifierProvider(
        create: (_) => MainScreenViewModel(),
        child: const MainScreen(),
      ),
    );
  }
}
