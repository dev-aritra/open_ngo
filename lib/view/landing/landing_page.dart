import 'package:flutter/material.dart';
import 'package:open_ngo/styles/custom_colors.dart';
import 'package:open_ngo/view/charities/charities_page.dart';
import 'package:open_ngo/view/home/charities_list.dart';
import 'package:open_ngo/view/home/home_page.dart';
import 'package:open_ngo/view/utils/circular_dp.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPageIndex =0;

   List<Widget> pages;

  @override
    void initState() {
      super.initState();
      pages= [
        HomePage(),
        CharitiesPage()
      ];
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: pages[currentPageIndex],
      ),
      bottomNavigationBar: _bottomNavigationbar(),
    );
  }

  

  Widget _bottomNavigationbar() {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        primaryColor: CustomColors.darkBlue,
      ),
      child: BottomNavigationBar(
        onTap: _tapped,
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: CustomColors.darkBlue,
        items: <BottomNavigationBarItem>[
          _bottomBarItem(Icons.home, 'HOME'),
          _bottomBarItem(Icons.spa, 'CHARITIES'),
          _bottomBarItem(Icons.search, 'EXPLORE'),
          _bottomBarItem(Icons.person, 'PROFILE'),
        ],
        
      ),
    );
  }

  _tapped(int index){
    setState(() {
          currentPageIndex = index;
        });

  }

  BottomNavigationBarItem _bottomBarItem(IconData iconType, String text) {
    TextStyle textStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
    TextStyle test = textStyle.apply(color: Colors.black);

    return BottomNavigationBarItem(
      activeIcon: Icon(
        iconType,
        color: CustomColors.darkBlue,
        size: 20,
      ),
      title: Text(
        text,
        style: textStyle,
      ),
      icon: Icon(
        iconType,
        color: CustomColors.darkGrey,
        size: 20,
      ),
    );
  }
}
