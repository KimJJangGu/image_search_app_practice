import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/ui/main_screen_view_model.dart';
import 'package:image_search_app_practice/ui/widget/image_model_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      context.read<MainScreenViewModel>().getImageList(_textEditingController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              viewModel.isLoading
              ? const Center(child: CircularProgressIndicator(),)
                  :Expanded(
                child: GridView.builder(
                  itemCount: viewModel.imageList.length,
                  itemBuilder: (context, index) {
                    final ImageModel imageModel = viewModel.imageList[index];
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