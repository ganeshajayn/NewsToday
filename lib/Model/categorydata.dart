import 'package:newstoday/Model/model.dart';

List<Categorymodel> getcategories() {
  List<Categorymodel> categories = [];

  Categorymodel category = Categorymodel();
  category.categoryname = "Science";

  categories.add(category);

  category = Categorymodel();
  category.categoryname = "Sports";

  categories.add(category);

  category = Categorymodel();
  category.categoryname = "Business";

  categories.add(category);

  category = Categorymodel();
  category.categoryname = "General";

  categories.add(category);

  category = Categorymodel();
  category.categoryname = "Health";

  categories.add(category);

  category = Categorymodel();
  category.categoryname = "Entertainment";

  categories.add(category);

  return categories;
}
