import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.live_tv_rounded),
              iconSize: 32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Takip Ediliyor",
                style: textTheme.bodyLarge,
              ),
              SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sizin İçin",
                    style: textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 4,
                      width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(CupertinoIcons.search),
            iconSize: 32,
          ),
        ],
      ),
    );
  }
}
