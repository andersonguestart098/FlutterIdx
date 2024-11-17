import 'package:flutter/material.dart';
import 'package:myapp/components/ButtonsNav.dart';
import 'package:myapp/views/home_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        bottomNavigationBar: ButtonNav(
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
            _pageController.jumpToPage(index);
          },
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 30,
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage('https://example.com/user_profile.jpg'),
              radius: 20,
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: PageView(
          controller: _pageController,
          children: [
            HomePage2(),
            Center(
              child: Text("Page 2"),
            ),
            Center(
              child: Text("Page 3"),
            ),
          ],
        ));
  }
}
