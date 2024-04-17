import 'package:pixabay_demo/data/models/image_model.dart';

abstract class ImageRepository {
  Future<List<Hits>> fetchImages();
}