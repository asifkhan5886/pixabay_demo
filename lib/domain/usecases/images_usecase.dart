import 'package:pixabay_demo/data/models/image_model.dart';
import 'package:pixabay_demo/data/repositories/image_repository.dart';

class GetImages {
  final ImageRepository repository;

  GetImages(this.repository);

  Future<List<Hits>> call() async {
    return await repository.fetchImages().then((posts) => posts.map((post) => post).toList());
  }
}