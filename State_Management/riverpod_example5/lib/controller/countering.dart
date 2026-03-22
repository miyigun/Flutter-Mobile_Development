import 'package:flutter_riverpod/flutter_riverpod.dart';

class Countering extends StateNotifier<int> {
  Countering(super.state);

  void increment()=> state++;
  void decrease()=> state--;
}