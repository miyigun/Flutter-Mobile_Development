import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscoverView extends ConsumerWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return Center(
      child: Text("Discover"),
    );
  }
}
