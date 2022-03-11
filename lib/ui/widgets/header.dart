import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30.0,
            ),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        // const CustomIcon(icon: Icons.mail_outline),
        const Profile(),

        // if (!Responsive.isMobile(context))
        // const Expanded(child: SearchField()),
        // if (Responsive.isDesktop(context))
        // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
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

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) => const ProfileCard(),
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
          width: 250,
          height: 180,
          arrowHeight: 10,
          arrowWidth: 20,
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            child: Image.asset('assets/images/man.png'),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(Icons.remove_red_eye_outlined, 'Active'),
             const  SizedBox(
                width: 20.0,
              ),
              CustomElevatedButton(
                  Icons.visibility_off_outlined, 'Invisible'),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                child: Image.asset('assets/images/man.png'),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  Text('Husna Javed'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('Intern'),
                ],
              ),
            ],
          ),
          CustomElevatedButton(Icons.settings, 'Settings'),
          CustomElevatedButton(Icons.logout, 'Logout')
        ],
      ),
    );
  }
}

Widget CustomElevatedButton(IconData icon, String label) {
  return ElevatedButton.icon(
    icon: Icon(icon),
    label: Text(label),
    style: ElevatedButton.styleFrom(
      primary: buttonColor,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(35.0),
      // ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
    ),
    onPressed: () {},
  );
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
