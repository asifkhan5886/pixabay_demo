import 'package:pixabay_demo/data/datasources/image_remote_data_source.dart';
import 'package:pixabay_demo/data/models/image_model.dart';
import 'package:pixabay_demo/data/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource;

  ImageRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Hits>> fetchImages() async {
    try {
      return await remoteDataSource.fetchImages();
    } catch (e) {
      throw Exception('Failed to fetch Images: $e');
    }
  }
}