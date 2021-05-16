import 'package:flutter/cupertino.dart';
import 'package:test_work/Models/Blog.dart';
import 'package:test_work/Services/blog_services.dart';

class BlogListViewModel  extends ChangeNotifier{
  List <BlogModel> _listblog = [];
   List <BlogModel> _listblogbycategory = [];

   fetchblog() async {
     _listblog = await GetBlogServices().getBlogs();
     notifyListeners();
   }
   fetchblogbyID(int id) async {
     _listblogbycategory = await GetBlogServices().getBlogById(id);
     notifyListeners();
   }

   List <BlogModel> get blogslist =>_listblog;
      List <BlogModel> get blogslistbyid =>_listblogbycategory;


}