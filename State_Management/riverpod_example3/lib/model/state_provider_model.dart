import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProviderInteger = StateProvider<int>((ref) {
  return 100;
});

final stateProviderName = StateProvider<String>((ref) {
  return 'Murat';
});

final stateProviderCity = StateProvider<String>((ref) {
  return 'Los Angeles';
});

class StateProviderModel {
  String _littleMonk = '';
  int _ageOfLittleMonk = 0;

  String get littleMonk => _littleMonk;
  int get ageOfLittleMonk => _ageOfLittleMonk;

  StateProviderModel(this._littleMonk, this._ageOfLittleMonk);
}

final stateProviderClass = StateProvider<StateProviderModel>((ref) {
  return StateProviderModel('I am a Little Monk', 6);
});
