import 'package:list_to_map_example/controller/data.dart';

class Controller {

  void toMap(){

    var map1={
      for (var e in students)
        e.name: e.age
    };

    print(map1);

    var map2=students.asMap().entries.map((e) => e.value);

    print(map2);

    var map3=students.asMap().entries.map((e) => e.key);

    print(map3);

    var map4=students.asMap().entries.map((e) => e.key);

    print(map4.toList().length);

  }
}