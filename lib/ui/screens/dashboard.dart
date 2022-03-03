import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/ui/widgets/audience.dart';
import 'package:ui/ui/widgets/header.dart';
import 'package:ui/ui/widgets/stats.dart';
import 'package:ui/utils/responsive.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
           const  Header(),
            const SizedBox(height: defaultPadding),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       flex: 5,
            //       child: Column(
            //         children: [
            //         //  const Stats(),
            //           const SizedBox(height: defaultPadding),
            //           const Audience(),
            //           if (Responsive.isMobile(context))
            //           const SizedBox(height: defaultPadding),
            //         ],
            //       ),
            //     ),
            //     if (!Responsive.isMobile(context))
            //       const SizedBox(width: defaultPadding),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
