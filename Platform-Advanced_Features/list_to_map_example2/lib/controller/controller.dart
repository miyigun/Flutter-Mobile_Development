import 'package:list_to_map_example2/controller/data.dart';

class Controller {
  var map1 = {for (var e in students) e.name: e.age};

  var map2 = students.asMap().entries.map((e) => e.value);

  var map3 = students.asMap().entries.map((e) => e.key);
}
