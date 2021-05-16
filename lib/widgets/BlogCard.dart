import 'package:flutter/material.dart';
import 'package:test_work/Models/Blog.dart';
import 'package:test_work/Screens/details/DetailsScreen.dart';

class BlogCard extends StatelessWidget {
  final BlogModel blogModel;

  const BlogCard({Key key, this.blogModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            blogModel.imageUrl,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Hero(
                tag: blogModel.id,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              );
            },
          ),
          title: Text(blogModel.title),
          subtitle: Text(blogModel.createdAt.toString()),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DetailsScreen(
                blogModel: blogModel,
              ),
            ));
          },
        ));
  }
}
