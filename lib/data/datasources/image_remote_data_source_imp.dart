import 'dart:convert';

import 'package:pixabay_demo/data/datasources/image_remote_data_source.dart';
import 'package:pixabay_demo/data/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  @override
  Future<List<Hits>> fetchImages() async {
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=43435808-cd5d5c6ccdfe430d46f80975a&q=yellow+flowers&image_type=photo'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      ImagesRes imagesRes=ImagesRes.fromJson(result);
      return imagesRes.hits??[];
    } else {
      throw Exception('Failed to load images');
    }
  }
}