import 'package:flutter/material.dart';

import 'cached.dart';
import 'home.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List screens= const[
    Home(),
    CachedScreen()
  ];
  int selectIndex=0;
  IconData icon = Icons.home;
  IconData icon1= Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),
          bottom: Radius.circular(10),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          currentIndex: selectIndex,
          onTap: (index){
            selectIndex=index;
            icon1=selectIndex==1? Icons.favorite:Icons.favorite_border;
            icon=selectIndex==0? Icons.home:Icons.home_outlined;
            setState((){});
          },
          type:  BottomNavigationBarType.values.first,
          selectedFontSize: 18,
          selectedIconTheme: const IconThemeData(color: Colors.pink),
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedFontSize: 18,
          unselectedIconTheme: IconThemeData(color: Colors.pink.withOpacity(0.5)),
          unselectedItemColor: Colors.white.withOpacity(0.5),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: Icon(icon),
                 label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(icon1),
                label: "Favourites")
          ],
        ),
      ),
    );
  }
}
