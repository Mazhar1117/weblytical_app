import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/utils/menu_controller.dart';
import 'package:ui/utils/responsive.dart';



class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu, size: 30.0,),
            onPressed: context.read<MenuController>().controlMenu,
          ),

        // if (!Responsive.isMobile(context))
        const Expanded(child: SearchField()),
        // if (Responsive.isDesktop(context)) 
          // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const CustomIcon(icon: Icons.mail_outline),
        const ProfileCard(),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {},
        child: Icon(
          icon,
          color: Colors.grey,
          size: 30.0,
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
       CircleAvatar(
          radius: 15.0,
          child: Text('DP'),
        ),
        Icon(Icons.keyboard_arrow_down),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextField(
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          hintText: "Search",
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
