import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notebook2/view/text_editor.dart';

class PageScreen extends ConsumerWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch=ref.watch(controller);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          image: const DecorationImage(
            opacity: 0.4,
            image: AssetImage("assets/images/page.jpg"),
            fit: BoxFit.cover,
          ), //DecorationImage
          border: Border.all(
            //color: Colors.green,
            width: 1,
          ), //Border.all
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            child: TextField(
              textAlign: watch.textAlign,
              maxLines: (MediaQuery.of(context).size.height*0.7).toInt(),
              maxLength: (MediaQuery.of(context).size.width*1.8)~/watch.fontSize,
              style: TextStyle(
                  color: watch.fontColor,
                fontSize: watch.fontSize.toDouble(),
                fontWeight: watch.isBold ? FontWeight.bold : FontWeight.normal,
                fontStyle: watch.isItalic ? FontStyle.italic : FontStyle.normal,
                decoration: watch.isUnderline ? TextDecoration.underline : TextDecoration.none,


              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counter: Text('')
              ),
            ),
          ),
        ),
      ),
    );
  }

}