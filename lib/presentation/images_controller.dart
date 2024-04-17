import 'package:get/get.dart';
import 'package:pixabay_demo/data/datasources/image_remote_data_source_imp.dart';
import 'package:pixabay_demo/data/models/image_model.dart';
import 'package:pixabay_demo/data/repositories/image_repository_imp.dart';
import 'package:pixabay_demo/domain/usecases/images_usecase.dart';

class ImagesController extends GetxController {
  final isLoading = true.obs;
  final images = <Hits>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  void fetchImages() async {
    isLoading(true);
    final postRepository = ImageRepositoryImpl(ImageRemoteDataSourceImpl());
    final getPosts = GetImages(postRepository);
    final fetchedPosts = await getPosts();
    images.assignAll(fetchedPosts);
    isLoading(false);
  }
}