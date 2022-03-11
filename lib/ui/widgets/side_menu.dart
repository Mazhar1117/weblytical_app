import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff101480),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/login.png'),
          ),
          DrawerListTile(
            title: "Profile",
            icon: Icons.home,
            press: () {},
          ),
          DrawerListTile(
            title: "Diagnostic",
            icon: Icons.home,
            press: () {},
          ),
        
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: buttonColor,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
