import 'package:image_search_app_practice/data/model/image.dart';
import 'package:image_search_app_practice/data/repository/image_search_repository.dart';

class MockImageSearchRepository implements ImageSearchRepository {

  @override
  Future<List<ImageModel>> getImageModel(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == '야구'){
      return [
        ImageModel(
          imageUrl: "https://pixabay.com/vectors/baseball-ball-sport-round-25761/",
          tags: '',
        ),
        ImageModel(
          imageUrl: "https://pixabay.com/vectors/baseball-ball-sport-round-game-157928/",
          tags: '',
        ),
        // ImageModel(
        //   imageUrl: "https://pixabay.com/photos/softball-baseball-ball-sport-game-372979/",
        //   tags: '',
        // ),
      ];
    } else {
      return [
        ImageModel(
          imageUrl: "https://pixabay.com/photos/puppy-pet-canine-dog-animal-lying-2785074/",
          tags: '',
        ),
        ImageModel(
          imageUrl: "https://pixabay.com/vectors/dog-animal-domestic-animal-doggie-1728494/",
          tags: '',
        ),
      ];
    }
  }
}