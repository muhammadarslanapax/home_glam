import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_glam/views/account/account_screen.dart';
import 'package:home_glam/views/category/category_screen.dart';
import 'package:home_glam/views/chat/chat_screen.dart';
import 'package:home_glam/views/home/home_screen.dart';
import 'package:home_glam/widgets/bottomNav/bottomNav.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose(); 
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigation(
        onChangeScreen: (index) => _onNavItemTapped(index),
        screenIndex: _currentIndex,
        isTransparentBackground: true, 
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(), 
          controller: _pageController,
          children: const [
            HomeScreen(),
            CategoryScreen(),
            ChatScreen(),
            AccountScreen(),
          ],
        ),
      ),
    );
  }
}
