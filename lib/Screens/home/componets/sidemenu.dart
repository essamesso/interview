import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:test_work/widgets/DefaultButton.dart';

import '../../../resposive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (Responsive.isMobile(context)) CloseButton(),
                ],
              ),
              Card(
                child: ListTile(
                  title: Text('test1'),
                  trailing: Icon(Icons.all_inbox_outlined),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
                 Card(
                child: ListTile(
                  title: Text('test2'),
                  trailing: Icon(Icons.all_inbox_outlined),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),

              // Tags
            ],
          ),
        ),
      ),
    );
  }
}
