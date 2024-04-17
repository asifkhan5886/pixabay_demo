import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_demo/common_widges/app_image_widget.dart';
import 'package:pixabay_demo/common_widges/image_viewer.dart';
import 'package:pixabay_demo/presentation/images_controller.dart';

class ImagesPage extends StatelessWidget {
  final ImagesController controller = Get.put(ImagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Gallery App"),
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => controller.isLoading.value
                ? const CircularProgressIndicator()
                // : ListView.builder(
                //     itemCount: controller.posts.length,
                //     itemBuilder: (context, index) {
                //       final post = controller.posts[index];
                //       return ListTile(
                //         title: Text((post.likes ?? 0).toString()),
                //         subtitle: Text((post.views ?? 0).toString()),
                //       );
                //     },
                //   ),
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _calculateCrossAxisCount(context),
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      final imageData = controller.images[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ImageViewer(heroTag:  imageData.largeImageURL??'', image: imageData.largeImageURL??'')),
                          );
                        },
                        child: Hero(
                          tag:  imageData.largeImageURL??'',
                          child: GridTile(
                            footer: GridTileBar(
                              backgroundColor: Colors.black54,
                              title: Text('Likes: ${imageData.likes??0}'),
                              subtitle: Text('Views: ${imageData.views??0}'),
                            ),
                            child:
                            AppImageWidget(
                                imageUrl:imageData.largeImageURL??'', fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 150.0; // Adjust item width according to your preference
    return (screenWidth / itemWidth).floor();
  }
}
