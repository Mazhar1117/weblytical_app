import 'package:flutter/material.dart';
import 'package:ui/constants/constants.dart';
import 'package:ui/models/stats_model.dart';


class StatInfoCard extends StatelessWidget {
  const StatInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final StatsInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration:  BoxDecoration(
        color:  Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration:const BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                ),
                child: info.icon,
              ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
          Text(
            info.totalCount!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black),
          ),
          Divider(),
          
         
        ],
      ),
    );
  }
}

