import 'package:azkar/models/SubCategorey.dart';

class Category {
  final int id;
  final String image;
  final String name;
  final List<SubCategory> subCategory;

  Category(this.id, this.image, this.name, this.subCategory);
}
