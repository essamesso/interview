import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_work/Models/Blog.dart';

class GetBlogServices {
  Future<List<BlogModel>> getBlogs() async {
    Response response = await get(
        Uri.parse('https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs'));
    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      List<BlogModel> blogs =
          (body as List).map((i) => BlogModel.fromJson(i)).toList();
      return blogs;
    } else {
      print("status code : ${response.statusCode}");
    }
  }

  Future<List<BlogModel>> getBlogById(int id) async {
    try {
      Response response = await get(Uri.parse(
          'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/${id.toString()}'));
      final body = json.decode(response.body);
      if (response.statusCode == 200) {
        List<BlogModel> singleblog =
            (body as List).map((i) => BlogModel.fromJson(i)).toList();
        return singleblog;
      } else {
        print("status code : ${response.statusCode}");
      }
    } catch (ex) {
      print('Ex : $ex');
    }
  }
}
