import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notebook2/view/text_editor.dart';

class Console extends ConsumerWidget {
  const Console({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(controller);
    var watch = ref.watch(controller);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 180,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/wood_floor.jpg"),
            fit: BoxFit.cover,
          ), //DecorationImage
          border: Border.all(
            //color: Colors.green,
            width: 1,
          ), //Border.all
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(
                        eccentricity: 0.2,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.folder_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {},
                    )),
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.save_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {},
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.text_decrease,
                      ),
                      iconSize: 30,
                      onPressed: () => watch.fontDecrease(),
                    )),
                const SizedBox(width: 10),

                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text(
                      watch.fontSize.toString(),
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    )
                ),
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.text_increase,
                      ),
                      iconSize: 30,
                      onPressed: () => watch.fontIncrease(),
                    )),
                const SizedBox(width: 110),
                Container(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: Icon(
                    Icons.palette_sharp,
                    size: 50,
                    color: watch.fontColor,
                  ),),
                SizedBox(
                  width: 30,
                  child: PopupMenuButton(
                    icon: const Icon(Icons.arrow_drop_down_circle_sharp
                      ,color: Colors.white,size: 30,),
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return  [
                        PopupMenuItem(
                          value: '/black',
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(//DecorationImage
                              border: Border.all(
                                color: Colors.black,
                                width: 8,
                              ), //Border.all
                              borderRadius: BorderRadius.circular(15),
                              //BoxShadow
                            ),
                          ),
                          onTap: ()=> watch.changeFontColor('black'),

                        ),
                        PopupMenuItem(
                          value: '/blue',
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(//DecorationImage
                              border: Border.all(
                                color: Colors.blue,
                                width: 8,
                              ), //Border.all
                              borderRadius: BorderRadius.circular(15),
                              //BoxShadow
                            ),
                          ),
                          onTap: ()=> watch.changeFontColor('blue'),
                        ),
                        PopupMenuItem(
                          value: '/red',
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(//DecorationImage
                              border: Border.all(
                                color: Colors.red,
                                width: 8,
                              ), //Border.all
                              borderRadius: BorderRadius.circular(15),
                              //BoxShadow
                            ),
                          ),
                          onTap: ()=> watch.changeFontColor('red'),
                        )
                      ];
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      color: watch.isBold ? Colors.red : Colors.black,
                      icon: const Icon(
                        Icons.format_bold_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        read.changeIsBold();
                      },
                    )),
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      color: watch.isItalic ? Colors.red : Colors.black,
                      icon: const Icon(
                        Icons.format_italic_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        read.changeIsItalic();
                      },
                    )),
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      color: watch.isUnderline ? Colors.red : Colors.black,
                      icon: const Icon(
                        Icons.format_underline_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        read.changeIsUnderline();
                      },
                    )),
                const SizedBox(width: 40),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        color: watch.isAlignLeft ? Colors.red : Colors.black,
                        Icons.format_align_left_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        read.changeAlign('left');
                      },
                    )),
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        color: watch.isAlignJustify ? Colors.red : Colors.black,
                        Icons.format_align_justify_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        read.changeAlign('justify');
                      },
                    )),
                const SizedBox(width: 10),
                Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        color: watch.isAlignRight ? Colors.red : Colors.black,
                        Icons.format_align_right_sharp,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        read.changeAlign('right');
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),


          ],
        ),
      ),
    );
  }
}
