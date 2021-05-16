import 'package:flutter/material.dart';
import 'package:test_work/Models/Blog.dart';

class DetailsScreen extends StatelessWidget {
  final BlogModel blogModel;

  const DetailsScreen({Key key, this.blogModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            blogModel.imageUrl,
            height: 200,
            width: double.infinity,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Hero(
                tag: blogModel.id,
                child: Image.network(
                    'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              );
            },
          ),
          Text('title :${blogModel.title}'),
          Spacer(),
          Text('Date :${blogModel.createdAt.toString()}'),
        ],
      ),
    );
  }
}
