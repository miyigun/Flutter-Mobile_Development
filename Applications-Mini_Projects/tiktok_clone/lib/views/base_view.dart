import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/controllers/base_view_provider.dart';
import 'package:tiktok_clone/widgets/custom_bottom_bar.dart';

class BaseView extends ConsumerWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar() ,
      body: ref.watch(baseViewProvider).body
    );
  }
}
