import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/controllers/base_view_provider.dart';

class CustomBottomBar extends ConsumerWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSafeArea=MediaQuery.paddingOf(context).bottom;
    final textTheme=Theme.of(context).textTheme;
    final read=ref.read(baseViewProvider);
    final watch=ref.watch(baseViewProvider);
    return Container(
      padding: EdgeInsets.only(bottom: bottomSafeArea, top: 4),
      //Simgeler ekranın altındaki kısımdan yukarıda konumlanır
      height: 56+bottomSafeArea,
      width: double.infinity,
      color: Colors.black,
      child: Row(
        children: read.bottomBarItems.map((e) {
          final index=read.bottomBarItems.indexOf(e);
          final isEqual=index==watch.currentIndex;
          return Expanded(
            child: InkWell(
              onTap:  () => read.changePage(index),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(isEqual ? Colors.white : Colors.grey, BlendMode.srcIn),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.center ,
                  children: [
                    Icon(e.icon, size: e.text == null ? 44  : 30),
                    // "FittedBox" ile text ile ikonu bulunulan yere göre ayarlar
                    if(e.text!=null) FittedBox(
                        child: Text(
                          e.text!,
                          style: textTheme.bodySmall!.copyWith(color: Colors.white),
                        )
                    )
                  ],

                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

}