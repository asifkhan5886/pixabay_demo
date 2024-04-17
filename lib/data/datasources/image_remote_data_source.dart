import 'package:pixabay_demo/data/models/image_model.dart';

abstract class ImageRemoteDataSource {
  Future<List<Hits>> fetchImages();
}