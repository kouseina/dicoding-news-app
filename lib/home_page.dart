import 'package:dicoding_news_app/platform_widget.dart';
import 'package:dicoding_news_app/settings_page.dart';
import 'package:dicoding_news_app/styles.dart';
import 'package:dicoding_news_app/widgets/article_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body:
          _bottomNavIndex == 0 ? const ArticleListPage() : const SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Headline',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: secondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Headline',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return const SettingsPage();
          default:
            return const ArticleListPage();
        }
      },
    );
  }
}
