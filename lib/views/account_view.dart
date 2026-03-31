import 'package:final_project/views/nav_bar_view.dart';
import 'package:final_project/widget/build_menu_in_account_view.dart';
import 'package:final_project/widget/show_bottom_sheet_logout.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final List<Map<String, dynamic>> menuItems = const [
    {'icon': Icons.person_outline, 'label': 'Edit Profile'},
    {'icon': Icons.favorite_outline, 'label': 'Favorite'},
    {'icon': Icons.notifications_none_outlined, 'label': 'Notifications'},
    {'icon': Icons.settings_outlined, 'label': 'Settings'},
    {'icon': Icons.help_outline, 'label': 'Help and Support'},
    {'icon': Icons.shield_outlined, 'label': 'Terms and Conditions'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'Profile',
      //     style: TextStyle(
      //       fontSize: 17,
      //       fontWeight: FontWeight.w700,
      //       color: Color(0xff1A1A2E),
      //     ),
      //   ),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Color(0xff374151),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Color(0xff1A1A2E),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Daniel Martinez',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1A1A2E),
                ),
              ),
              SizedBox(height: 4),
              Text(
                '+123 856479683',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
              ),
              BuildMenuInAccountView(
                icon: menuItems[0]['icon'],
                label: menuItems[0]['label'],
                ontap: () {},
              ),
              BuildMenuInAccountView(
                icon: menuItems[1]['icon'],
                label: menuItems[1]['label'],
                ontap: () {},
              ),
              BuildMenuInAccountView(
                icon: menuItems[2]['icon'],
                label: menuItems[2]['label'],
                ontap: () {},
              ),
              BuildMenuInAccountView(
                icon: menuItems[3]['icon'],
                label: menuItems[3]['label'],
                ontap: () {},
              ),
              BuildMenuInAccountView(
                icon: menuItems[4]['icon'],
                label: menuItems[4]['label'],
                ontap: () {},
              ),
              BuildMenuInAccountView(
                icon: menuItems[5]['icon'],
                label: menuItems[5]['label'],
                ontap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 4),
                  onTap: () {
                    showBottomSheetLogout(context);
                  },
                  leading: Icon(Icons.logout, color: Colors.red, size: 22),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.red.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
