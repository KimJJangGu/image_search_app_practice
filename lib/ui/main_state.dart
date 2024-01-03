import 'package:image_search_app_practice/data/model/image.dart';

class MainState {
  final List<ImageModel> imageModel;

  final bool isLoading;

//<editor-fold desc="Data Methods">
  const MainState({
    required this.imageModel,
    required this.isLoading,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MainState &&
          runtimeType == other.runtimeType &&
          imageModel == other.imageModel &&
          isLoading == other.isLoading);

  @override
  int get hashCode => imageModel.hashCode ^ isLoading.hashCode;

  @override
  String toString() {
    return 'MainState{ imageModels: $imageModel, isLoading: $isLoading,}';
  }

  MainState copyWith({
    List<ImageModel>? imageModels,
    bool? isLoading,
  }) {
    return MainState(
      imageModel: imageModels ?? this.imageModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageModels': imageModel,
      'isLoading': isLoading,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      imageModel: map['imageModels'] as List<ImageModel>,
      isLoading: map['isLoading'] as bool,
    );
  }

//</editor-fold>
}
