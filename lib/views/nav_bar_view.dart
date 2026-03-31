import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/views/account_view.dart';
import 'package:final_project/views/calendar_view.dart';
import 'package:final_project/views/home_view.dart';
import 'package:final_project/views/map_view.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List pages = [HomeView(), MapView(), CalendarView(), AccountView()];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xff9CA3AF),
        currentIndex: currentPageIndex,
        selectedFontSize: 10,
        selectedItemColor: Color(0xff4B5563),
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
