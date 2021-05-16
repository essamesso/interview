import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/Models/Blog.dart';
import 'package:test_work/ViewModels/BloglistViewModel.dart';
import 'package:test_work/widgets/BlogCard.dart';

class HomeScreen extends StatefulWidget {
  final int token;

  const HomeScreen({Key key, this.token}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<BlogListViewModel>(context, listen: false).fetchblog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BlogModel> listblog =
        Provider.of<BlogListViewModel>(context).blogslist;
    return Scaffold(
      appBar: AppBar(title: Text('home'),
      centerTitle: true,),
      body: SafeArea(
        child: listblog.isNotEmpty?ListView.builder(
          padding: EdgeInsets.all(0.0),
          shrinkWrap: true,
          itemCount: listblog.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return BlogCard(
              blogModel: listblog[i],
            );
          },
        ):Center(child: CircularProgressIndicator())
      ),
    );
  }
}
