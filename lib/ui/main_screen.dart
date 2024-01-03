import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/ui/main_screen_view_model.dart';
import 'package:image_search_app_practice/ui/widget/image_model_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // watch: 상태 변화를 관찰
    // notifyListeners가 호출되면 context.watch를 사용하는 위젯에 변경사항을 전파하여 위젯을 갱신
    // context.watch<MainScreenViewModel>()를 사용하여 생성한 AppState의 상태 객체에 접근
    final viewModel = context.watch<MainScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
        titleTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                  hintText: '검색어를 입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.blue,
                    onPressed: () {
                      // 검색 버튼 누르면 이미지 가져오기
                      context.read<MainScreenViewModel>().searchImage(_textEditingController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              viewModel.state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.state.imageItems.length,
                        itemBuilder: (context, index) {
                          final ImageModel imageModel = viewModel.state.imageItems[index];
                          return ImageModelWidget(imageModel: imageModel);
                        },
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
