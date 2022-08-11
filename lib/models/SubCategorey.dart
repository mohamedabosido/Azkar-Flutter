import 'package:azkar/models/Prayer.dart';

class SubCategory {
  final int id;
  final String name;
  final List<Prayer> prayers;

  SubCategory(this.id, this.name, this.prayers);
}
