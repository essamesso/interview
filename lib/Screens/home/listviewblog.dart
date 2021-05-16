import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/Models/Blog.dart';
import 'package:test_work/ViewModels/BloglistViewModel.dart';
import 'package:test_work/widgets/BlogCard.dart';

class ListViewBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BlogModel> listblog =
        Provider.of<BlogListViewModel>(context).blogslist;
    return listblog.isNotEmpty? ListView.builder(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      itemCount: listblog.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return BlogCard(
          blogModel: listblog[i],
        );
      },
    ):Center(child: CircularProgressIndicator());
  }
}
