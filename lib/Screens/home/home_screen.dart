import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/Screens/home/componets/sidemenu.dart';
import 'package:test_work/Screens/home/listviewblog.dart';
import 'package:test_work/ViewModels/BloglistViewModel.dart';
import 'package:test_work/resposive.dart';

class HomeScreen extends StatefulWidget {
  final int token;

  const HomeScreen({Key key, this.token}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Provider.of<BlogListViewModel>(context, listen: false).fetchblog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
        leading: Responsive.isMobile(context)
            ? IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldkey.currentState.openDrawer();
                },
              )
            : SizedBox.shrink(),
      ),
      body: SafeArea(
          child: Responsive(
        desktop: Row(
          children: [
            Expanded(flex: 4, child: SideMenu()),
            Expanded(
              flex: 6,
              child: ListViewBlog(),
            )
          ],
        ),
        mobile: ListViewBlog(),
        tablet: Row(
          children: [
            Expanded(flex: 4, child: SideMenu()),
            Expanded(
              flex: 6,
              child: ListViewBlog(),
            )
          ],
        ),
      )),
    );
  }
}
