import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example3/model/state_provider_model.dart';

void increment(WidgetRef ref) {
  final stateProviderIntegerRead = ref.read(stateProviderInteger.notifier);
  stateProviderIntegerRead.state++;
}

void changeName(WidgetRef ref) {
  final stateProviderNameRead = ref.read(stateProviderName.notifier);
  stateProviderNameRead.state = 'Gozde!';
}

void changeCity(WidgetRef ref) {
  final stateProviderCityRead = ref.read(stateProviderCity.notifier);
  stateProviderCityRead.state = 'Jericho';
}

void clearName(WidgetRef ref) {
  final stateProviderNameRead = ref.read(stateProviderName.notifier);
  stateProviderNameRead.state = 'Murat!';
}

void clearCity(WidgetRef ref) {
  final stateProviderCityRead = ref.read(stateProviderCity.notifier);
  stateProviderCityRead.state = 'Los Angeles';
}

void changeLittleMonk(WidgetRef ref) {
  final stateProviderClassRead = ref.read(stateProviderClass.notifier);
  stateProviderClassRead.state =
      StateProviderModel('Now I am a big monk with white beard!', 70);
}

void reverseAgeOfLittleMonk(WidgetRef ref) {
  final stateProviderClassRead = ref.read(stateProviderClass.notifier);
  stateProviderClassRead.state =
      StateProviderModel('Now I am a little monk again!', 6);
}
